Received: from mailout01.sul.t-online.com ([194.25.134.80] helo=mailout01.sul.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15WgT6-0002fP-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Aug 2001 16:51:00 +0100
Message-ID: <3B79497B.6537FFE6@t-online.de>
Date: Tue, 14 Aug 2001 17:53:31 +0200
From: attingimus@t-online.de (Rene Burgdorf)
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: MTD and 2.2.18-rtl
Content-Type: multipart/mixed;
 boundary="------------FA07762D9EE2567996B44FB7"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This is a multi-part message in MIME format.
--------------FA07762D9EE2567996B44FB7
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

I'm trying to compile the mini-rt linux kernel 2.2.18-rtl with mtd support (no modules).
Using the latest CVS source from 2001/08/11 the following error shows up:

make[4]: Entering directory `/home/att/Projekte/mini/kernel/linux/drivers/mtd/devices'
cc -D__KERNEL__ -I/home/att/Projekte/mini/kernel/linux/include -Wall -Wstrict-prototypes
-O2 -fomit-frame-pointer -fno-strict-aliasing -D__SMP__ -pipe -fno-strength-reduce -m486
-DCPU=486   -c -o doc2000.o doc2000.c
doc2000.c:1102: parse error before `cleanup_doc2000'
doc2000.c:1103: warning: return-type defaults to `int'
doc2000.c: In function `cleanup_doc2000':
doc2000.c:1118: warning: control reaches end of non-void function
doc2000.c: At top level:
doc2000.c:1120: warning: initialization from incompatible pointer type
make[4]: *** [doc2000.o] Error 1
make[4]: Leaving directory `/home/att/Projekte/mini/kernel/linux/drivers/mtd/devices'
make[3]: *** [first_rule] Error 2
make[3]: Leaving directory `/home/att/Projekte/mini/kernel/linux/drivers/mtd/devices'
make[2]: *** [_subdir_devices] Error 2
make[2]: Leaving directory `/home/att/Projekte/mini/kernel/linux/drivers/mtd'
make[1]: *** [_subdir_mtd] Error 2
make[1]: Leaving directory `/home/att/Projekte/mini/kernel/linux/drivers'
make: *** [_dir_drivers] Error 2

After removing `__exit' from line 1102 of doc2000.c `static void __exit
cleanup_doc2000(void)' 
the error doesn't occur anymore. The same applies to nftlcore.c (static void __exit
cleanup_nftl(void)).

Although a kernel is built, it complains : `Cannot find driver for DiskOnChip Millennium
at 0xD0000.'
A 2.4.4-rtl kernel works perfectly with this DoC on the same machine. 

The call to inter_module_get_request() in function DoC_Probe( ) of docprobe.c returns NULL
although
function init_doc2000() of doc2000.c was called before.

As I can't use 2.4.4 I'm stuck...

Thank you for any hints

Rene
--------------FA07762D9EE2567996B44FB7
Content-Type: text/x-vcard; charset=us-ascii;
 name="attingimus.vcf"
Content-Transfer-Encoding: 7bit
Content-Description: Card for Rene Burgdorf
Content-Disposition: attachment;
 filename="attingimus.vcf"

begin:vcard 
n:Burgdorf;Rene
tel;fax:+49 531 344613
tel;work:+49 531 344601
x-mozilla-html:FALSE
org:Attingimus Nachrichtentechnik GmbH
adr:;;Bismarckstr. 15;38102 Braunschweig;;;Germany
version:2.1
email;internet:attingimus@t-online.de
note;quoted-printable:HRB 4159 beim AG BS=0D=0A=0D=0A
x-mozilla-cpt:;-18592
fn:Rene Burgdorf
end:vcard

--------------FA07762D9EE2567996B44FB7--
