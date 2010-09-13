Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ov2VN-0004rd-0m
	for linux-mtd@lists.infradead.org; Mon, 13 Sep 2010 06:27:05 +0000
Received: by fxm12 with SMTP id 12so3721402fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 12 Sep 2010 23:27:04 -0700 (PDT)
Subject: RE: linux equivalent of u-boot's "nand scrub" (erasing blocks even
	whenOOB says "bad")
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jon Povey <Jon.Povey@racelogic.co.uk>
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE0903E3E3DD@Cloud.RL.local>
References: <70E876B0EA86DD4BAF101844BC814DFE0903E3E3DD@Cloud.RL.local>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 13 Sep 2010 09:25:40 +0300
Message-ID: <1284359140.27765.156.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-09-13 at 06:54 +0100, Jon Povey wrote:
> Mike Frysinger wrote:
> > ive come across a situation where it would have been invaluable to
> > have the ability to "scrub" the nand flash while running linux.
> 
> I would find this useful too, or more specifically I recently wanted to rewrite the BBT in software from linux (to change OOB layout), but those blocks are marked off-limits. Some way to force it would be nice.
> 
> I am just rambling though, no real useful suggestion :) Sorry..
> 
> As for clearing blocks marked bad, how about MEMSETGOODBLOCK as the inverse of the existing MEMSETBADBLOCK?

So may be we need a separate ioctl for dealing with bad eraseblocks
which will also include abilities to re-write BBT?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
