Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZymxN-00029Y-22
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2015 20:34:25 +0000
Received: by pacdm15 with SMTP id dm15so19175617pac.3
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2015 12:34:03 -0800 (PST)
Date: Tue, 17 Nov 2015 12:34:01 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Marcus Prebble <marcus.prebble@axis.com>
Cc: Marcus Prebble <prebble@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ricard =?iso-8859-1?Q?Wanderl=F6f?= <ricardw@axis.com>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd-utils: lib: mtd_read: Take the buffer offset into
 account when reading
Message-ID: <20151117203401.GA110024@google.com>
References: <A612847CFE53224C91B23E3A5B48BAC7B9E316CFDF@xmail3.se.axis.com>
 <20151112190924.GD8456@google.com>
 <A612847CFE53224C91B23E3A5B48BAC7C6EFB4B65B@xmail3.se.axis.com>
 <20151113191748.GH8456@google.com>
 <A612847CFE53224C91B23E3A5B48BAC7C6EFB4B670@xmail3.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A612847CFE53224C91B23E3A5B48BAC7C6EFB4B670@xmail3.se.axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 17, 2015 at 09:43:40AM +0100, Marcus Prebble wrote:
> On Fri, 2015-11-13 at 11:17 -0800, Brian Norris wrote:
> 
> > BTW, I noticed there isn't a 'Signed-off-by' tag in the patch. 
> >  Can you paste one in reply to your patch, and I'll C&P it?
> > 
> 
> Signed-off-by: Marcus Prebble <marcus.prebble@axis.com>

Pushed to mtd-utils.git. Thanks!
