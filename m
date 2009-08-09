Received: from 82-71-36-240.dsl.in-addr.zen.co.uk ([82.71.36.240]
	helo=aardvark.hiddenengine.co.uk)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Ma6Qm-000779-FB
	for linux-mtd@lists.infradead.org; Sun, 09 Aug 2009 11:19:20 +0000
From: "Roger Lucas" <roger@hiddenengine.co.uk>
To: "'Bill Gatliff'" <bgat@billgatliff.com>
References: <1F23C41C60CC4CA08789AE8461EF6044@wolverine>
	<4A440651.9000409@billgatliff.com>
Subject: RE: Longs spinlock on NOR reads
Date: Sun, 9 Aug 2009 12:19:14 +0100
Message-ID: <1732120E5DA8407189E1A3162F84E152@wolverine>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_001E_01CA18EB.9C02A280"
In-Reply-To: <4A440651.9000409@billgatliff.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_001E_01CA18EB.9C02A280
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Bill,

Firstly, many apologies that it has taken me so long to provide the patch...
It is very small but I have had so many other things on, I just didn't get
around to it.

The patch only applies to the one FLASH chip that we have one the system we
are using.  I'm sure something similar may be appropriate for the other
chips but I don't want to offer a patch against something that I haven't
tried and cannot test.

Best regards,

Roger

-----Original Message-----
From: Bill Gatliff [mailto:bgat@billgatliff.com] 
Sent: 26 June 2009 00:21
To: Roger Lucas
Cc: linux-mtd@lists.infradead.org
Subject: Re: Longs spinlock on NOR reads

Roger Lucas wrote:
> Before going through the process of submitting patches etc., is this a 
> problem that has been identified or experienced before?  I have searched
the
> mailing list but not seen any obvious references...
>   

I haven't seen the problem you are describing, but I haven't studied the
performance of JFFS2 down at those time levels.  Your problem
description sounds very reasonable, however, as does the proposed fix.

I think you'll probably get down to 7ms only if the compiler is doing a
lot of ldm/stm, which I'd be surprised to see.  But the overhead of a
function call for every 512 bytes might be measurable--- is there a
point within the lowest-level code that might be a good place to briefly
unlock and then re-lock the spinlock?  That would reduce the overhead of
the fix by avoiding the function call.

Regardless, if someone is paying attention to the numbers then they're
probably more concerned with the latency than throughput.  In that case,
if the only way to substantially improve latency is to take a
per-512-byte function call hit then I (for one) can live with that.

> If it seems a reasonable observation and fix, would you like me to post a 
> patch?  I can only patch and test the 'cfi_cmdset_0002.c' driver but it 
> would be a simple process for it to be applied to the other chips.
>   

Definitely post the patch.  Can't reject something we haven't seen.  :)

Maybe it needs to be surrounded by a CONFIG_MTD_<something> so that
people can turn it on or off via menuconfig.


b.g.

Checked by AVG - www.avg.com 
Version: 8.5.375 / Virus Database: 270.12.92/2202 - Release Date: 06/25/09
17:58:00

------=_NextPart_000_001E_01CA18EB.9C02A280
Content-Type: application/octet-stream;
	name="cfi_cmdset_0002.c.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="cfi_cmdset_0002.c.diff"

diff -aur linux-2.6.30-ref/drivers/mtd/chips/cfi_cmdset_0002.c =
linux-2.6.30/drivers/mtd/chips/cfi_cmdset_0002.c=0A=
--- linux-2.6.30-ref/drivers/mtd/chips/cfi_cmdset_0002.c        =
2009-06-10 04:05:27.000000000 +0100=0A=
+++ linux-2.6.30/drivers/mtd/chips/cfi_cmdset_0002.c    2009-07-28 =
12:01:09.000000000 +0100=0A=
@@ -926,6 +926,7 @@=0A=
        return 0;=0A=
 }=0A=
=0A=
+#define MAX_READ_BURST     1024=0A=
=0A=
 static int cfi_amdstd_read (struct mtd_info *mtd, loff_t from, size_t =
len, size_t *retlen, u_char *buf)=0A=
 {=0A=
@@ -954,13 +955,19 @@=0A=
                else=0A=
                        thislen =3D len;=0A=
=0A=
-               ret =3D do_read_onechip(map, &cfi->chips[chipnum], ofs, =
thislen, buf);=0A=
-               if (ret)=0A=
-                       break;=0A=
+               while(thislen) {=0A=
+                         unsigned long burstlen =3D (thislen < =
MAX_READ_BURST)?thislen:MAX_READ_BURST;=0A=
=0A=
-               *retlen +=3D thislen;=0A=
-               len -=3D thislen;=0A=
-               buf +=3D thislen;=0A=
+                         ret =3D do_read_onechip(map, =
&cfi->chips[chipnum], ofs, burstlen, buf);=0A=
+                         if (ret)=0A=
+                                       break;=0A=
+=0A=
+                         *retlen +=3D burstlen;=0A=
+                         len -=3D burstlen;=0A=
+                         buf +=3D burstlen;=0A=
+                         ofs +=3D burstlen;=0A=
+                         thislen -=3D burstlen;=0A=
+               }=0A=
=0A=
                ofs =3D 0;=0A=
                chipnum++;=0A=

------=_NextPart_000_001E_01CA18EB.9C02A280--
