Received: from mail-lb0-f174.google.com ([209.85.217.174])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ulp62-0005sJ-RJ
 for linux-mtd@lists.infradead.org; Sun, 09 Jun 2013 23:32:29 +0000
Received: by mail-lb0-f174.google.com with SMTP id x10so3653707lbi.5
 for <linux-mtd@lists.infradead.org>; Sun, 09 Jun 2013 16:32:05 -0700 (PDT)
Date: Mon, 10 Jun 2013 01:34:01 +0200
From: Emil Goode <emilgoode@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] mtd: orion_nand: convert printk to dev_*
Message-ID: <20130609233401.GA4413@debian>
References: <1370812614-5724-1-git-send-email-andy.shevchenko@gmail.com>
 <20130609221808.GY23987@mwanda>
 <CAHp75VfYUL-odEZH4S3eskzD5Xs2Xc8Sbvy_7xE=yJaM1PiUBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VfYUL-odEZH4S3eskzD5Xs2Xc8Sbvy_7xE=yJaM1PiUBg@mail.gmail.com>
Cc: artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 Dan Carpenter <dan.carpenter@oracle.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Andy,

Thanks for the hint about converting to dev*. But I agree with Dan that error
messages for kzalloc calls are a bit pointless and after removing them all the
dev* calls are gone. So I will send a second version that fixes the typo and
removes the error messages for kzalloc. If you have any objections let me know. 

Best regards,

Emil

On Mon, Jun 10, 2013 at 01:31:27AM +0300, Andy Shevchenko wrote:
> On Mon, Jun 10, 2013 at 1:18 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > On Mon, Jun 10, 2013 at 12:16:54AM +0300, Andy Shevchenko wrote:
> >> It's better to use actual device name as a prefix in error messages.
> >>
> >
> > Gar...
> >
> > This doesn't apply on top of Emil's patch.  Emil's patch was first
> > so it should go in first.  Also Emil's patch was a bugfix so it is
> > more important than this printk cleanup patch.
> 
> Which tree has that patch incorporated? I'm okay to rebase it against that tree.
> Current version was done against recent linux-next.
> 
> --
> With Best Regards,
> Andy Shevchenko
