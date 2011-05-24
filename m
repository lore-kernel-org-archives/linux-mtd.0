Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOmIQ-0005xw-EA
	for linux-mtd@lists.infradead.org; Tue, 24 May 2011 07:44:55 +0000
Received: by ewy3 with SMTP id 3so2369508ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 May 2011 00:44:52 -0700 (PDT)
Subject: Re: [PATCH -next] mtd: fix physmap.h warnings
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Russell King <rmk@arm.linux.org.uk>
In-Reply-To: <20110524074020.GA9490@flint.arm.linux.org.uk>
References: <20110523154518.5e27cfb0.sfr@canb.auug.org.au>
	<20110523113709.4357b4ba.randy.dunlap@oracle.com>
	<1306216431.2785.46.camel@localhost>
	<1306216683.2785.47.camel@localhost>
	<20110524074020.GA9490@flint.arm.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 May 2011 10:40:34 +0300
Message-ID: <1306222834.2785.53.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Marc Zyngier <Marc.Zyngier@arm.com>,
	LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-05-24 at 08:40 +0100, Russell King wrote:
> On Tue, May 24, 2011 at 08:58:03AM +0300, Artem Bityutskiy wrote:
> > On Tue, 2011-05-24 at 08:53 +0300, Artem Bityutskiy wrote:
> > > On Mon, 2011-05-23 at 11:37 -0700, Randy Dunlap wrote:
> > > > From: Randy Dunlap <randy.dunlap@oracle.com>
> > > > 
> > > > Fix build warnings in physmap.h:
> > > > 
> > > > include/linux/mtd/physmap.h:25: warning: 'struct platform_device' declared inside parameter list
> > > > include/linux/mtd/physmap.h:25: warning: its scope is only this definition or declaration, which is probably not what you want
> > > > include/linux/mtd/physmap.h:26: warning: 'struct platform_device' declared inside parameter list
> > > > include/linux/mtd/physmap.h:27: warning: 'struct platform_device' declared inside parameter list
> > > > 
> > > > Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> > > 
> > > Oh, this was missed during review.  This was introduced in
> > > b7281ca2a4b00044c60c25059f467d05772cdbe3 which is going in via Russel's
> > > tree, so I guess Russel could pick up your patch.
> > 
> > My big apologies, s/Russel/Russell/.
> 
> Which patch?  Neither of these messages contained Randy's patch and I
> wasn't included on the original posting.

Sorry, I assumed you'd look that lkml is in CC and would find it in lkml
(I assumed you are subscribed there). I'll send this patch shortly.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
