Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ont0Y-00030k-Lk
	for linux-mtd@lists.infradead.org; Tue, 24 Aug 2010 12:53:43 +0000
Received: by fxm12 with SMTP id 12so4522746fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Aug 2010 05:53:39 -0700 (PDT)
Subject: Re: [PATCH 2/2] drivers/mtd/ubi: Eliminate update of
	list_for_each_entry loop cursor
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Julia Lawall <julia@diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008071109140.5821@ask.diku.dk>
References: <Pine.LNX.4.64.1008071109140.5821@ask.diku.dk>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Aug 2010 15:52:12 +0300
Message-ID: <1282654332.24044.170.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-08-07 at 11:09 +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> list_for_each_entry uses its first argument to move from one element to the
> next, so modifying it can break the iteration.  The variable re1 is already
> used within the loop as a temporary variable, and is not live here.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @r@
> iterator name list_for_each_entry;
> expression x,E;
> position p1,p2;
> @@
> 
> list_for_each_entry@p1(x,...) { <... x =@p2 E ...> }
> 
> @@
> expression x,E;
> position r.p1,r.p2;
> statement S;
> @@
> 
> *x =@p2 E
> ...
> list_for_each_entry@p1(x,...) S
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Pushed to ubi-2.6.git tree. This won't be seen in linux-next for some
time though, but I'll make it visible in linux-next at some point soon.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
