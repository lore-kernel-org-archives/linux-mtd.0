Received: from web36703.mail.mud.yahoo.com ([209.191.85.37])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JyqRg-0003q1-Bw
	for linux-mtd@lists.infradead.org; Wed, 21 May 2008 15:41:41 +0000
Date: Wed, 21 May 2008 08:41:38 -0700 (PDT)
From: Alex Dubov <oakad@yahoo.com>
Subject: Re: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1211383329.21380.358.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <546240.79105.qm@web36703.mail.mud.yahoo.com>
Cc: J?rn Engel <joern@logfs.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--- David Woodhouse <dwmw2@infradead.org> wrote:

> On Wed, 2008-05-21 at 08:20 -0700, Alex Dubov wrote:
> > Thanks for the comments. At this point it's enough for me to see that
> you're ok
> > with the idea.
> > 
> > I'll try to implement a working prototype of the proposal, supporting block
> > device emulation over smartmedia and memorystick (these are the only mtd
> > devices I have). Hopefully, it should take no more than couple of weeks.
> Then
> > we will be able to play with the working prototype to see what features it
> must
> > actually have.
> 
> Block device emulation is a separate thing to the core MTD device API.
> We already have an implementation of SSFDC, don't we?
>       

What I meant is: my prototype will include mtd_block, ftl for ssfdc, ftl for
memorystick, and backends for both adapted to work with fully callback driven
architecture. This is my current priority.

Everything else can be bolted on later.

(Current ssfdc.ko implementation is junk, sorry. Joern's driver has its own
implementation built-in).





      
