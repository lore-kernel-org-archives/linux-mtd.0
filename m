Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W3YZU-00053S-P4
 for linux-mtd@lists.infradead.org; Wed, 15 Jan 2014 22:04:25 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH v6 3/6] mtd: nand: omap: ecc.correct:
 omap_elm_correct_data: fix erased-page bit-flip correction for H/W ECC
 schemes
Date: Wed, 15 Jan 2014 22:03:52 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA620F4@DBDE04.ent.ti.com>
References: <1388803698-26252-1-git-send-email-pekon@ti.com>
 <1388803698-26252-4-git-send-email-pekon@ti.com>
 <20140114040554.GB8919@ld-irv-0074>
In-Reply-To: <20140114040554.GB8919@ld-irv-0074>
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

Thanks for your feedbacks. Your review helps a lot.

>From: Brian Norris [mailto:computersforpeace@gmail.com]
>>On Sat, Jan 04, 2014 at 08:18:15AM +0530, Pekon Gupta wrote:
>> chip->ecc.correct() is used for detecting and correcting bit-flips durin=
g read
>> operations. In OMAP NAND driver different ecc-schemes have different cal=
lbacks:
>>  - omap_correct_data()		for HAM1_HW ecc-schemes (Untouched)
>>  - nand_bch_correct_data()	for BCHx_HW_DETECTION_SW ecc-schemes (Untouch=
ed)
>>  - omap_elm_correct_data()	for BCHx_HW ecc-schemes (updated)
>>
>> This patch solves following problems in ECC correction for BCHx_HW ecc-s=
chemes.
>> Problem: In current implementation, number of bit-flips in erased-pages =
is
>>          calculated comparing each byte of Data & OOB with 0xff in
>>          function check_erased_page().
>>          But, with growing density of NAND devices (especially for MLC N=
AND)
>>          where pagesize is of 4k or more bytes, occurence of bit-flips i=
s
>>          very common. Thus comparing each byte of both main-area and OOB
>>          with 0xff decreases NAND performance due to CPU overhead.
>
>But the overhead from this check is only incurred if you are getting
>uncorrectable errors, right? This shouldn't commonly occur on programmed
>pages, so you're only focusing on high number of bitflips in erased
>pages. But UBIFS reads erased pages only when trying to recover at
>power-up, right? And I don't think there are really any common cases
>where this should occur.
>
Yes, I misinterpreted a function call in UBI which was related only for
debug purpose.  UBI does 0xff checks mostly while
(1) scanning the device,
(2) erasing the block, and
(3) scrubbing
And that too on small chunk of bytes usually sizeof(ec-header) or sideof(vi=
d-header).
But, in latest technology NAND flash (usually MLC), we are seeing lot of
bit-flips on erased-pages as well. And if NAND driver starts comparing each
byte of erased-page with 0xff, then it's not optimal solution (even if
it's executed only once during mount).
I'll take your advice, but still do you have some better idea than comparin=
g all(0xff) ?


>> Known attributes of an erased-page
>>  - Bit-flips in erased-page can't be corrected because there is no ECC
>>    present in OOB.
>>  - Irrespective of number of bit-flips an erased-page will only contain
>>    all(0xff), So its safe to return error-code -EUCLEAN with data_buf=3D=
0xff,
>>    instead of -EBADMSG.
>
>Are you saying that all bitflips in erased pages should yield -EUCLEAN?
>I agree that they shouldn't return -EBADMSG (up to the strength
>threshold), but I also think that we should still be able to report the
>number of bitflips "corrected" in our erased page handling. That way,
>pages with small numbers of bitflips can still be corrected.
>
>Put another way: what if every page starts to experience at least one
>bitflip? Do you want UBIFS to scrub the page every time? Rather, I think
>you want to calculate the proper count so that MTD can mask the bitflips
>if they are under the threshold. See my comment labeled [***] in the
>patch context below.
>
I agree.. I'll update the patch return correct count of bit-flips on erased=
-page.


>>  - And incrementing ecc_stat->corrected makes chip->read_page() return -=
EUCLEAN.
>
>It only returns -EUCLEAN if the 'corrected' exceeds the threshold. Per
>my comment above, I think you want to retain this distinction if
>possible.
>
>> Solution: In NAND based file-systems like UBIFS, each page is checked fo=
r
>>          bit-flips before writing to it.
>
>No, UBIFS only checks pages like this when it thinks it doesn't have a
>consistent state (Artem can correct me if I'm wrong). Particularly, it
>does this at attach time, when it suspects power-cut issues. At other
>times, UBIFS should be smart enough to know which pages have not been
>written since erasure.
>
Yes, correct.
I have suggested another way of passing information between MTD/NAND
and UBI layers via error-codes. Your comments would be helpful.
http://lists.infradead.org/pipermail/linux-mtd/2014-January/051556.html


>> If correctable bit-flips are found
>>          in erased-page then -EUCLEAN error-code is returned which cause=
s
>>          UBIFS to re-erase the complete block. So, its unnecessary to ge=
t
>>          exact count of bit-flips in an erased-page.
>
>I dispute this point above.
>
Accepted, I'll update the patch (as mentioned above).


>>          Hence this patch just compares calc_ecc[] with known
>>          ECC-syndromp-of-all(0xff), to confirm if erased-page has bit-fl=
ips.
>>          - if bit-flips are found, then
>>              read buffer is set to all(0xff) and
>>              correctable bit-flips =3D max(ecc-strength) is reported bac=
k to
>>              upper layer to take preventive action (like re-erasing bloc=
k).
>>          - else
>>               read-data is returned normally.
>>
>> Signed-off-by: Pekon Gupta <pekon@ti.com>
>> ---

[...]

>> @@ -1359,14 +1320,16 @@ static int omap_elm_correct_data(struct mtd_info=
 *mtd, u_char *data,
>>  {
>>  	struct omap_nand_info *info =3D container_of(mtd, struct omap_nand_inf=
o,
>>  			mtd);
>> +	enum omap_ecc ecc_opt	=3D info->ecc_opt;
>>  	int eccbytes	=3D info->nand.ecc.bytes;
>> -	int eccsteps =3D info->nand.ecc.steps;
>> +	int eccsize	=3D info->nand.ecc.size;
>> +	int eccstrength	=3D info->nand.ecc.strength;
>> +	int eccsteps	=3D info->nand.ecc.steps;
>
>Rather than 4 variables which all reference info->nand.ecc, can't you do
>this?
>
>	struct nand_ecc_ctrl *ecc =3D &info->nand.ecc;
>
>Then all the other references can still be pretty short. i.e.:
>
>  eccbytes    =3D=3D=3D>  ecc->bytes
>  eccsize     =3D=3D=3D>  ecc->size
>  eccstrength =3D=3D=3D>  ecc->strength
>  eccsteps    =3D=3D=3D>  ecc->steps
>
Ok.. I thought this would be optimized by compiler ?
I din 't want to add any new variable on function's stack just for
initialization purpose, so kept it like this.


>>  	int i , j, stat =3D 0;
>>  	int eccflag, actual_eccbytes;
>>  	struct elm_errorvec err_vec[ERROR_VECTOR_MAX];
>>  	u_char *ecc_vec =3D calc_ecc;
>>  	u_char *spare_ecc =3D read_ecc;
>> -	u_char *erased_ecc_vec;
>>  	enum bch_ecc type;
>>  	bool is_error_reported =3D false;
>>
>> @@ -1389,10 +1352,8 @@ static int omap_elm_correct_data(struct mtd_info =
*mtd, u_char *data,
>>
>>  	if (info->nand.ecc.strength =3D=3D BCH8_MAX_ERROR) {
>>  		type =3D BCH8_ECC;
>> -		erased_ecc_vec =3D bch8_vector;
>>  	} else {
>>  		type =3D BCH4_ECC;
>> -		erased_ecc_vec =3D bch4_vector;
>
>Why are you dropping this vector assignment out of this if/else (which
>you later convert to a switch/case)? After this patch series, you seem
>to have effectively duplicated the same switch/case statement in two
>places. I think the vector assignment should just stay here unless you
>see some other good reason.
>
Thanks for pointing this out.
Yes, this could simplify the code further, but I'll make this vector assign=
ment
based on ecc-opt (ecc-scheme), not on ecc.strength.


>> +				/* check bit-flips in erased-pages
>> +				 * - Instead of comparing each byte of main-area
>> +				 *   with 0xff, comparing just calc_ecc[] with
>> +				 *   known ECC-syndrome-of-all(0xff). This
>> +				 *   confirms that main-area + OOB are all(0xff)
>> +				 *   This will save CPU cycles.
>> +				 * - Bit-flips in erased-page can't be corrected
>> +				 *   because there is no ECC present in OOB
>> +				 * - Irrespective of number of bit-flips an
>> +				 *   erased-page will only contain all(0xff),
>> +				 *   So its safe to return error-code -EUCLEAN
>> +				 *   with data_buf=3D0xff, instead of -EBADMSG
>> +				 * - And incrementing ecc_stat->corrected makes
>> +				 *   chip->read_page() return -EUCLEAN */
>
>/*
> * Can you reformat your multiline comments to fit this style? (With
> * asterisks on their own lines.) You use this style a few times.
> */
>
Ok ..


with regards, pekon
