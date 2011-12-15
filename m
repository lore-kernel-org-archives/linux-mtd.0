Received: from mailhub07.airvana.com ([131.239.32.94]
 helo=mailhub07.wirelessworld.airvananet.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RbFMF-0005Af-6I
 for linux-mtd@lists.infradead.org; Thu, 15 Dec 2011 17:44:39 +0000
From: Richard Schmitt <rschmitt@airvana.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Thu, 15 Dec 2011 12:43:34 -0500
Subject: JFFS2 Write Verify
Message-ID: <1DA311769A9A3A4EB7C72853672DFF860535EEFC2D@mailstore.wirelessworld.airvananet.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


My question is on when is a block marked bad.

By looking at the code, it appears a block is marked bad if it had an error=
 erasing a block MAX_ERASE_FAILURE times.

I=92m not sure what is causing our failure scenario, but we seem to have a =
bad block, yet it never fails an erase.   We receive write verify errors on=
 a particular range of blocks.  Never erase failures, just write verify err=
ors.  The write verify errors are always dropped bits throughout the page. =
 For some reason, we never see this failure on the erase.

I would hope that a write verify failure would cause the block to be marked=
 bad.  What is the rational for this not to be the case?

The blocks that experience these write verify errors end up appearing as MA=
GIC BITMASK ERRORS the next time the partition is mounted since they are no=
t marked as bad, nor are they erased after the write verify error.

A related brainstorming question.  How are erase failures detected?  Is it =
possible that the block isn=92t erased properly yet not detected.  Since, a=
s I understand nand flash, an erase sets all bits to =911=92 and a write si=
mply erases particular bits, a bad erase, which doesn=92t succeed in settin=
g all bits to =911=92 could result in a write verify error that looks like =
dropped bits.  So, could it be that our problem is that we are not detectin=
g failed erases.  if so, any help will be appreciated.

We are using linux version 2.6.32 on a freescale P1010 board which uses the=
 fsl_ifc_nand chip driver.

Thanks,
Rich Schmitt

Airvana, Inc.
