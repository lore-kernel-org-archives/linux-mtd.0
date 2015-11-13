Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZxJrQ-0002Ls-2r
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2015 19:18:17 +0000
Received: by pacej9 with SMTP id ej9so1713380pac.2
 for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2015 11:17:51 -0800 (PST)
Date: Fri, 13 Nov 2015 11:17:48 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Marcus Prebble <marcus.prebble@axis.com>
Cc: Marcus Prebble <prebble@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ricard =?iso-8859-1?Q?Wanderl=F6f?= <ricardw@axis.com>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd-utils: lib: mtd_read: Take the buffer offset into
 account when reading
Message-ID: <20151113191748.GH8456@google.com>
References: <A612847CFE53224C91B23E3A5B48BAC7B9E316CFDF@xmail3.se.axis.com>
 <20151112190924.GD8456@google.com>
 <A612847CFE53224C91B23E3A5B48BAC7C6EFB4B65B@xmail3.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A612847CFE53224C91B23E3A5B48BAC7C6EFB4B65B@xmail3.se.axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, Nov 13, 2015 at 11:07:12AM +0100, Marcus Prebble wrote:
> Thanks for looking at the patch!

Thanks for the patch!

> On Thu, 2015-11-12 at 11:09 -0800, Brian Norris wrote:
> > Patch looks OK. Did you test it? Have you seen MTD drivers that will
> > return short reads?
> 
> I only noticed in passing, not because I was hit by the error. I smoke
> tested it, but did not hack a driver to return less than len.
> If I had to guess, I would say that in nearly all cases the drivers do
> not return short reads otherwise this would probably have been picked up
> by now. 

OK, that's fine. It's good to know when things are likely to cause real
problems vs. when things need fixed just for best practice.

BTW, I noticed there isn't a 'Signed-off-by' tag in the patch. It's
mostly a formality, but we really shouldn't be taking patches without
it. Can you paste one in reply to your patch, and I'll C&P it?

Regards,
Brian
