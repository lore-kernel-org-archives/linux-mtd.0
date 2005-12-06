Received: from petasus.ims.intel.com ([62.118.80.130])
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EjbLH-0004Tk-FZ
	for linux-mtd@lists.infradead.org; Tue, 06 Dec 2005 11:50:44 +0000
Received: from MSSMSXVS01.ccr.corp.intel.com (MSSMSXVS01.ccr.corp.intel.com
	[10.125.2.23])
	by petasus.ims.intel.com (8.12.9-20030918-01/8.12.10/d: small-solo.mc,
	v 1.2 2004/09/17 18:05:04 root Exp $) with SMTP id jB6C30av029991
	for <linux-mtd@lists.infradead.org>; Tue, 6 Dec 2005 12:03:01 GMT
Received: from mssmsx331.ccr.corp.intel.com ([10.125.2.16])
	by MSSMSXVS01.ccr.corp.intel.com (SAVSMTP 3.1.7.47) with SMTP id
	M2005120614502202517
	for <linux-mtd@lists.infradead.org>; Tue, 06 Dec 2005 14:50:22 +0300
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 6 Dec 2005 14:50:20 +0300
Message-ID: <F92C2EFE7C3BA745855BF7036E1F3F9A016C7C31@NNSMSX401>
From: "Korolev, Alexey" <alexey.korolev@intel.com>
To: <linux-mtd@lists.infradead.org>
Subject: Wrong interleave identification 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
=20
It looks there is bug in CFI interleave identification algorithm.=20

Current interleave identification algorithm one after another checks
interleave 1, interleave 2 , etc.
MTD probe code send 0x98 command to one flash chip and tries to read
"QRY" from flash.

Let consider two examples. For both of them we have flash with two
16bits chips in interleave.=20
Example 1. If flash is filled by random data, at CFI info request
addresses.

Mtd reads:=20
    0xDF34 0x0051 0x3F1A 0x0052 0x18B2 0x0059
    First assumption of MTD that flash has Interleave 1 and bandwidth 32
bits.
    In 32 bits representations symbol Q is equals 0x0000 0x0051.
    0xDF34 0x0051 is not equals Q in 32 bits representation.=20
    So MTD assumption that flash has Interleave 1 and bandwidth 32 is
fail.

   Next assumption that chip has interleave 2 and bandwidth 16 will pass
because Q in 16 bits
    representation is 0x0051.
    It will be equal to information read from flash. MTD correctly
identifies interleave 2.

Example 2. If flash near "QRY" fields is filled by zeroes,=20

Mtd reads :
    0x0000 0x0051 0x0000 0x0052 0x0000 0x0059
    These values are equal to "QRY" in 32 bits representation.
    So MTD assumption that flash has Interleave 1 and bandwidth 32 is
pass.=20
    After that all arithmetic's will go wrong. Chip size, chip bufsize,
etc will be wrong.=20

I was able to reproduce the issue on the following configuration:=20
Platform Mainstone II, 2 interleaved 2x16 P30 chips.

Writing zeros at the beginning of the second interleaved chip caused
terrific consequences: after rebooting one chip in interleave was
unavailable at all from Linux. =20

I made very simple workaround I just avoided assumption that chip has
interleave 1. It improved situation but it is not a fix.=20

May be it worth of trying to send the following sequence of commands in
interleave identification code.
1. Send read query command 0x98989898 (len depends on bank width ) -
then estimate interleave_1
2. Send read status command 0x70707070   - then estimate interleve_2
3. Correct interleave value will be minimum of interleave_1and
interleave_2

Another one way is defining interleave from config file as a property of
current mapping (like bandwidth). Actually it will be correct, because
interleave is a property of the current h/w configuration .=20

Thanks,
Alexey
