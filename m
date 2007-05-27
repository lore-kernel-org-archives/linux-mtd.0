Received: from 42.242.232.72.static.reverse.layeredtech.com ([72.232.242.42]
	helo=secure.poehali.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HsNzP-0003i6-96
	for linux-mtd@lists.infradead.org; Sun, 27 May 2007 15:01:20 -0400
Message-ID: <41348.127.0.0.1.1180292470.squirrel@localhost>
In-Reply-To: <20070527200853.3caf8206@dhcp-255-175.norway.atmel.com>
References: <465431DA.5030500@atmel.com>
	<1179992308.13101.16.camel@fuzzie.sanpeople.com>
	<46558893.1020802@comcast.net>
	<1180010988.13101.103.camel@fuzzie.sanpeople.com>
	<012d01c79e06$66823470$3204200a@head.local>
	<20070524164654.3f106ead@newbox> <20070524181437.01550127@newbox>
	<20070527200853.3caf8206@dhcp-255-175.norway.atmel.com>
Date: Sun, 27 May 2007 22:01:10 +0300 (EEST)
Subject: Re: Some issues with the AT91 dataflash driver...
From: "Ivan Kuten" <ivan.kuten@promwad.com>
To: "Haavard Skinnemoen" <hskinnemoen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: david-b@pacbell.net, linux-mtd@lists.infradead.org,
	Vadim Yatsenko <vadim.yatsenko@malva.ua>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> Looks to me like something more fundamental got broken. I'm using
> mtd_dataflash with the atmel_spi driver. I take it you're using
> at91_dataflash with the legacy AT91 SPI driver, right?
>

Correct I'm using at91_dataflash and legacy SPI on 2.6.22rc1+maxim patches.
Better say trying to use :-)

BR, Ivan
