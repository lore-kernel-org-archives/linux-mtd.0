Received: from blood.actrix.co.nz ([203.96.16.160])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DddNU-0003Pm-9W
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2005 20:16:05 -0400
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: Ludovic Guilhamat <lguilhamat@perax.fr>
Date: Thu, 2 Jun 2005 11:49:26 +1200
References: <429C4D96.7000302@perax.fr>
	<20050601044012.1392D47AF@blood.actrix.co.nz>
	<429D558E.5040706@perax.fr>
In-Reply-To: <429D558E.5040706@perax.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20050601234746.6F8134A98@blood.actrix.co.nz>
Cc: linux-mtd@lists.infradead.org,
	uClinux development list <uclinux-dev@uclinux.org>
Subject: Re: Samsung RFS Filesystem
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> Actually, the system I work on uses Jffs2 (Coldfire with uClinux). But,
> mount times are very long (the memory is a Flash Nand 16Mb). So, I
> planned to test Jffs2 patches (from the Jffs2 Improvement Project), then
> Yaffs. And as RFS is not freely distributed, and I don't know yet its
> cost, I wanted to know if someone had tested it.

Pick up a more recent JFFS2, I believe that there have been some speedups.

I get a lot of feedback that YAFFS is typically a few times faster than JFFS2

FAT is indeed "instant mounting" and uses less RAM because it is not log 
structured. FAT however does have a bad record as far as reliability and 
write speed on raw NAND devices.

In the end you need to look at pros and cons and fit them to your system 
needs.

-- Charles
