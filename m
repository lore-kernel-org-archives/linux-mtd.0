Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RG5Fk-0004cF-5w
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2011 08:42:28 +0000
Date: Tue, 18 Oct 2011 10:42:22 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: UBIFS recovery fails
Message-ID: <20111018084222.GC5997@parrot.com>
References: <4E9C2DAC.7090109@swissonline.ch> <1318882668.2172.10.camel@koala>
	<Pine.LNX.4.64.1110181007100.30940@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.1110181007100.30940@lnxricardw.se.axis.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 18, 2011 at 09:11:54AM +0100, Ricard Wanderlof wrote:
> 
> On Mon, 17 Oct 2011, Artem Bityutskiy wrote:
> 
> > [...] Unfortunately, no one really invested time into making UBIFS 
> > support MLC very well. It needs some more work. It also have some issues 
> > related to unstable bits in modern SLC.
> >
> > In short - if you want to use UBIFS on MLC - you should not have unclean
> > reboots. If you want to make UBIFS 100% uclean-reboot save on MLC - you
> > need to work on it some more.
> >
> > We (the original authors) developed and tested it on very robust SLC
> > NAND.
> 
> Do you have any specifics on what the issues are with MLC ?
 
Besides unstable bits, lower endurance, higher ecc requirements and NOP1, there
is a "page pairing" phenomenon which is not handled by UBI/UBIFS AFAIK.
When you cut power during a page write, you may lose data in another (paired)
previously programmed page.

BR,
--
Ivan
