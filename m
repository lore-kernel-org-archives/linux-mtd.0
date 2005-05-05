Received: from [72.29.129.1] (helo=aimsg.corp.audiocodes.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DTiBo-00025e-Uu
	for linux-mtd@lists.infradead.org; Thu, 05 May 2005 11:23:04 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 5 May 2005 11:23:34 -0400
Message-ID: <B2627A2E13B6DE4BADE1746A7DFBFA7E07B7C3@aimsg.corp.audiocodes.com>
From: "Murali Sampath" <msampath@Ai-Logix.com>
To: "Burch, John T." <John.Burch@tellabs.com>, <linux-mtd@lists.infradead.org>
Cc: 
Subject: Jffs2Mount Issue.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

HI=20

I am using the Uboot and Kernel is 2.4.27 and also I have AMD29LV640 =
flash device. I get the jffs2_scan_erase_block errors.
I am stuck not able to get JFFS2 to work right. Any suggestions will  be
greatly appreciated. I have no problem in using NFS.=20
Thanks

Following is the part of trace.

Murali




************************************************************************
*
Trace on my board looks like the following.

PPP generic driver version 2.4.2
PPP Deflate Compression module registered
PowerPC/UBoot 8xx/8xxx flash device: 0x800000 bytes at 0xff800000 (16
bits wide)
PowerPC/Uboot 8xx/8xxx boards: Found 1 x16 devices at 0x0 in 16-bit mode
 Amd/Fujitsu Extended Query Table at 0x0040
PowerPC/Uboot 8xx/8xxx boards: CFI does not contain boot bank location.
Assuming top.
number of CFI chips: 1

cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.


Creating 4 MTD partitions on "PowerPC/Uboot 8xx/8xxx boards":
0x00000000-0x00040000 : "UbootConfig"
mtd: Giving out device 0 to UbootConfig
0x00040000-0x00700000 : "JFFS2"
mtd: Giving out device 1 to JFFS2
0x00700000-0x00780000 : "U-Boot"
mtd: Giving out device 2 to U-Boot
0x00780000-0x00800000 : "Linux"
mtd: Giving out device 3 to Linux

******
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00030000:
0x0808 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00030004:
0x0808 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00030008:
0x6666 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003000c:
0x6666 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00030010:
0x0606 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00030014:
0x0606 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00030018:
0x4646 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0003001c:
0x4646 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00030100:
0x3aa0 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00030104:
0x6000
*******

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org]On Behalf Of Burch, John
T.
Sent: Wednesday, May 04, 2005 6:36 PM
To: linux-mtd@lists.infradead.org
Subject: MTD do_write_oneword(): software timeout



I'm using kernel 2.6.8 and am having problems with jffs2/mtd.
Frequently, though I'm not sure why, file writes fail as
shown in the debug output below (CONFIG_MTD_DEBUG_VERBOSE=3D3).
The failure appears to be as a result of do_write_oneword().
The error sometimes occurs with timeouts; other times it
does not.  Another curiousity is that the failures appear
to occur when a do_write_oneword() occurs at an
address that was just written (indicated below with '**').
Is this normal jffs2 behaviour, since it seems that the
first write is always with data=3D0x785e?

All works well with previous code running kernel 2.4.17, so
I know it's not a problem with the flash itself.  I have seen
some discussion of the timeout value in do_write_oneword()
not accounting for HZ of < 1000, but it appears that change
is already in the 2.6.8 version of cfi_cmdset_0002.c.

One other thing that may or may not be related is the
message at kernel startup (see below) about disabling
erase-suspend-program code.

Does anyone have any input on this do_write_oneword()
failure?

Thanks,
John


# cp /etc/dummy_file t1
MTD do_write_buffer(): WRITE 0x00c712c8(0x00001985)
MTD do_write_buffer(): WRITE 0x00c712e0(0x00000000)
MTD do_write_buffer(): WRITE 0x00c71300(0x00000000)
MTD do_write_buffer(): WRITE 0x00c7032c(0x00001985)
MTD do_write_buffer(): WRITE 0x00c7130c(0x00001985)
MTD do_write_buffer(): WRITE 0x00c71320(0x00000000)
MTD do_write_buffer(): WRITE 0x00c71340(0x00000000)
MTD do_write_buffer(): WRITE 0x00c71350(0x0000785e)**
MTD do_write_buffer(): WRITE 0x00c71360(0x000031e4)
MTD do_write_buffer(): WRITE 0x00c71380(0x00000966)
MTD do_write_buffer(): WRITE 0x00c713a0(0x0000c500)
MTD do_write_oneword(): WRITE 0x00c71350(0x0000165e)**
MTD do_write_oneword(): software timeout
MTD do_write_oneword(): software timeout
MTD do_write_oneword(): software timeout
MTD do_write_oneword(): software timeout
Write of 175 bytes at 0x0003130c failed. returned -5, retlen 174
MTD do_write_buffer(): WRITE 0x00c713bc(0x00001985)
MTD do_write_buffer(): WRITE 0x00c713c0(0x00000000)
MTD do_write_buffer(): WRITE 0x00c713e0(0x0000386d)
MTD do_write_buffer(): WRITE 0x00c71400(0x0000785e)**
MTD do_write_buffer(): WRITE 0x00c71420(0x00005200)
MTD do_write_buffer(): WRITE 0x00c71440(0x00004a6a)
MTD do_write_buffer(): WRITE 0x00c71460(0x0000a572)
MTD do_write_oneword(): WRITE 0x00c71400(0x0000165e)**
Write of 175 bytes at 0x000313bc failed. returned -5, retlen 174
cp: unable to close `t1': Input/output error

**snippet of kernel startup...
Physically mapped flash: Found 1 x16 devices at 0x0 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
Physically mapped flash: CFI does not contain boot bank location.
Assuming top.
number of CFI chips: 1
Using buffer write method
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
mtd: Giving out device 0 to Physically mapped flash
physmap flash device: 0x1000000 at 0xbf000000
Creating 8 MTD partitions on "Physically mapped flash":
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The information contained in this message may be privileged
and confidential and protected from disclosure. If the reader
of this message is not the intended recipient, or an employee
or agent responsible for delivering this message to the
intended recipient, you are hereby notified that any reproduction,
dissemination or distribution of this communication is strictly
prohibited. If you have received this communication in error,
please notify us immediately by replying to the message and
deleting it from your computer. Thank you. Tellabs
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
