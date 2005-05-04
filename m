Received: from mx4.tellabs.com ([204.154.129.57])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DTSTD-0005Db-5t
	for linux-mtd@lists.infradead.org; Wed, 04 May 2005 18:35:56 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 4 May 2005 17:35:45 -0500
Message-ID: <E167ED46776D284B893BE52E888B69BC030F2055@USNVEX3.tellabs-west.tellabsinc.net>
From: "Burch, John T." <John.Burch@tellabs.com>
To: <linux-mtd@lists.infradead.org>
Subject: MTD do_write_oneword(): software timeout
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


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
