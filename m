Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17c4l6-0006PH-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 14:52:24 +0100
Date: Tue, 6 Aug 2002 15:52:17 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: joakim.tjernlund@lumentis.se, Dave Ellis <DGE@sixnetio.com>,
        linux-mtd@lists.infradead.org
Subject: Re: Disk blocks for long periods
Message-ID: <20020806135217.GA17427@wohnheim.fh-wedel.de>
References: <IGEFJKJNHJDCBKALBJLLAEIBFFAA.joakim.tjernlund@lumentis.se> <30768.1028636087@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30768.1028636087@redhat.com>
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

Hi!

Just a wild thought:
With three command sets already implemented (0020 is not in the tree
yet), wouldn't it make sense to go through them and try to collect as
much common code, as possible? I really dislike code multiplication,
especially bug multiplication.

Jörn

-- 
Those who come seeking peace without a treaty are plotting.
-- Sun Tzu
