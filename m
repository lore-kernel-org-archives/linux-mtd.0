Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dOSlj-0000wU-LL
 for linux-mtd@lists.infradead.org; Fri, 23 Jun 2017 17:53:21 +0000
Received: by mail-pf0-x244.google.com with SMTP id w12so8393834pfk.0
 for <linux-mtd@lists.infradead.org>; Fri, 23 Jun 2017 10:52:59 -0700 (PDT)
Date: Fri, 23 Jun 2017 10:52:56 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: partitions: fixup some allocate_partition()
 whitespace
Message-ID: <20170623175256.GJ14148@google.com>
References: <20170622210918.68280-1-computersforpeace@gmail.com>
 <CACna6rzkBdvKc29fy=WVOViZLz5E-_d=C4JEXFiHe590sxHmNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACna6rzkBdvKc29fy=WVOViZLz5E-_d=C4JEXFiHe590sxHmNw@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 22, 2017 at 11:41:58PM +0200, Rafał Miłecki wrote:
> On 22 June 2017 at 23:09, Brian Norris <computersforpeace@gmail.com> wrote:
> > Some recent patches caused churn around this area, and checkpatch
> > noticed the existing issues.
> >
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> 
> Looks OK obviously, thanks for taking care of this.

I'll consider that a "review", as this is so trivial :)

Applied to l2-mtd.git
