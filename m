Received: from 42.242.232.72.static.reverse.layeredtech.com ([72.232.242.42]
	helo=secure.poehali.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HtLpj-0004k4-8D
	for linux-mtd@lists.infradead.org; Wed, 30 May 2007 06:55:17 -0400
Date: Wed, 30 May 2007 13:57:15 +0300
From: Ivan Kuten <ivan.kuten@promwad.com>
To: Haavard Skinnemoen <hskinnemoen@atmel.com>
Subject: Re: Some issues with the AT91 dataflash driver...
Message-ID: <20070530135715.0d7dee44@newbox>
In-Reply-To: <20070530103857.629b84ee@dhcp-255-175.norway.atmel.com>
References: <465431DA.5030500@atmel.com>
	<1179992308.13101.16.camel@fuzzie.sanpeople.com>
	<46558893.1020802@comcast.net>
	<1180010988.13101.103.camel@fuzzie.sanpeople.com>
	<012d01c79e06$66823470$3204200a@head.local>
	<20070524164654.3f106ead@newbox> <20070524181437.01550127@newbox>
	<20070527200853.3caf8206@dhcp-255-175.norway.atmel.com>
	<20070527211234.40777726@dhcp-255-175.norway.atmel.com>
	<1180374280.3642.114.camel@sauron> <20070528212513.5086bfac@newbox>
	<1180467763.3642.125.camel@sauron>
	<20070529222744.3e7a1489@dhcp-255-175.norway.atmel.com>
	<1180509202.3642.131.camel@sauron>
	<20070530103857.629b84ee@dhcp-255-175.norway.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: david-b@pacbell.net, linux-mtd@lists.infradead.org,
	Michal Piotrowski <michal.k.k.piotrowski@gmail.com>,
	Vadim Yatsenko <Vadim.Yatsenko@malva.ua>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 30 May 2007 10:38:57 +0200
Haavard Skinnemoen wrote:

> On Wed, 30 May 2007 10:13:22 +0300
> Artem Bityutskiy <dedekind@infradead.org> wrote:
> 
> > Thanks! Could you please try the below patch - it should help.
> 
> It does. No more messages, the GC thread stays alive and I can execute
> binaries from the mount. Thanks!
> 
> Haavard
> 
> > >From f84ae9eae2d0b12cff2e0f5a490a3d732458b381 Mon Sep 17 00:00:00 2001  
> > From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> > Date: Wed, 30 May 2007 12:08:14 +0300
> > Subject: [PATCH] JFFS2: fix readinode()
> > 
> > If we have already read enough bytes, no need to call read_more().
> > 

Confirmed for AT91RM9200 too, patch did a job - mounting ok.

Best regards,
Ivan
