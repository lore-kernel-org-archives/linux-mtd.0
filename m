Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1616ja-0007yB-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Nov 2001 13:57:46 +0000
Received: from wohnheim.fh-wedel.de (wohnheim.fh-wedel.de [195.37.86.122])
	by mail.fh-wedel.de (8.9.3/8.9.3) with ESMTP id PAA16020
	for <linux-mtd@lists.infradead.org>; Tue, 6 Nov 2001 15:04:21 +0100
Date: Tue, 6 Nov 2001 15:07:09 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2 propsal and a question about burst reads
Message-ID: <20011106150709.A31698@wohnheim.fh-wedel.de>
References: <15375.1005031664@redhat.com> <IGEFJKJNHJDCBKALBJLLGENIEPAA.joakim.tjernlund@lumentis.se> <20011106131316.A15512@wohnheim.fh-wedel.de> <003e01c166c3$ca707cb0$8501a8c0@gromit>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <003e01c166c3$ca707cb0$8501a8c0@gromit>; from rothwell@holly-springs.nc.us on Tue, Nov 06, 2001 at 08:06:03AM -0500
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

> Well, you can think of a log-structured filesystem as "all journal," so the
> "J" applies.

As far as I recall, the "trick" with journaling filesystems is to log
only the metadata. On normal hard drives, this speeds up the most
common operations, reads, and is still sufficient for most people.
Real log-structured filesystems are considered slow in every-day
useage and to my knowledge only one was ever implemented for some bsd
flavor.
But this is getting quite academic now. :)

Jörn

-- 
In disagreements with loved ones, deal only
with the current situation. Don't bring up the past.
