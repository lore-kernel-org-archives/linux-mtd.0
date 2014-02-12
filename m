Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDX6P-0005K2-KL
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2014 10:31:39 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v7 3/6] mtd: nand: omap: ecc.correct:
 omap_elm_correct_data: fix erased-page detection for BCHx_HW ECC schemes
Date: Wed, 12 Feb 2014 10:31:02 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA6FB16@DBDE04.ent.ti.com>
References: <1389942797-4632-1-git-send-email-pekon@ti.com>
 <1389942797-4632-4-git-send-email-pekon@ti.com>
 <20140211213457.GM18440@ld-irv-0074>
In-Reply-To: <20140211213457.GM18440@ld-irv-0074>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 "Balbi, Felipe" <balbi@ti.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

>From: Brian Norris [mailto:computersforpeace@gmail.com]
>>On Fri, Jan 17, 2014 at 12:43:14PM +0530, Pekon Gupta wrote:
>> As erased-pages do not have ECC stored in their OOB area, so they need t=
o be
>> seperated out from programmed-pages, before doing BCH ECC correction.
>>
>> In current implementation of omap_elm_correct_data() which does ECC corr=
ection
>> for BCHx ECC schemes, this erased-pages are detected based on specific m=
arker
>> byte (reserved as 0x00) in ecc-layout.
>> However, this approach has some limitation like;
>>  1) All ecc-scheme layouts do not have such Reserved byte marker to
>>     differentiate between erased-page v/s programmed-page. Thus this is =
a
>>     customized solution.
>>  2) Reserved marker byte can itself be subjected to bit-flips causing
>>     erased-page to be misunderstood as programmed-page.
>>
>> This patch removes dependency on any marker byte in ecc-layout, to diffe=
rentiate
>> between erased-page v/s programeed-page. Instead a page is considered er=
ased if
>>  (a) all(OOB)  =3D=3D 0xff, .i.e., number of zero-bits in read_ecc[] =3D=
=3D 0
>>  (b) number of zero-bits in (Data + OOB) is less than ecc-strength
>>
>> This patch also adds a generic function count_zero_bits(), to find numbe=
r of
>> bits which are '0' in given buffer. This function is optimized for compa=
ring
>> read-data with 0xff.
>>
>> Signed-off-by: Pekon Gupta <pekon@ti.com>
>> ---

[...]

>> +/**
>>   * omap_elm_correct_data - corrects page data area in case error report=
ed
>>   * @mtd:	MTD device structure
>>   * @data:	page data
>> @@ -1359,14 +1383,21 @@ static int omap_elm_correct_data(struct mtd_info=
 *mtd, u_char *data,
>>  {
>>  	struct omap_nand_info *info =3D container_of(mtd, struct omap_nand_inf=
o,
>>  			mtd);
>> -	int eccbytes	=3D info->nand.ecc.bytes;
>> -	int eccsteps =3D info->nand.ecc.steps;
>> +	struct nand_ecc_ctrl *ecc =3D &info->nand.ecc;
>> +	int eccstrength		=3D ecc->strength;
>> +	int eccsize		=3D ecc->size;
>> +	int eccbytes		=3D ecc->bytes;
>> +	int eccsteps		=3D ecc->steps;
>
>When I recommended adding the 'ecc' variable (as you did), I was
>suggesting you drop the next 4 variables. You don't need them when you
>can (with just as few characters) refer to ecc->field directly and
>easily. Stick with one or ther other -- the 4 local variables or the 1
>ecc pointer -- but you don't need both.
>
Oh sorry.. I misunderstood that. I'll fix this in next version.


>> @@ -1410,24 +1441,47 @@ static int omap_elm_correct_data(struct mtd_info=
 *mtd, u_char *data,
>>  		}
>>
>>  		if (eccflag =3D=3D 1) {
>> -			/*
>> -			 * Set threshold to minimum of 4, half of ecc.strength/2
>> -			 * to allow max bit flip in byte to 4
>> -			 */
>> -			unsigned int threshold =3D min_t(unsigned int, 4,
>> -					info->nand.ecc.strength / 2);
>> +			bitflip_count =3D 0;
>> +			/* count zero-bits in OOB region */
>> +			err =3D count_zero_bits(read_ecc, eccbytes,
>> +						 eccstrength, &bitflip_count);
>> +			if (err) {
>> +				/*
>> +				 * number of zero-bits in OOB > ecc-strength
>> +				 * either un-correctable or programmed-page
>> +				 */
>> +				page_is_erased =3D false;
>> +			} else if (bitflip_count =3D=3D 0) {
>> +				/* OOB =3D=3D all(0xff) */
>> +				page_is_erased =3D true;
>
>This else-if is still incorrect. You cannot assume that just because the
>OOB is all 0xff that the page is erased.
>
Now this part is most important, where I would like to get more clarity
and feedback before I proceed.
----------------------------
if OOB of an page is =3D=3D all(0xff)
(a) As per general NAND spec, chip->write_buf() _only_ fills the internal b=
uffers of
 NAND device's with information to be written. Actual write to NAND array c=
ells
 happen only after 'NAND_CMD_PAGEPROG' or 'NAND_CMD_CACHEDPROG' is issued.
 Thus both Main-area and OOB-area are programmed simultaneously inside NAND=
 device.
 if there is any disruption (like power-cut) in on-going  NAND_CMD_PAGEPROG
 cycle, then the data should be assumed to be garbage, and it may have un-s=
table bits.

(b) if OOB=3D=3Dall(0xff) then there is _no_ ECC stored in OOB to check the=
 read_data
  Hence driver cannot distinguish between genuine data and bit-flips.

Now based on (a) & (b), it's safe to assume that:
if (OOB =3D=3D all 0xff)
	/* page has no-data | garbage-data*/
Agree ?
(This is where I call it page_is_erased=3D=3Dtrue, Though I could have used=
 better
variable name as page_has_no_valid_data =3D true).
----------------------------

And also, driver should return 'total number zero-bits in both Main-area + =
OOB'
if (0 < 'total number of zero-bits in both OOB + DATA region' < mtd->bitfli=
p_threshold)
	return -EUCLEAN;=20
else
	return -EBADMSG;

** However there is a bug in current patch version which I just figured out=
.
I don't include the number of zero-bits of Main-area, if OOB=3D=3Dall(0xff)=
.
 +			} else if (bitflip_count =3D=3D 0) {
 +				/* OOB =3D=3D all(0xff) */
 +				page_is_erased =3D true;
 +  /* missing */		bitflip_count +=3D count_zero_bits(buf, eccsize,
 +					  		eccstrength, &bitflip_count);
------------------------

>> +			} else {
>> +				/*
>> +				 * OOB has some bits as '0' but
>> +				 * number of zero-bits in OOB < ecc-strength.
>> +				 * It may be erased-page with bit-flips so,
>> +				 * further checks are needed for confirmation
>> +				 */
>> +				/* count zero-bits in DATA region */
>> +				buf =3D &data[eccsize * i];
>> +				err =3D count_zero_bits(buf, eccsize,
>> +						 eccstrength, &bitflip_count);
>> +				if (err) {
>> +					/*
>> +					 * total number of zero-bits in OOB
>> +					 * and DATA exceeds ecc-strength
>> +					 */
>> +					page_is_erased =3D false;
>> +				} else {
>> +					/* number of zero-bits < ecc-strength */
>> +					page_is_erased =3D true;
>> +				}
>> +			}
>
>This whole block (where you call count_zero_bits() twice) is a
>convoluted and buggy way of just doing the following, AFAIU:
>
>	page_is_erased =3D !count_zero_bits(read_ecc, ecc->bytes,
>				ecc->strength, &bitflip_count) &&
>			 !count_zero_bits(&data[ecc->size * i], ecc->size,
>			 	ecc->strength, &bitflip_count);
>
>You could modify that to your liking and add a comment, but it's much
>more concise than your version, and from what I can tell, it's actually
>correct.
>
Firstly, In you above statement    's/&&/||'
because as per above statement, if count_zero_bits(oob) =3D=3D 0, then
my patch assumes 'page_has_no_valid_data =3D true'.

page_is_erased =3D !count_zero_bits(read_ecc, ecc->bytes,
				ecc->strength, &bitflip_count) ||
			 !count_zero_bits(&data[ecc->size * i], ecc->size,
			 	ecc->strength, &bitflip_count);


Secondly, You are missing the that here NAND driver is relaxing the limit o=
f
number-of-acceptable bit-flips in an erased-page, because some MLC and=20
Toshiba SLC NANDs show bit-flips almost on every second already erased-page=
.
>> +				if (err) {
>> +					/*
>> +					 * total number of zero-bits in OOB
>> +					 * and DATA exceeds ecc-strength
>> +					 */
>> +					page_is_erased =3D false;
>> +				} else {
>> +					/* number of zero-bits < ecc-strength */
>> +					page_is_erased =3D true;
>> +				}

In above patch I can replace ecc->strength with mtd->bitflip_threshold
to make it more user controllable. As bitflip_threshold is configurable via
/sys/class/mtd/mtdX/bitflip_threshold
What is your opinion ?


This was also the basis of my question to Artem [1]

 [1] http://lists.infradead.org/pipermail/linux-mtd/2014-January/051556.htm=
l

With regards, pekon
