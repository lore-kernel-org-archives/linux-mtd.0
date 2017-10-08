Date: Sun, 8 Oct 2017 12:34:47 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>, Richard Weinberger
 <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>
Cc: Andrea Adami <andrea.adami@gmail.com>, linux-mtd@lists.infradead.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Dmitry Eremin-Solenikov
 <dbaryshkov@gmail.com>, linux-mmc@vger.kernel.org, Russell King
 <linux@armlinux.org.uk>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Lee Jones <lee.jones@linaro.org>, David
 Woodhouse <dwmw2@infradead.org>, Linus Walleij <linus.walleij@linaro.org>,
 Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH v5 0/9] mtd: sharpslpart partition parser
Message-ID: <20171008123447.54a3d0ad@bbrezillon>
In-Reply-To: <20171008120950.5232a71f@bbrezillon>
References: <1502743720-28672-1-git-send-email-andrea.adami@gmail.com>
 <20170821221339.70cfcfb7@bbrezillon>
 <87pobmoz8n.fsf@belgarion.home>
 <CAAQYJAv8bNrxJ_ESgC0fOAdry7i5mstzgQ3P74q1D=C-xsJprg@mail.gmail.com>
 <20170824114631.089d2628@bbrezillon>
 <87inh6pw9e.fsf@belgarion.home> <87376uezjs.fsf@belgarion.home>
 <20171008120950.5232a71f@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 8 Oct 2017 12:09:50 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Sun, 08 Oct 2017 11:53:11 +0200
> Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> 
> > Robert Jarzmik <robert.jarzmik@free.fr> writes:
> >   
> > > Boris Brezillon <boris.brezillon@free-electrons.com> writes:
> > >    
> > >> Hi Robert,
> > >> Wait a bit before applying. I think patches 6 to 9 have a dependency on
> > >> patch 1 (it's not a build dependency, but NAND partitioning might be
> > >> wrong if you apply them), so we need to sync. What release is
> > >> pxa/for-next targeting? If it's 4.15 I can apply patch 1 just after
> > >> 4.14-rc1 is out and provide an immutable branch for you to pull in
> > >> pxa/for-next.    
> > >
> > > Hi Boris,
> > >
> > > It's targeting 4.15 right now. And we can do as you like, either an immutable
> > > branch, or I wait to include these patches into my pxa/for-next until you give
> > > me your go, it's as you like.    
> > 
> > Hi Boris,
> > 
> > So what's the status about the sync, should I pick the patches, and have the
> > others make it to your for-next branch ?  
> 
> I'm still waiting Brian's final word about this version, and if he's
> happy with it, Richard will queue it for 4.15.

Actually, I'm waiting a feedback on v9 [1], not v5.

[1]http://patchwork.ozlabs.org/patch/808431/
