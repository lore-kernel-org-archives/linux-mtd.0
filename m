Received: from [195.144.108.44] (helo=mail.deltaes.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15rNOM-0002bM-00
	for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2001 18:43:38 +0100
Date: Wed, 10 Oct 2001 19:58:29 +0200 (CEST)
From: martin.kula@deltaes.cz
Reply-To: martin.kula@deltaes.cz
To: David Woodhouse <dwmw2@infradead.org>
cc: linux-mtd@lists.infradead.org
Subject: Re: Eraseblock size in jffs2 ? 
In-Reply-To: <30602.1002735589@redhat.com>
Message-ID: <Pine.LNX.4.21.0110101951520.18912-100000@lxserver.deltes.cz>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi

On Wed, 10 Oct 2001, David Woodhouse wrote:

> > I'm very confused with it because when I use eraseall on the mtd0
> > device than I erase  MBR and so  too ? I won't be able to boot from
> > this, will I ?
> 
> Yes, it would take out all the firmware, but the firmware wouldn't have let 
> you boot from JFFS or JFFS2 anyway.

Ohhh so !?! That it isn't the solution for me because I have a PC104
with a DoC only.

> 
> Probably best just to use NFTL on it and a normal filesystem on top of that.
> 

OK


Thanks

Martin
