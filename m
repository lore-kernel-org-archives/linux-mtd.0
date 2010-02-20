Received: from mail-fx0-f214.google.com ([209.85.220.214])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NixfY-00083h-Aw
	for linux-mtd@lists.infradead.org; Sat, 20 Feb 2010 22:19:28 +0000
Received: by fxm6 with SMTP id 6so1259688fxm.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 20 Feb 2010 14:19:22 -0800 (PST)
Subject: Re: [PATCH 0/14 V9] Work to enable SmartMedia/xD support in mtd
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: dedekind1@gmail.com
In-Reply-To: <1266698701.3178.0.camel@localhost.localdomain>
References: <1266443364-4538-1-git-send-email-maximlevitsky@gmail.com>
	<1266697630.4152.0.camel@maxim-laptop>
	<1266698701.3178.0.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 21 Feb 2010 00:19:18 +0200
Message-ID: <1266704358.3748.4.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alex Dubov <oakad@yahoo.com>, Vitaly Wool <vitalywool@gmail.com>,
	joern <joern@logfs.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	"stanley.miao" <stanley.miao@windriver.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-02-20 at 22:45 +0200, Artem Bityutskiy wrote: 
> On Sat, 2010-02-20 at 22:27 +0200, Maxim Levitsky wrote:
> > On Wed, 2010-02-17 at 23:49 +0200, Maxim Levitsky wrote: 
> > > This is slightly updated version of my patchset.
> > > Now I can tell you for sure that hotplug works.
> > > It was used/abused for long time.
> > > I did some changes in richoh card reader driver, to work better after resume
> > > and renamed it to r852.
> > > 
> > > I kindly ask you to merge this patchset to 2.6.34.
> > > If I/users find other bugs they can be addressed by follow up patches.
> > > 
> > > Best regards,
> > > 	Maxim Levitsky
> > > 
> > > 
> > > 
> > Should I expect at least some response on that?
> > Or not?
> 
> Since you put me to CC, I answer: not from me, I have no time at all to
> look at this closely.

I know that all you are busy.
But I did put a lot of effort in this work (more that a month).

I am going to be very busy (busier that you are) very soon.
I hoped that a month is enough to review and merge my work to mtd tree.
Now all that is left in one week, so I guess all the work I did was for
nothing.

I am really frustrated.


Best regards,
Maxim Levitsky
