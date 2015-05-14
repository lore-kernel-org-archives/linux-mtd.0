Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YswSF-0002FT-7l
 for linux-mtd@lists.infradead.org; Thu, 14 May 2015 16:57:51 +0000
Received: by pabtp1 with SMTP id tp1so91676122pab.2
 for <linux-mtd@lists.infradead.org>; Thu, 14 May 2015 09:57:29 -0700 (PDT)
Date: Thu, 14 May 2015 09:57:21 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: readtest: don't clobber error reports
Message-ID: <20150514165721.GJ11598@ld-irv-0074>
References: <1431466424-32001-1-git-send-email-computersforpeace@gmail.com>
 <55545C40.8070805@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55545C40.8070805@nod.at>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 14, 2015 at 10:26:40AM +0200, Richard Weinberger wrote:
> Am 12.05.2015 um 23:33 schrieb Brian Norris:
> > Commit 2a6a28e7922c ("mtd: Make MTD tests cancelable") accidentally
> > clobbered any read failure reports.
> > 
> > Coverity CID #1296020
> > 
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> > regression in v4.1-rc1, so I'll probably want to queue this for 4.1
> 
> Sounds sane. Thanks for fixing!

Applied to linux-mtd.git.

Brian
