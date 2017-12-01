Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eKi86-0003Tr-Qh
 for linux-mtd@lists.infradead.org; Fri, 01 Dec 2017 10:01:12 +0000
From: Richard Weinberger <richard@nod.at>
To: Manfred Spraul <manfred@colorfullife.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: UBIFS does not mount after powerfail
Date: Fri, 01 Dec 2017 11:01:11 +0100
Message-ID: <2022791.e9MJ6XV9Zj@blindfold>
In-Reply-To: <df8dc8e7-cb9a-4cef-bca6-cfc40092b1d1@colorfullife.com>
References: <195075f7-01f8-58d2-ba1c-4291e62a39cc@colorfullife.com>
 <2908877.jEbli3qftF@blindfold>
 <df8dc8e7-cb9a-4cef-bca6-cfc40092b1d1@colorfullife.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Manfred,

Am Freitag, 1. Dezember 2017, 08:41:28 CET schrieb Manfred Spraul:
> > What did you set for CONFIG_MTDRAM_TOTAL_SIZE and
> > CONFIG_MTDRAM_ERASE_SIZE?
> 
> CONFIG_MTD_MTDRAM=y
> CONFIG_MTDRAM_TOTAL_SIZE=32768
> CONFIG_MTDRAM_ERASE_SIZE=128

> CONFIG_MTDRAM_WRITE_SIZE=2048
> CONFIG_MTDRAM_WRITEBUF_SIZE=2048
> CONFIG_MTDRAM_FLIGHTRECORDER=y
> CONFIG_MTDRAM_FLIGHTRECORDER_BUFFER_SIZE=131072
> CONFIG_MTDRAM_FLIGHTRECORDER_ENABLED=y

These options are not available on my kernel?
Should the image actually work on a stock MTDRAM?

Thanks,
//richard
