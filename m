Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WPnRB-0007lW-2i
 for linux-mtd@lists.infradead.org; Tue, 18 Mar 2014 06:23:45 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [RFC PATCH v2] mtd: nand: add erased-page bitflip correction
Date: Tue, 18 Mar 2014 06:23:10 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB3DE3@DBDE04.ent.ti.com>
References: <1394803700-29467-1-git-send-email-pekon@ti.com>
 <20140317184130.GA3834@ld-irv-0074>
In-Reply-To: <20140317184130.GA3834@ld-irv-0074>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Kent Li <kent.li@radisys.com>, Elie De Brauwer <eliedebrauwer@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Frederic HOUR <frederic.hour@safran-engineering.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brain,


>From: Brian Norris [mailto:computersforpeace@gmail.com]
>>On Fri, Mar 14, 2014 at 06:58:20PM +0530, Pekon Gupta wrote:
>>> From: Brian Norris <computersforpeace@gmail.com>
>>
>>
>> *changes v1 -> v2*
>> Tried optimizing for performance by making following updates
>>  - *read_data and *read_oob passed as arguments to nand_verify_erased_pa=
ge()
>>    to avoid re-reading the page from device chip->ecc.read_page_raw()
>
>This is not valid for all drivers. See the 'oob_required' parameter to
>read_page(). This means that if we can't verify for sure that it's
>uncorrectable without looking at the OOB, we have to re-read to include
>the OOB.
>
Ok.. But then your v1 patch does not, work as-it-is with OMAP NAND driver.
I think the problem is same as that of GPMI driver, there is difference in
Page layout when using ecc.read_page_raw() and ecc.read_page().


>>  - exit nand_verify_erased_page() as-soon-as bitflips > ecc.strength
>
>Thanks, that's probably good.
>
>>  - using hweightN() only for non-0xff data
>
>I'm not convinced that's a great optimization. I would write the simpler
>version without the 0xff check, then add it if it really makes sense.
>hweightN() is actually a pretty simple computation, and adding extra
>branches might be more harmful than helpful.
>
Yes, I'll try to get number to check this.


>>  - if erased-page is detected then clean only read_data
>>    ?? need to see if OOB cleaning affects file-system metadata like JFFS=
2 cleanmarker
>
>Nak. We must clean both OOB and data buffers if we are doing this
>"correction". We don't put FS-specific hacks here. I don't know the
>specifics of JFFS2 cleanmarkers, but JFFS2 should have valid ECC bytes
>present whenever it expects a (non-raw) read to retain a few 0 bits. Or
>else it should be using a raw read mode.
>
This is important, we cannot just ignore it.
JFFS2 writes a signature just after erase in oobfree[] area [a], this helps
to identify that block-erase was completed successfully. Now there are two
issues here:

(1) If you count complete spare area (which includes JFFS2 cleanmarker) the=
n
you would always see more lot of bit-flips > ecc.strength.

(2) If after detection of erased-page if you memset(OOB, oob, mtd->oobsize)
Then you are clearing off this JFFS2 marker also, and the JFFS2 FS *may* cr=
ib
(however, I think JFFS2 uses chip->ecc.read_oob_raw() to read OOB, so it
 Should not be a problem).
- Therefore in my earlier patch [2] I was just counting bit-flips in read_e=
cc[]
  *not* read_oob[].
- Also, 'oob_required=3D1' may not be used by user-space utilities, unless=
=20
   in specific  conditions like 'nanddump' || 'nandread --raw'.

 [...]

>> +			else {
>>  				ret =3D chip->ecc.read_page(mtd, chip, bufpoi,
>>  							  oob_required, page);
>> +				/* Check if its an erased-page with bit-flips */
>> +				if ((chip->options & NAND_ECC_NEED_CHECK_FF) &&
>> +					mtd->ecc_stats.failed - ecc_failures) {
>> +					ret =3D nand_verify_erased_page(mtd, chip,
>> +							bufpoi, chip->oob_poi);
>
>You have corrupted my patch so that now it does not handle the subpage
>case.
>
I think handling sub-page reads should be handled separately, because using
chip->ecc.read_page_raw() when sub-page is enabled, may not be a good.
=20
[...]

>
>Anyway, I have already heard comments from several people (including
>you), but you have only addressed some of them in your version of my
>patch. Please, let me send my own patches, and you can provide your
>feedback there.
>
Yes for sure.. I was just trying to show the changes which worked for
OMAP NAND. I had anyways reverted the changes, NAKed by you,
before taking the performance numbers.
However, lets first get this working for all other drivers as well.
(And please do pay attention to JFFS2 clean-marker query).


[a] http://www.linux-mtd.infradead.org/faq/jffs2.html#L_clmarker

with regards, pekon
