Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16snJJ-0004RT-00
	for <linux-mtd@lists.infradead.org>; Wed, 03 Apr 2002 17:08:33 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "Derek Ross" <dross@iders.ca>, <linux-mtd@lists.infradead.org>
Subject: RE: Are erase suspends possible? 
Date: Wed, 3 Apr 2002 18:07:43 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLGEOBFCAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <000f01c1db25$262b4f50$87657bc8@athlon>
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

> 
> If I modified cfi_intelext_write_* to suspend erases in progress,
> would that screw up the operation of the JFFS2? Or would I have
> to supply a flag to turn that feature on and off depending
> on if JFFS is running?
> 
> Thanks,
> Derek Ross.

No, that would not screw up JFFS2. I submitted a patch a while ago that added that
capability. Unfortnatly the patch was against an older cfi_cmdset0001.c 
than current CVS and it did not apply cleanly and I don't have the time to clean it up
ATM.

see  http://lists.infradead.org/pipermail/linux-mtd/2002-February/004117.html

 Jocke
