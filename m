Received: from snipe.mail.pas.earthlink.net ([207.217.120.62] helo=snipe.prod.itd.earthlink.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16TWpP-0000nH-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Jan 2002 23:29:15 +0000
Received: from 1cust63.tnt3.phoenix.az.da.uu.net ([63.14.194.63] helo=localhost.localdomain)
	by snipe.prod.itd.earthlink.net with esmtp (Exim 3.33 #1)
	id 16TX00-0005xq-00
	for linux-mtd@lists.infradead.org; Wed, 23 Jan 2002 15:40:12 -0800
Subject: using the DOC2000
From: Russ Dill <Russ.Dill@asu.edu>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 23 Jan 2002 16:47:35 -0700
Message-Id: <1011829656.1974.0.camel@timmy>
Mime-Version: 1.0
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

I've been using 2 MB of standard flash on an ARM system. The layout I've
been using is:

boot blocks
	32k - boot loader (blob)
	8k - journaled config
	8k - journaled config
	16k - static config
main blocks
	128k * 3 - backup cramfs
	128k * 12 - primary cramfs

both cramfs filesystems contain their own kernel, and the bootloader can
boot either. I'm trying to port this over to x86 using a DOC2000. I'm
trying to translate how I'm currently using MTD, to how I need to use a
DOC2000. the only writing that occurs to the flash is the initial flash
of everything, the periodic (every 4 hours to every few days) writing of
the journaled config blocks, and the updates to the primary fs (once
every few months). Currently as it stands, it seems for the DOC to be
usefull at all, I need to use NTFL, which I don't paticularly care for.
I'd like to mount my cramfs on a read only block device, as well as
control the writing of the journaled config, as well as their erase
blocks, so that I know what is going on with the flash in case power is
lost.

Does lilo need NTFL to be able to boot linux off of the device? does
grub? Can I control erase cycles for my journaled config if I am using
NTFL? What is all this talk about ECC?
