Received: from mf2.realtek.com.tw ([220.128.56.22])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EmMZk-0005s6-Ck
	for linux-mtd@lists.infradead.org; Tue, 13 Dec 2005 21:41:07 -0500
Message-ID: <01dc01c60057$1b3fab30$106215ac@realtek.com.tw>
From: "colin" <colin@realtek.com.tw>
To: "Peter Menzebach" <pm-armlist@mw-itcon.de>
References: <014601c5ffb6$24baa670$106215ac@realtek.com.tw>
	<439E8A77.8020400@mw-itcon.de>
Date: Wed, 14 Dec 2005 10:35:54 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset="big5"
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


Hi Peter,
I noticed this driver before.
But I think it is strnage that there are many serial Flash chips in the
world but there is no any corresponding mtd driver in Linux kernel source
tree.
What's the reason of this?

Regards,
Colin


----- Original Message ----- 
From: "Peter Menzebach" <pm-armlist@mw-itcon.de>
To: "colin" <colin@realtek.com.tw>
Cc: <linux-mtd@lists.infradead.org>
Sent: Tuesday, December 13, 2005 4:46 PM
Subject: Re: Does Linux have serial flash drivers?


> colin wrote:
> > Hi all,
> > I have looked for several days. No serial flash driver can be found in
Linux
> > source tree.
> > Does Linux totally give up supporting serial flash?
> > Is it easy to write a chip driver of serial flash for MTD?
>
> Hi Colin,
> the at91rm9200dk board has a Atmel serial dataflash:
> http://maxim.org.za/AT91RM9200/2.6/
>
> There is a linux mtd driver and jffs2 support.
>
>
> Best regards
> Peter
>
> -- 
> Peter Menzebach
> Menzebach und Wolff IT-Consulting GbR
> Phone +49 751 355 387 1
