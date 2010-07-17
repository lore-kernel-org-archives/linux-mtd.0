Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oa0IB-0000du-Ga
	for linux-mtd@lists.infradead.org; Sat, 17 Jul 2010 05:50:33 +0000
Received: by fxm3 with SMTP id 3so1617952fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 16 Jul 2010 22:50:29 -0700 (PDT)
Subject: Re: [PATCH 1/2] mxc_nand: fix Unbalanced enable for IRQ
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
In-Reply-To: <1276178584-10074-1-git-send-email-eric@eukrea.com>
References: <1276178584-10074-1-git-send-email-eric@eukrea.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 17 Jul 2010 08:50:24 +0300
Message-Id: <1279345824.3212.24.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: s.hauer@pengutronix.de, u.kleine-koenig@pengutronix.de,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.arm.linux.org.uk, ivo.clarysse@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-06-10 at 16:03 +0200, Eric Bénard wrote:
> * preset should be done before sending the reset command
> 
> * without this, I get the following error on an i.MX35 :
> [    0.900000] ------------[ cut here ]------------
> [    0.900000] WARNING: at kernel/irq/manage.c:290 __enable_irq+0x4c/0x88()
> [    0.900000] Unbalanced enable for IRQ 33
> [    0.900000] Modules linked in:
> [    0.900000] [<c002ffb8>] (unwind_backtrace+0x0/0xf0) from [<c02f7d0c>] (dump_stack+0x18/0x1c)
> [    0.900000] [<c02f7d0c>] (dump_stack+0x18/0x1c) from [<c0049a44>] (warn_slowpath_common+0x54/0x6c)
> [    0.900000] [<c0049a44>] (warn_slowpath_common+0x54/0x6c) from [<c0049b00>] (warn_slowpath_fmt+0x38/0x40)
> [    0.900000] [<c0049b00>] (warn_slowpath_fmt+0x38/0x40) from [<c008f65c>] (__enable_irq+0x4c/0x88)
> [    0.900000] [<c008f65c>] (__enable_irq+0x4c/0x88) from [<c008fca0>] (enable_irq+0x54/0x98)
> [    0.900000] [<c008fca0>] (enable_irq+0x54/0x98) from [<c021e618>] (wait_op_done+0x40/0x134)
> [    0.900000] [<c021e618>] (wait_op_done+0x40/0x134) from [<c021e808>] (send_cmd+0x30/0x38)
....

Pushed to l2-mtd-2.6.git / master

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
