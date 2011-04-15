Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QAg0U-0005on-AN
	for linux-mtd@lists.infradead.org; Fri, 15 Apr 2011 10:12:06 +0000
Received: by ewy3 with SMTP id 3so827583ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Apr 2011 03:12:04 -0700 (PDT)
Subject: veto CONFIG_MTD_PARTITIONS?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 15 Apr 2011 13:09:06 +0300
Message-ID: <1302862146.3220.23.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>,
	jwboyer <jwboyer@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

we have a very small mtdpart driver which provides very basic mtd
partitioning services. And this driver may be compiled out. This
probably mattered many years ago, when saving ~7KiB (on arm arch)
mattered a lot.

But this creates mess:

[dedekind@eru l2-mtd-2.6]$ grep -r CONFIG_MTD_PARTITIONS drivers/mtd/* |
wc -l
132

We have really a lot of these "#ifdef CONFIG_MTD_PARTITIONS" statements,
nearly in every driver. And new drivers have this.

I think it is time to declare than saving ~7KiB is not worth the mess
anymore and veto CONFIG_MTD_PARTITIONS - no new "#ifdef
CONFIG_MTD_PARTITIONS" should be accepted.

Someone should just make mtdpart.c to be an integral part of the MTD
core and remove all those #ifdefs.

Hopefully we'll force someone to clean this up.

If no one strongly disagrees, let's veto CONFIG_MTD_PARTITIONS usage.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
