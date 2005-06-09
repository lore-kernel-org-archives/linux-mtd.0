Received: from fra-del-03.spheriq.net ([195.46.51.99])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DgOrV-0002fp-H6
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2005 11:22:31 -0400
Received: from fra-out-01.spheriq.net (fra-out-01.spheriq.net [195.46.51.129])
	by fra-del-03.spheriq.net with ESMTP id j59EmDJU020167
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2005 14:48:13 GMT
Received: from fra-cus-02.spheriq.net (fra-cus-02.spheriq.net [195.46.51.38])
	by fra-out-01.spheriq.net with ESMTP id j59ElXmM012907
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2005 14:47:33 GMT
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by fra-cus-02.spheriq.net with ESMTP id j59Em1kI011361
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=OK)
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2005 14:48:05 GMT
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A908BDAA2
	for <linux-mtd@lists.infradead.org>;
	Thu,  9 Jun 2005 14:29:32 +0000 (GMT)
Received: from zeta.dmz-eu.st.com (localhost [127.0.0.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 022E5759CA
	for <linux-mtd@lists.infradead.org>;
	Thu,  9 Jun 2005 14:31:16 +0000 (UTC)
Received: from mail2.agr.st.com (mail2.agr.st.com [164.130.4.72])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A2B27474FB
	for <linux-mtd@lists.infradead.org>;
	Thu,  9 Jun 2005 14:31:15 +0000 (GMT)
From: Domenico DI TULLIO <domenico.di-tullio@st.com>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 9 Jun 2005 16:29:42 +0200
Message-ID: <002d01c56cff$b4d056a0$443682a4@nap.st.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Subject: Request by STMicroelectronics to add NAND chip
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Thomas Gleixner,

I am an application engineer of the STMicroelectronics,
and I work in NAND Flash & Storage Media Division.

Now, I am working under Linux, in particular I am testing
ours NAND device with JFFS2 and YAFFS file system.
I have noted that, in the chiplist present in the file "nand_ids.h", =
miss some STMicro NAND chip supported from your code, and I would add =
it.

The STMicro NAND Flash chip to add are:

# NAND WITH SMALL PAGE
---------------------------
[1]=20
  Name: "NAND 128MiB 1,8V 8-bit"
  Id:  0x39
  Pagesize:512
  Chipsize(in MByte):128
  EraseBlocksize:0x4000
  Options:0

[2]
  Name: "NAND 128MiB 1,8V 16-bit"
  Id:  0x49
  Pagesize:512
  Chipsize(in Mbyte):128
  Eraseblocksize:0x4000
  Options: NAND_BUSWIDTH_16
[3]
  Name: "NAND 128MiB 3,3V 16-bit"
  Id:  0x59
  Pagesize:512
  Chipsize(in MegaByte):128
  EraseBlocksize:0x4000
  Options: NAND_BUSWIDTH_16

# NAND WITH LARGE PAGE
-------------------------------

[1]=20
  Name: "NAND 64MiB 1,8V 8-bit"
  Id:  0xA2
  Pagesize:0
  Chipsize(in MByte):64
  EraseBlocksize:0
  Options: NAND_SAMSUNG_LP_OPTIONS | NAND_NO_AUTOINCR

[2]
  Name: "NAND 64MiB 3,3V 8-bit"
  Id:  0xF2
  Pagesize:0
  Chipsize(in Mbyte):64
  Eraseblocksize:0
  Options: NAND_SAMSUNG_LP_OPTIONS | NAND_NO_AUTOINCR
[3]
  Name: "NAND 64MiB 1,8V 16-bit"
  Id:  0xB2
  Pagesize:0
  Chipsize(in MegaByte):64
  EraseBlocksize:0
  Options:  NAND_SAMSUNG_LP_OPTIONS | NAND_BUSWIDTH_16 | =
NAND_NO_AUTOINCR

[3]
  Name: "NAND 64MiB 3,3V 16-bit"
  Id:  0xC2
  Pagesize:0
  Chipsize(in MegaByte):64
  EraseBlocksize:0
  Options:  NAND_SAMSUNG_LP_OPTIONS | NAND_BUSWIDTH_16 | =
NAND_NO_AUTOINCR

Thanks in advance for your support.

Best Regards,
  Domenico
