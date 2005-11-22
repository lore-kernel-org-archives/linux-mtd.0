Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EeRUi-00013h-1c
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2005 01:19:14 -0500
From: "Heiko Schocher" <hs@denx.de>
To: "David Woodhouse" <dwmw2@infradead.org>
Date: Tue, 22 Nov 2005 07:18:51 +0100
Message-ID: <AHEILKONAKAEJPHNMOPNKEMACDAA.hs@denx.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1132604987.15117.63.camel@baythorne.infradead.org>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org
Subject: RE: [PATCH]	MTD:	Add support for the PM82x Boards.
Reply-To: hs@denx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Monday, November 21, 2005 9:30 PM David Woodhouse wrote:
>> the following Patch (against 2.6 kernel.org tree, COMMIT_ID:
>> f093182d313edde9b1f86dbdaf40ba4da2dbd0e7) adds support for
>> the NOR flashes and for the DiskOnChip on the PM82X Boards
>> from Microsys.
> 
> Please use the new DiskOnChip driver in drivers/mtd/nand/ not the old
> one.

I use the new driver.
I made the changes in drivers/mtd/devices/docprobe.c,  because I
ported it from the 2.4 Kernel. Should I delete this and resubmit
the patch?

thanks
Heiko
