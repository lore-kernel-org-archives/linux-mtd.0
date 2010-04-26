Received: from relay.ptn-ipout02.plus.net ([212.159.7.36])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O6PAm-0008LC-CW
	for linux-mtd@lists.infradead.org; Mon, 26 Apr 2010 14:20:34 +0000
Message-ID: <e7392dc2d94a37b3abee7b0c199b4ebe.squirrel@webmail.plus.net>
In-Reply-To: <y2zfb0149a91004260523n8c61e72es6be68d5d7ea162e6@mail.gmail.com>
References: <afe027b8af6429f1eaf61baae36235d3.squirrel@webmail.plus.net>
	<y2zfb0149a91004260523n8c61e72es6be68d5d7ea162e6@mail.gmail.com>
Date: Mon, 26 Apr 2010 15:20:29 +0100
Subject: Re: Obtaining start/end address of an MTD partition
From: "Matthew Lear" <matt@bubblegen.co.uk>
To: "lei yang" <yanglei.fage@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: matt@bubblegen.co.uk, linux-mtd@lists.infradead.org
Reply-To: matt@bubblegen.co.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hi Matt,
>
> Please try below:
>
> zcat /proc/config.gz |grep PHYSMAP_START

Thanks but /proc/config.gz doesn't exist on the embedded system that we're
developing on. To be clear, I'm trying to access the start/end addresses
from a program, not from a command prompt.
Cheers,
--  Matt
