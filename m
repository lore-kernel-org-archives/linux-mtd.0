Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EmRrv-00024D-Ht
	for linux-mtd@lists.infradead.org; Wed, 14 Dec 2005 03:20:19 -0500
Message-ID: <439FD5BF.1090507@mw-itcon.de>
Date: Wed, 14 Dec 2005 09:20:15 +0100
From: Peter Menzebach <pm-armlist@mw-itcon.de>
MIME-Version: 1.0
To: colin <colin@realtek.com.tw>
References: <014601c5ffb6$24baa670$106215ac@realtek.com.tw>	<439E8A77.8020400@mw-itcon.de>
	<01dc01c60057$1b3fab30$106215ac@realtek.com.tw>
In-Reply-To: <01dc01c60057$1b3fab30$106215ac@realtek.com.tw>
Content-Type: text/plain; charset=Big5
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Does Linux have serial flash drivers?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

colin wrote:
> Hi Peter,
> I noticed this driver before.
> But I think it is strnage that there are many serial Flash chips in the
> world but there is no any corresponding mtd driver in Linux kernel source
> tree.
> What's the reason of this?
> 
> Regards,
> Colin

Maybe, because most boards will then need 2 flashs with different
interfaces. Afaik only the Atmel at91... can boot directly from serial
dataflash due to it's internal ROM services.

Even this seems to be not a mainstream way to boot, because the
maintainer of the available bootloader (u-boot) declared that way to
boot deprecated.

In our case it was fine, because this allowed to reduce the size of the
board.

Another reason might be a hen/egg problem. (driver/first board available)

Best regards
Peter

-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
