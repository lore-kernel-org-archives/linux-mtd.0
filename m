Received: from mail.dif.dk ([193.138.115.101])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cm7na-0007Of-N6
	for linux-mtd@lists.infradead.org; Wed, 05 Jan 2005 04:49:51 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail.dif.dk (Postfix) with ESMTP id 2F592FFC74
	for <linux-mtd@lists.infradead.org>;
	Wed,  5 Jan 2005 10:53:52 +0100 (CET)
Received: from mail.dif.dk ([127.0.0.1])
	by localhost (saerimmer [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP
	id 15929-11 for <linux-mtd@lists.infradead.org>;
	Wed,  5 Jan 2005 10:53:52 +0100 (CET)
Received: from diftmgw2.backbone.dif.dk (diftmgw2.backbone.dif.dk
	[10.227.136.246]) by mail.dif.dk (Postfix) with ESMTP id AE9FDFFC89
	for <linux-mtd@lists.infradead.org>;
	Wed,  5 Jan 2005 10:53:50 +0100 (CET)
Date: Wed, 5 Jan 2005 10:45:38 +0100 (CET)
From: Jesper Juhl <juhl-lkml@dif.dk>
To: Greg Ungerer <gerg@snapgear.com>
In-Reply-To: <41DB343F.5070207@snapgear.com>
Message-ID: <Pine.LNX.4.61.0501051044060.6112@jjulnx.backbone.dif.dk>
References: <Pine.LNX.4.61.0412262202510.3552@dragon.hygekrogen.localhost>
	<41DB343F.5070207@snapgear.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wh.fh-wedel.de>,
	David Woodhouse <dwmw2@redhat.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, Jesper Juhl <juhl-lkml@dif.dk>
Subject: Re: [patch] remove unnessesary casts from drivers/mtd/maps/nettel.c
 and kill two warnings
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 5 Jan 2005, Greg Ungerer wrote:

> 
> Sorry for the slow response, I have been out on vacation the
> last couple of weeks :-)
> 
I Hope you had a nice vacation. :)

> 
> Jesper Juhl wrote:
> > I took a look at the cause for these warnings in the 2.6.10 kernel,
> > 
> > drivers/mtd/maps/nettel.c:361: warning: assignment makes pointer from
> > integer without a cast
> > drivers/mtd/maps/nettel.c:395: warning: assignment makes pointer from
> > integer without a cast
> > 
> > and as far as I can see the casts in there (to unsigned long and back to
> > void*) are completely unnessesary ('virt' in 'struct map_info' is a void
> > __iomem *), and getting rid of those casts buys us a warning free build.
> > 
> > Are there any reasons not to apply the patch below?
> > Unfortunately I don't have hardware to test this patch, so it has been
> > compile tested only.
> 
> Looks good to me. I have applied it to my working tree.
> Do you want me to send it to Linus?
> 

I'd appreciate that.

-- 
Jesper Juhl
