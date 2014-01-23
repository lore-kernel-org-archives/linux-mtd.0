Received: from mail-oa0-x232.google.com ([2607:f8b0:4003:c02::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W69Dq-0002bA-Bj
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2014 01:36:47 +0000
Received: by mail-oa0-f50.google.com with SMTP id n16so1412212oag.37
 for <linux-mtd@lists.infradead.org>; Wed, 22 Jan 2014 17:36:19 -0800 (PST)
Date: Wed, 22 Jan 2014 17:36:13 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: kgene@kernel.org
Subject: Re: [PATCH Resend 3/3] mtd: s3c2410: Merge plat/regs-nand.h into
 s3c2410.c
Message-ID: <20140123013613.GW8919@ld-irv-0074>
References: <1389333253-3802-1-git-send-email-sachin.kamat@linaro.org>
 <1389333253-3802-3-git-send-email-sachin.kamat@linaro.org>
 <CAK9yfHzMOhBco0JyNdXMCMiO20B+TFvVTXxa=P1DksHUr67wJQ@mail.gmail.com>
 <023501cf17d9$4133f560$c39be020$@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <023501cf17d9$4133f560$c39be020$@kernel.org>
Cc: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 23, 2014 at 10:20:05AM +0900, kgene@kernel.org wrote:
> Sachin Kamat wrote:
> > 
> > On 10 January 2014 11:24, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> > > plat/regs-nand.h is used only by S3C2410 nand driver. Since there
> > > are no other users, merge this file into the driver code to remove
> > > platform dependency. While at it also remove unused macros.
> > >
> > > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> > > Cc: Kukjin Kim <kgene.kim@samsung.com>

Sorry, I sent this through compile-testing a few days ago but didn't get
back to it.

> Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Cool. Pushed to l2-mtd.git. Thanks!

Brian
