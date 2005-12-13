Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Em5o5-0006ci-P7
	for linux-mtd@lists.infradead.org; Tue, 13 Dec 2005 03:46:53 -0500
Message-ID: <439E8A77.8020400@mw-itcon.de>
Date: Tue, 13 Dec 2005 09:46:47 +0100
From: Peter Menzebach <pm-armlist@mw-itcon.de>
MIME-Version: 1.0
To: colin <colin@realtek.com.tw>
References: <014601c5ffb6$24baa670$106215ac@realtek.com.tw>
In-Reply-To: <014601c5ffb6$24baa670$106215ac@realtek.com.tw>
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
> Hi all,
> I have looked for several days. No serial flash driver can be found in Linux
> source tree.
> Does Linux totally give up supporting serial flash?
> Is it easy to write a chip driver of serial flash for MTD?

Hi Colin,
the at91rm9200dk board has a Atmel serial dataflash:
http://maxim.org.za/AT91RM9200/2.6/

There is a linux mtd driver and jffs2 support.


Best regards
Peter

-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
