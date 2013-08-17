Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VAn9q-0002TO-9Z
 for linux-mtd@lists.infradead.org; Sat, 17 Aug 2013 20:31:35 +0000
Received: by mail-pa0-f47.google.com with SMTP id kl13so3175925pab.20
 for <linux-mtd@lists.infradead.org>; Sat, 17 Aug 2013 13:31:12 -0700 (PDT)
Date: Sat, 17 Aug 2013 13:31:08 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Alexander Shiyan <shc_work@mail.ru>
Subject: Re: [PATCH v4 2/4] mtd: nand: gpio: Use devm_gpio_request_one()
 where possible
Message-ID: <20130817203108.GE11210@norris.computersforpeace.net>
References: <1376637633-12540-1-git-send-email-shc_work@mail.ru>
 <CAOMZO5Cr7t3YE_H4N9RWhJDz3GOnkGXDw_dPJ5Hhxs427AsHAg@mail.gmail.com>
 <1376655061.504420734@f364.i.mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376655061.504420734@f364.i.mail.ru>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Fabio Estevam <festevam@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 16, 2013 at 04:11:01PM +0400, Alexander Shiyan wrote:
> > On Fri, Aug 16, 2013 at 4:20 AM, Alexander Shiyan <shc_work@mail.ru> wrote:
> > >
> > > Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> > 
> > You are not doing only what you describe in the Subject line.
> > 
> > It would be nice to provide a commit log.
> 
> Is it worth it to make the next version of the patch?
> On my opinion, everything is obvious from the name.

Half of it is obvious, but the part in which you add gpio_nand_set_wp()
and use it is not related to the subject. It's really a separate bit of
refactoring, it seems, which could be valid only if you mention it.
Otherwise, a subject-line-only commit message means the patch must do
one thing only.

You can just resend this one patch, or even split it into two patches. I
believe the rest should be OK. (I'm looking now.)

Thanks,
Brian
