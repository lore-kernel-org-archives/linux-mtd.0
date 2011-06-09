Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUbSh-0003tz-Ij
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:23:36 +0000
Received: by vxd2 with SMTP id 2so1337651vxd.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 02:23:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4DF08D79.9090707@gmail.com>
References: <20110609083419.GA23553@doriath.ww600.siemens.net>
	<4DF08D79.9090707@gmail.com>
Date: Thu, 9 Jun 2011 13:23:31 +0400
Message-ID: <BANLkTi=rBr0YS9vApbhTGJLEWAsfWWu8Fg@mail.gmail.com>
Subject: Re: Question reg. parsing of mtd partitions
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
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

On 6/9/11, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com> wrote:
> On 09.06.2011 12:34, Dmitry Eremin-Solenikov wrote:
>> Hello, colleagues,
>>
>> While doing MTD partitions cleanup I noticed one strange thing.
>> parse_mtd_partitions function bears one extra argument (origin)
>> which isn't clearly described, set to non-zero only by ixp4xx.c
>> driver and then read by redboot partition table handling. I wander if we
>> can add some other way to handle this situation and drop this extra 0
>> argument from lots of drivers/handlers/etc.
>>
>> Could you please check it?
>
> At least the ixp4xx part was added by commit f40a6f1cc7fe522,
> back in 2006:
>
> If the amount of flash is not divisible by 2 then the mask in
> parse_mtd_partitions would fail to work as designed.  Passing in the
> base address corrects this problem.

Found the original patch/report at
http://thread.gmane.org/gmane.linux.ports.arm.kernel/24662

Awaiting for comments on this.

-- 
With best wishes
Dmitry
