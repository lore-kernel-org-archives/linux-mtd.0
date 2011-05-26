Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QPT0b-0005J3-Mo
	for linux-mtd@lists.infradead.org; Thu, 26 May 2011 05:21:22 +0000
Received: by ewy3 with SMTP id 3so161683ewy.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 May 2011 22:21:20 -0700 (PDT)
Subject: Re: [PATCH 1/2] mtd: nand: generalized error messages with __func__
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Igor Grinberg <grinberg@compulab.co.il>
In-Reply-To: <4DDDE19D.9010505@compulab.co.il>
References: <1306360741-12770-1-git-send-email-computersforpeace@gmail.com>
	<4DDDE19D.9010505@compulab.co.il>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 26 May 2011 08:16:48 +0300
Message-ID: <1306387008.2785.138.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-05-26 at 08:14 +0300, Igor Grinberg wrote:
> On 05/26/11 00:59, Brian Norris wrote:
> 
> > These simple printk error messages can be a little simpler to maintain
> > when they use the __func__ identifier.
> 
> While this is a good thing you are doing, I'd suggest using pr_err macro
> and may be even pr_fmt.
> 
> pr_err() will save you from the need to define the log level each time.
> pr_fmt will save you the need to add %s: and __func__.

Right, but in this _particular_ case the best thing to do is to just
kill the error messages - if any of the allocation functions fail they
print a large scary warning with a backtrace anyway, and the backtrace
will contain the caller function names.

Brian, would you please instead just zap the prints?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
