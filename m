Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUhev-00013U-40
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 16:00:37 +0000
Received: by wyb28 with SMTP id 28so1657534wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 09:00:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1307605456.7374.35.camel@localhost>
References: <1307544227.31223.115.camel@localhost>
	<1307557519-31269-1-git-send-email-computersforpeace@gmail.com>
	<1307605456.7374.35.camel@localhost>
Date: Thu, 9 Jun 2011 09:00:32 -0700
Message-ID: <BANLkTin5KLu8QknuM4ATHpLQP4Uq09tekA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] mtd: nand: convert printk() to pr_*()
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Igor Grinberg <grinberg@compulab.co.il>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 9, 2011 at 12:44 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> Wait, and why are we using pr_* while it is better to use dbg_* ? :-)

Just so we're on the same page...did you say "dbg_*" when you really
meant "dev_*"?

Anyway, the answer is: I'm mostly trying to do as little shakeup as
possible, so "printk" could translate pretty directly to the "pr_*"
with shorter code, etc. If it makes as much (or more) sense to have
the device name on all the prints, then I can just as well do it that
way.

Brian
