Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTYaO-00036t-M1
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 12:07:13 +0000
Received: by fxm14 with SMTP id 14so3474175fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 05:07:10 -0700 (PDT)
Subject: Re: [PATCH 01/32] mtd: mtd_dataflash don't specify default parsing
	options
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <BANLkTinUq_V_QkGDm6ejtGQ7Gnq1K8EHmA@mail.gmail.com>
References: <1307351782-7456-1-git-send-email-dbaryshkov@gmail.com>
	<1307358294.3112.38.camel@localhost>
	<BANLkTinUq_V_QkGDm6ejtGQ7Gnq1K8EHmA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 15:02:53 +0300
Message-ID: <1307361773.3112.43.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-06-06 at 15:19 +0400, Dmitry Eremin-Solenikov wrote:
> Hello,
> 
> On Mon, Jun 6, 2011 at 3:04 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Mon, 2011-06-06 at 13:15 +0400, Dmitry Eremin-Solenikov wrote:
> >> Since 'cmdline, NULL' is now a default for parse_mtd_partitions, don't specify
> >> this in every driver, instead pass NULL to force parse_mtd_partitions
> >> to use default.
> >>
> >> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> >
> > Do you have a git URL with these patches?
> 
> Yes. Unfortunately git.kernel.org syncs too slow now, so the kernel
> wasn't available
> at the time of sending an e-mail.
> 
> Here it goes:
> 
> The following changes since commit 099fbd4fd91fde9748d9ad927e59b6c36a2651cf:
> 
>   mtd: drop mtd_has_cmdlinepart() (2011-06-06 10:31:22 +0300)
> 
> are available in the git repository at:
>   git://git.kernel.org/pub/scm/linux/kernel/git/lumag/mtd-cleanup.git
> mtd-cleanup-cmdline

OK, thanks, all the patches are in the l2 tree now. But one note:
please, after a mechanical change go through the patches and check that
them. E.g., in this case many patches could also merge the list of
parameters. I mean, if you are substituting something long by something
short, you check if you can merge lines. Otherwise, you check if some
lines became too long...

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
