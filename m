Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUbDu-0003RW-8v
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:08:18 +0000
Received: by wwb39 with SMTP id 39so1078234wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 02:08:13 -0700 (PDT)
Message-ID: <4DF08D79.9090707@gmail.com>
Date: Thu, 09 Jun 2011 13:08:09 +0400
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Question reg. parsing of mtd partitions
References: <20110609083419.GA23553@doriath.ww600.siemens.net>
In-Reply-To: <20110609083419.GA23553@doriath.ww600.siemens.net>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Brian Walsh <brian@walsh.ws>, Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>,
	Deepak Sanexa <dsanexa@mvista.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09.06.2011 12:34, Dmitry Eremin-Solenikov wrote:
> Hello, colleagues,
>
> While doing MTD partitions cleanup I noticed one strange thing.
> parse_mtd_partitions function bears one extra argument (origin)
> which isn't clearly described, set to non-zero only by ixp4xx.c
> driver and then read by redboot partition table handling. I wander if we
> can add some other way to handle this situation and drop this extra 0
> argument from lots of drivers/handlers/etc.
>
> Could you please check it?

At least the ixp4xx part was added by commit f40a6f1cc7fe522,
back in 2006:

If the amount of flash is not divisible by 2 then the mask in
parse_mtd_partitions would fail to work as designed.  Passing in the 
base address corrects this problem.


-- 
With best wishes
Dmitry
