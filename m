Received: from mgw-x1.nokia.com ([131.228.20.21])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18IsWV-0003HB-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Dec 2002 15:30:15 +0000
Received: from esvir01nok.ntc.nokia.com (esvir01nokt.ntc.nokia.com [172.21.143.33])
	by mgw-x1.nokia.com (Switch-2.2.1/Switch-2.2.0) with ESMTP id gB2G0AX23357
	for <linux-mtd@lists.infradead.org>; Mon, 2 Dec 2002 18:00:11 +0200 (EET)
Received: from esebh003.NOE.Nokia.com (unverified) by esvir01nok.ntc.nokia.com
 (Content Technologies SMTPRS 4.2.5) with ESMTP id <T5eecd10610ac158f214fa@esvir01nok.ntc.nokia.com> for <linux-mtd@lists.infradead.org>;
 Mon, 2 Dec 2002 18:00:47 +0200
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: JFFS2 - ECC errors with NAND flash
Date: Mon, 2 Dec 2002 08:00:44 -0800
Message-ID: <F252EE46074AB645B4F44947EEAD572750AE21@mvebe001.americas.nokia.com>
From: <Srinivasu.Vaduguri@nokia.com>
To: <linux-mtd@lists.infradead.org>
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

Hi,

I am trying to mount JFFS2 on MTD driver which uses NAND flash. I am =
using the latest MTD snapshot (mtd-snapshot-20020731.tar.bz2).

I erased the flash before mounting. The mounting, creating files is =
successful. But when i try deleting the file i get=20
nand_read_ecc() : Failed ECC read.
I get the same thing when i try copying a bigger file also.

I have one more doubt. If the ECC is not calculated for smaller number =
of bytes when writing, then how will the read operation be succesful,  =
which calculates the ECC for entire page?

Thanx in advance,

Srini
