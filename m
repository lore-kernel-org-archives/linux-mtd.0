Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XISc6-0003wK-RK
 for linux-mtd@lists.infradead.org; Sat, 16 Aug 2014 01:17:00 +0000
Received: by mail-pa0-f52.google.com with SMTP id bj1so4374855pad.11
 for <linux-mtd@lists.infradead.org>; Fri, 15 Aug 2014 18:16:37 -0700 (PDT)
Date: Fri, 15 Aug 2014 18:16:33 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Christian Riesch <christian.riesch@omicron.at>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: check return code for get_chip()
Message-ID: <20140816011633.GH18411@ld-irv-0074>
References: <1407998124-3166-1-git-send-email-computersforpeace@gmail.com>
 <CABkLOboi7YQhuDjLPeyyf5dDV1mQu02faTe9j8Y8ppH8Tzi+1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABkLOboi7YQhuDjLPeyyf5dDV1mQu02faTe9j8Y8ppH8Tzi+1g@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 14, 2014 at 10:30:32AM +0200, Christian Riesch wrote:
> Hi Brian,
> Thanks for catching this!

Don't thank me, thank Coverity (TM)! (And Dave Jones, I guess, since he
maintains the project instance.)

> On Thu, Aug 14, 2014 at 8:35 AM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > Untested
> >
> > Coverity CID 1230633
> >
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > Cc: Christian Riesch <christian.riesch@omicron.at>
> > ---
> >  drivers/mtd/chips/cfi_cmdset_0002.c |    4 ++++
> >  1 file changed, 4 insertions(+)
> 
> Tested-by: Christian Riesch <christian.riesch@omicron.at>

Thanks! Queued to linux-mtd.git/master. It'll probably go in 3.16, as
it's a fix for a new feature.

Brian

[1] http://codemonkey.org.uk/2014/08/05/linux-316-coverity-stats/
