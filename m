Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GNev-0000lw-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2002 18:08:37 +0000
Date: Mon, 25 Nov 2002 19:38:58 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: joakim.tjernlund@lumentis.se,
   Herman Oosthuysen <Herman@wirelessnetworksinc.com>,
   linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Config / FAQ
Message-ID: <20021125183858.GA26478@wohnheim.fh-wedel.de>
References: <IGEFJKJNHJDCBKALBJLLOEENFIAA.joakim.tjernlund@lumentis.se> <5807.1038241193@passion.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5807.1038241193@passion.cambridge.redhat.com>
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

On Mon, 25 November 2002 16:19:53 +0000, David Woodhouse wrote:
> joakim.tjernlund@lumentis.se said:
> >  I think it's 5 blocks currently. It should be possible to lower that
> > count, but that needs testing. 
> 
> It was tested. It broke. http://mhonarc.axis.se/jffs-dev/msg01495.html

Yes, it broke with a smaller number. But wether that smaller number
was 4, 1 or 0 is unknown.

I would expect 3 or 4 to be fine, but not bet more than a beer on it.

Jörn
