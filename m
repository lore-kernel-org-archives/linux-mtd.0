Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUhlz-0001nf-8j
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 16:07:55 +0000
Received: by fxm14 with SMTP id 14so1537287fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 09:07:51 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] mtd: nand: convert printk() to pr_*()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <BANLkTin5KLu8QknuM4ATHpLQP4Uq09tekA@mail.gmail.com>
References: <1307544227.31223.115.camel@localhost>
	<1307557519-31269-1-git-send-email-computersforpeace@gmail.com>
	<1307605456.7374.35.camel@localhost>
	<BANLkTin5KLu8QknuM4ATHpLQP4Uq09tekA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Jun 2011 19:03:32 +0300
Message-ID: <1307635412.7374.128.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Igor Grinberg <grinberg@compulab.co.il>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-09 at 09:00 -0700, Brian Norris wrote:
> On Thu, Jun 9, 2011 at 12:44 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > Wait, and why are we using pr_* while it is better to use dbg_* ? :-)
> 
> Just so we're on the same page...did you say "dbg_*" when you really
> meant "dev_*"?

Yes, I meant dev_*

> Anyway, the answer is: I'm mostly trying to do as little shakeup as
> possible, so "printk" could translate pretty directly to the "pr_*"
> with shorter code, etc. If it makes as much (or more) sense to have
> the device name on all the prints, then I can just as well do it that
> way.

Yes, I think it makes much more sense to specify for which device (out
of possibly many!) this message belongs.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
