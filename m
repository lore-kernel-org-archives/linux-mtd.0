Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwxIE-0008GQ-Ii
 for linux-mtd@lists.infradead.org; Fri, 05 Dec 2014 18:07:52 +0000
Received: by mail-pa0-f51.google.com with SMTP id ey11so1129406pad.38
 for <linux-mtd@lists.infradead.org>; Fri, 05 Dec 2014 10:07:29 -0800 (PST)
Date: Fri, 5 Dec 2014 10:07:26 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Scott Branden <sbranden@broadcom.com>
Subject: Re: [PATCH 1/3] mtd: implement common reboot notifier boilerplate
Message-ID: <20141205180726.GN21347@ld-irv-0074>
References: <1417746968-28747-1-git-send-email-computersforpeace@gmail.com>
 <54815522.6000004@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54815522.6000004@broadcom.com>
Cc: ricard.wanderlof@axis.com, Artem Bityutskiy <dedekind1@gmail.com>,
 cdoban@broadcom.com, rjui@broadcom.com, richard.weinberger@gmail.com,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 04, 2014 at 10:48:02PM -0800, Scott Branden wrote:
> You need to change some spaces to tabs in the patch.

Wow, sorry. I'm being very dense. I'll be sure to fix these up before
applying.

> Tested-by: Scott Branden <sbranden@broadcom.com>

Thanks! I'll leave this for others to comment on, since this was
seemingly controversial. Plus, I have plenty of other things to review
for (maybe) 3.19 that have been around a lot longer than this, so these
may delay until 3.20, given the nearness of the 3.19 merge window.

Regards,
Brian
