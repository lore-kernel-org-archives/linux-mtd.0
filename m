Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OUAhp-0003Zm-A1
	for linux-mtd@lists.infradead.org; Thu, 01 Jul 2010 03:44:55 +0000
Received: by fxm20 with SMTP id 20so995147fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 30 Jun 2010 20:44:51 -0700 (PDT)
Subject: Re: [PATCH] mtd: Added an ioctl to query the lock status of a
	flash sector.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Cochran <richardcochran@gmail.com>
In-Reply-To: <20100614161033.GA24877@riccoc20.at.omicron.at>
References: <20100531131214.GA15887@riccoc20.at.omicron.at>
	<1276419903.19028.180.camel@localhost>
	<20100614161033.GA24877@riccoc20.at.omicron.at>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 01 Jul 2010 06:44:45 +0300
Message-Id: <1277955885.3599.27.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-06-14 at 18:10 +0200, Richard Cochran wrote:
> On Sun, Jun 13, 2010 at 12:05:03PM +0300, Artem Bityutskiy wrote:
> > I think it is tiny bit nicer to name 'is_locked', which is a bit more
> > consistent with the already existing 'block_isbad'?
> 
> Okay, here it is again.
> 
> Thanks,
> Richard
> 
> 
> This patchs adds a way for user space programs to find out whether a
> flash sector is locked. An optional driver method in the mtd_info struct
> provides the information.
> 
> Signed-off-by: Richard Cochran <richard.cochran@omicron.at>

Pushed to l2-mtd-2.6.git / master.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
