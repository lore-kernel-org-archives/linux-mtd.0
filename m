Received: from mail-qy0-f170.google.com ([209.85.216.170])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oqwit-0001c0-Gs
	for linux-mtd@lists.infradead.org; Wed, 01 Sep 2010 23:28:07 +0000
Received: by qyk35 with SMTP id 35so1349571qyk.15
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Sep 2010 16:28:07 -0700 (PDT)
Subject: Re: Reporting nand bad blocks in Linux
From: Artem Bityutskiy <dedekind1@gmail.com>
To: jmintern@datacast.com
In-Reply-To: <4C7E4540.9040203@datacast.com>
References: <4C7E4540.9040203@datacast.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 02 Sep 2010 02:28:03 +0300
Message-ID: <1283383683.2209.69.camel@brekeke>
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

On Wed, 2010-09-01 at 08:21 -0400, Jonne Mintern wrote:
> To report nand bad blocks, I have been using cmd 'nand bad' from
> uboot. What Linux cmd will get thesame report from a Linux prompt? I'm
> using Denx eldk4.2 on an AMCC PPC440EPx. I'm not sure what nand chip.

Hmm, I think this utility does not exist, and you need to implement it,
but I am not 100% sure.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
