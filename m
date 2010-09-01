Received: from mail-qw0-f49.google.com ([209.85.216.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OqwSK-0004hZ-80
	for linux-mtd@lists.infradead.org; Wed, 01 Sep 2010 23:11:00 +0000
Received: by qwe4 with SMTP id 4so7694794qwe.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Sep 2010 16:10:51 -0700 (PDT)
Subject: Re: UBI crashes / fixing NAND subpage writes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jon Povey <Jon.Povey@racelogic.co.uk>
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE0903E02F56@Cloud.RL.local>
References: <70E876B0EA86DD4BAF101844BC814DFE0903E02F56@Cloud.RL.local>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Sep 2010 02:10:46 +0300
Message-ID: <1283382646.2209.61.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-09-01 at 08:40 +0100, Jon Povey wrote:
> Of course this is not a very good solution. The right thing to do
> would seem to be make nand_do_write_ops() properly subpage aware and
> either add start and end offsets to the nand_write_page* family of
> functions, or add a nand_write_subpage* family of functions.
> 
> I don't mind having a go at some of this but am not confident to start
> such major overhaul of nand_base.c without at least seeking comment
> from others, so: This email. Maybe there's already something being
> worked on?

I think nand_write_subpage() is a good way do deal with this. If the
chip does not define own nand_write_subpage(), we fall-back to the
default one which uses the current way.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
