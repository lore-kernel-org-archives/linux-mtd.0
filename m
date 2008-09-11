Received: from web63404.mail.re1.yahoo.com ([69.147.97.44])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KdtoC-0000iV-Vg
	for linux-mtd@lists.infradead.org; Thu, 11 Sep 2008 21:34:37 +0000
Date: Thu, 11 Sep 2008 14:34:35 -0700 (PDT)
From: Fundu <fundu_1999@yahoo.com>
Subject: Re: Flash Mapping and gpio
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <8bd0f97a0809111428o168053a8n6dac603529ad3d23@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <684880.57070.qm@web63404.mail.re1.yahoo.com>
Cc: linux-mtd@lists.infradead.org
Reply-To: fundu_1999@yahoo.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> you shouldnt go mucking about in common code.  this is what
> flash
> mapping drivers are for.
> 
> ive already written a generic gpio one to do exactly what
> you want
> (but it's only been tested on nommu/Blackfin so far):
> http://blackfin.uclinux.org/git/?p=readonly-mirrors/linux-kernel.git;a=blob_plain;f=drivers/mtd/maps/gpio-addr-flash.c;hb=HEAD

these are on 2.6 kernel. i'm using 2.4.20.




      
