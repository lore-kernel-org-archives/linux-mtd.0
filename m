Received: from oe46.law14.hotmail.com ([64.4.20.18] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19J5rc-0002Yn-FA
	for <linux-mtd@lists.infradead.org>; Fri, 23 May 2003 07:17:12 +0100
From: "guo_zhenglin" <guo_zl9@hotmail.com>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 23 May 2003 14:17:09 +0800
MIME-Version: 1.0
Message-ID: <Law14-OE468xh2rmD8y0001c370@hotmail.com>
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0043_01C32135.FF2DC9C0"
Subject: help:  parse error before `cfi_probe_init'
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------=_NextPart_000_0043_01C32135.FF2DC9C0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit

1)
Now , I use linux kernel 2.4.20  (from
ftp://ftp.kernel.org/pub/linux/kernel/v2.4/)
and , use preempt-kernel-rml-2.4.20-3.patch from
 http://www.kernel.org/pub/linux/kernel/people/rml/preempt-kernel/v2.4/)
and , use mtd-snapshot-20030520.tar.bz2
my target board is MBX860 , with AM29F016 flash

2)
  I use " sh ./patchin.sh -j /home/guozl/linux-2.4.20"

  I config kernel with:

CONFIG_MTD=y
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=FE000000
CONFIG_MTD_PHYSMAP_LEN=00800000
CONFIG_MTD_PHYSMAP_BUSWIDTH=4

BTW, in maps/Config.in , "CONFIG_MBX860" should is "CONFIG_MBX" .

3) I compile ,show message:


ppc_8xx-gcc -D__KERNEL__ -I/home/guozl/linux-2.4.20/include -Wall -Wstrict-p
roto
types -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common -fomit-frame-point
er -
I/home/guozl/linux-2.4.20/arch/ppc -fsigned-char -msoft-float -pipe -ffixed-
r2 -
Wno-uninitialized -mmultiple -mstring -mcpu=860    -DKBUILD_BASENAME=cfi_pro
be
-c -o cfi_probe.o cfi_probe.c
cfi_probe.c:325: parse error before `cfi_probe_init'
cfi_probe.c:326: warning: return-type defaults to `int'
cfi_probe.c:331: parse error before `cfi_probe_exit'
cfi_probe.c:332: warning: return-type defaults to `int'
cfi_probe.c: In function `cfi_probe_exit':
cfi_probe.c:334: warning: control reaches end of non-void function
cfi_probe.c: At top level:
cfi_probe.c:336: warning: type defaults to `int' in declaration of
`module_init'
cfi_probe.c:336: warning: parameter names (without types) in function
declaratio
n
cfi_probe.c:336: warning: data definition has no type or storage class
cfi_probe.c:337: warning: type defaults to `int' in declaration of
`module_exit'
cfi_probe.c:337: warning: parameter names (without types) in function
declaratio
n
cfi_probe.c:337: warning: data definition has no type or storage class


could you tell me how to resolve?
thank you.
 ------------------------------
 guo zhenglin
 guo_zl9@hotmail.com
 ------------------------------


------=_NextPart_000_0043_01C32135.FF2DC9C0
Content-Type: text/x-vcard;
	name="=?gb2312?B?ufnV/cHWLnZjZg==?="
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="=?gb2312?B?ufnV/cHWLnZjZg==?="

BEGIN:VCARD
VERSION:2.1
N:=B9=F9=D5=FD=C1=D6
FN:=B9=F9=D5=FD=C1=D6
EMAIL;PREF;INTERNET:guo_zl9@hotmail.com
REV:20030523T061709Z
END:VCARD

------=_NextPart_000_0043_01C32135.FF2DC9C0--
