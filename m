Received: from maild.telia.com ([194.22.190.101])
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18fNGE-0004jn-00
	for <linux-mtd@lists.infradead.org>; Sun, 02 Feb 2003 16:46:26 +0000
Message-ID: <003501c2cada$9b6c9120$020120b0@jockeXP>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "MTD for Linux" <linux-mtd@lists.infradead.org>,
   "Vipin Malik" <vipin@embeddedlinuxworks.com>
References: <5.1.0.14.0.20030202082532.02427e68@64.170.22.132>
Date: Sun, 2 Feb 2003 17:46:17 +0100
MIME-Version: 1.0
Subject: Re: mtd partition1 corruption during writes to JFFS2 on partition2.
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Hi Vipin

I also have several partions(ppcboot, kernel and JFFS2) and I never had any
problems to update ppcboot or kernel(cp file /dev/mtdblock0) while JFFS2 is mounted.
I am using cmdset0001 driver, so perhaps it's a driver problem? 
If you will play with the cmdset0002 driver, consider to add point/unpoint
support(already in cmdset0001).

Recently(a few weeks ago) a locking bug in JFFS2 was fixed which bit me during
boot, don't think this what's biting you though.

 Jocke

> I've got multiple mtd partitions on one NOR flash device (CFI/AMD).
> 
> I've got JFFS2 fs mounted on the last partition. The other partitions hold 
> compressed firmware, that I intent upgrade while JFFS2 is being written to.
> 
> However, I find that if I write to the mtd device(s) (erase, followed by 
> dd) and then reboot, the firmware is corrupt.
> If I stop writes to the JFFS2 partition before upgrading the firmware on 
> the mtd partitions, everything is ok every time.
> 
> Is this a known "feature"?
> Ideas?
> 
> TIA
> 
> Vipin
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
