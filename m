Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I2in7-00017G-HC
	for linux-mtd@lists.infradead.org; Mon, 25 Jun 2007 03:15:18 -0400
Subject: Re: [PATCH] Prevent JFFS2 from OOPS:ing due to missing error checks.
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Vitaly Wool <vitalywool@gmail.com>
In-Reply-To: <acd2a5930706242130q13fe6837p696542d274bddec7@mail.gmail.com>
References: <1182706382.7852.7.camel@gentoo-jocke.transmode.se>
	<acd2a5930706242130q13fe6837p696542d274bddec7@mail.gmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Mon, 25 Jun 2007 09:15:15 +0200
Message-Id: <1182755715.12606.3.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-06-25 at 08:30 +0400, Vitaly Wool wrote:
> On 6/24/07, Joakim Tjernlund <joakim.tjernlund@transmode.se> wrote:
> > >From 474425d656766b6c6229312771be5f3e8d0a839f Mon Sep 17 00:00:00 2001
> > From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> > Date: Sun, 24 Jun 2007 19:22:29 +0200
> > Subject: [PATCH] Prevent JFFS2 from OOPS:ing due to missing error checks.
> >
> >
> > Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> 
> +               return ERR_PTR(PTR_ERR(hold_err)); ?
> 

Yes, that is to get the types correct. Otherwise I need to do
something like:
unsigned long hold_err = (unsigned long) fn->raw;
...
return ERR_PTR(hold_err);
