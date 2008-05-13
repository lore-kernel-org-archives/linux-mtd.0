Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JvwWj-0002xF-T9
	for linux-mtd@lists.infradead.org; Tue, 13 May 2008 15:34:54 +0000
Date: Tue, 13 May 2008 17:34:42 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH 1/1] [MTD/MAPS] Blackfin Async Flash Maps: Handle the case
	where flash memory and ethernet mac/phy are mapped onto the
	same async bank
Message-ID: <20080513153441.GB18026@logfs.org>
References: <1210653525-19437-1-git-send-email-cooloney@kernel.org>
	<20080513080727.GA15795@logfs.org>
	<8bd0f97a0805130542x46f5e7fejf1347f1c71f567fb@mail.gmail.com>
	<20080513150143.GA18026@logfs.org>
	<8bd0f97a0805130815q2ffa1d34ue87f5eb1422b6f42@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8bd0f97a0805130815q2ffa1d34ue87f5eb1422b6f42@mail.gmail.com>
Cc: dwmw2@infradead.org, Bryan Wu <cooloney@kernel.org>,
	linux-mtd@lists.infradead.org, will.newton@gmail.com,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 13 May 2008 11:15:57 -0400, Mike Frysinger wrote:
> On Tue, May 13, 2008 at 11:01 AM, Jörn Engel wrote:
> > On Tue, 13 May 2008 08:42:08 -0400, Mike Frysinger wrote:
> >  > On Tue, May 13, 2008 at 4:07 AM, Jörn Engel wrote:
> >  > > On Tue, 13 May 2008 12:38:45 +0800, Bryan Wu wrote:
> >  > >  >
> >  > >  > +#define pr_devinit(fmt, args...) ({ static const __devinitdata char __fmt[] = fmt; printk(__fmt, ## args); })
> >  > >
> >  > >  Is this still needed?
> >  >
> >  > yes
> >
> >  Can you elaborate a bit?
> 
> it's still used, therefore the definition cannot be dropped.  just
> look at the probe function.

That bit is obvious.  But why do you use pr_devinit() instead of
printk()?  What does it gain you?

Jörn

-- 
Das Aufregende am Schreiben ist es, eine Ordnung zu schaffen, wo
vorher keine existiert hat.
-- Doris Lessing
