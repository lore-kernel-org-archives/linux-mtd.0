Received: from mail-ie0-f171.google.com ([209.85.223.171])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5Ksl-0002R8-Qn
 for linux-mtd@lists.infradead.org; Mon, 20 Jan 2014 19:51:40 +0000
Received: by mail-ie0-f171.google.com with SMTP id as1so1713733iec.30
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jan 2014 11:51:15 -0800 (PST)
Date: Mon, 20 Jan 2014 11:51:12 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] mtd: m25p80: assign default read command
Message-ID: <20140120195112.GT8919@ld-irv-0074>
References: <1389906547-31959-1-git-send-email-computersforpeace@gmail.com>
 <201401181954.40539.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201401181954.40539.marex@denx.de>
Cc: Sourav Poddar <sourav.poddar@ti.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jan 18, 2014 at 07:54:40PM +0100, Marek Vasut wrote:
> On Thursday, January 16, 2014 at 10:09:07 PM, Brian Norris wrote:
> > In the following commit (in -next):
> > 
> >     commit 8552b439aba7f32063755d23f79ca27b4d0a3115
> >     drivers: mtd: m25p80: convert "bool" read check into an enum
> > 
> > We converted the boolean 'fast_read' property to become an enum
> > 'flash_read', but at the same time, we changed the conditional path so
> > that it doesn't choose a default value in some cases (technically, we
> > choose the correct default simply by virtue of devm_kzalloc(), which
> > zeroes this out to be a NORMAL read operation, but still...).
> 
> Yep, that's true. It did default to the correct _NORMAL.
> 
> > Fix this by setting a default for the 'else' clause.
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > Cc: Sourav Poddar <sourav.poddar@ti.com>
> 
> Let's be explicit indeed.
> 
> Acked-by: Marek Vasut <marex@denx.de>

Thanks. Pushed to l2-mtd.git.

Brian
