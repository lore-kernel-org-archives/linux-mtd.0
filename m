Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WPrRx-0005eB-2d
 for linux-mtd@lists.infradead.org; Tue, 18 Mar 2014 10:40:50 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [RFC PATCH v2] mtd: nand: add erased-page bitflip correction
Date: Tue, 18 Mar 2014 10:40:16 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB3F69@DBDE04.ent.ti.com>
References: <1394803700-29467-1-git-send-email-pekon@ti.com>
 <20140317184130.GA3834@ld-irv-0074>
 <20980858CB6D3A4BAE95CA194937D5E73EAB3DE3@DBDE04.ent.ti.com>
 <20140318090554.GY31517@norris-Latitude-E6410>
In-Reply-To: <20140318090554.GY31517@norris-Latitude-E6410>
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

Hi Brian,

>From: Brian Norris [mailto:computersforpeace@gmail.com]
>On Tue, Mar 18, 2014 at 06:23:10AM +0000, Pekon Gupta wrote:
>> >From: Brian Norris [mailto:computersforpeace@gmail.com]

Just last piece about clearing OOB, on which I'm not convinced ...

 [...]

>> >>  - if erased-page is detected then clean only read_data
>> >>    ?? need to see if OOB cleaning affects file-system metadata like J=
FFS2 cleanmarker
>> >
>> >Nak. We must clean both OOB and data buffers if we are doing this
>> >"correction". We don't put FS-specific hacks here. I don't know the
>> >specifics of JFFS2 cleanmarkers, but JFFS2 should have valid ECC bytes
>> >present whenever it expects a (non-raw) read to retain a few 0 bits. Or
>> >else it should be using a raw read mode.
>> >
>> This is important, we cannot just ignore it.
>> JFFS2 writes a signature just after erase in oobfree[] area [a], this he=
lps
>> to identify that block-erase was completed successfully. Now there are t=
wo
>> issues here:
>>
>> (1) If you count complete spare area (which includes JFFS2 cleanmarker) =
then
>> you would always see more lot of bit-flips > ecc.strength.
>
>That's not a problem with our MTD-layer solution; it's a problem with
>JFFS2. After you've programmed anything to the flash (without proper ECC
>parity), you cannot expect to ever "correct" data.
>
>> (2) If after detection of erased-page if you memset(OOB, oob, mtd->oobsi=
ze)
>> Then you are clearing off this JFFS2 marker also, and the JFFS2 FS *may*=
 crib
>> (however, I think JFFS2 uses chip->ecc.read_oob_raw() to read OOB, so it
>>  Should not be a problem).
>
>It does not use read_oob_raw(). The cleanmarker checks use
>mtd_read_oob() with MTD_OPS_AUTO_OOB, which filters down to
>nand_do_read_oob() and ecc.read_oob(). So incidentally, it never touches
>the code I'm adding, although it would probably be good to add
>protection in nand_do_read_oob() as well (which then might cause the
>problem you are theorizing).
>
>But here's the crucial point: JFFS2 assumes that drivers do not do error
>correction on the spare bytes!!! This is a bad assumption today, and I'm
>not really interested in correcting it. If this assumption becomes a
>problem, then we have an either-or: either a driver chooses to support
>the legacy of JFFS2 (it's already broken in many respects on many NAND),
>or it chooses to support erased-page correction.
>
Sorry, I cannot deprecate support for JFFS2 in lieu of NAND_NEED_FF_ECC_CHE=
CK
because still there are many legacy device users who use JFFS2.

Also, having bit-flips in ecc.layout->oobfree[] should be of an "erased-pag=
e"
should be acceptable, because:
(1) UBIFS does not store any metadata in OOB, so any bit-flips there don't
   affect the file-system at all.
(2) JFFS2  which uses ecc.layout->oobfree[] to store its clean-marker also
  does not intend it to be protected by ECC. So, any corruption in clean-ma=
rker
  may just cause a re-erase of the already erased-block [b].
(3) YAFFS2 uses oobfree[] to store tags, and probably those are expected
  to be present only for programmed-pages, and are protected by ECC [c].
(4) LOGFS (don't know much about it).

I'll wait for your next revision of patch,  but please re-think on my propo=
sal
to leave out ecc.layout->oobfree[], and just reset ecc.laout->ecc.pos[].
as it keeps compatibility with other file-systems which use OOB to store
some metadata.

(may be you can put resetting complete OOB, as separate patch later).


>> - Therefore in my earlier patch [2] I was just counting bit-flips in rea=
d_ecc[]
>>   *not* read_oob[].
>
>You can't have your cake and eat it too. You're trying to support
>intentionally programming bitflips (i.e., the 'cleanmarker') to spare
>area, but you're also trying to correct bits in such a page. Pick one.
>Or improve the JFFS2 / MTD API so that JFFS2 can communicate when it
>does and doesn't want error correction, rather than making assumptions.
>

[b] http://www.linux-mtd.infradead.org/faq/jffs2.html#L_clmarker
[c] http://www.yaffs.net/documents/how-yaffs-works
      http://www.yaffs.net/documents/faq

with regards, pekon
