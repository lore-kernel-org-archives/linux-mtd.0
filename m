Received: from mail.bluewatersys.com ([202.124.120.130]
	helo=hayes.bluewaternz.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pexlw-0003J4-OD
	for linux-mtd@lists.infradead.org; Mon, 17 Jan 2011 22:42:02 +0000
Message-ID: <4D34C5BF.2070107@bluewatersys.com>
Date: Tue, 18 Jan 2011 11:42:07 +1300
From: Ryan Mallon <ryan@bluewatersys.com>
MIME-Version: 1.0
To: Hong Xu <hong.xu@atmel.com>
Subject: Re: [PATCH] MTD: atmel_nand: Add DMA support to access Nandflash
References: <hong.xu@atmel.com>
	<1295248809-30334-2-git-send-email-hong.xu@atmel.com>
	<4D34A37E.1060300@bluewatersys.com>
In-Reply-To: <4D34A37E.1060300@bluewatersys.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: nicolas.ferre@atmel.com, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, jamie@jamieiles.com,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/18/2011 09:15 AM, Ryan Mallon wrote:
> On 01/17/2011 08:20 PM, Hong Xu wrote:
>> Some SAM9 chips have the ability to perform DMA between CPU and SMC controller.
>> This patch adds DMA support for SAM9RL, SAM9G45, SSAM9G46,AM9M10, SAM9M11.

I'm trying to patch this into a 2.6.33 kernel running on a custom
SAM9G45 based board, but I get a failure requesting the DMA channel:

root@snapper:~$ dmesg | grep -i dma
[    0.850000] atmel_nand atmel_nand: Failed to request DMA channel
[    0.860000] atmel_nand atmel_nand: No DMA support for NAND access.
[    1.530000] at_hdmac at_hdmac: Atmel AHB DMA Controller ( cpy slave ), 8 channels


It looks like the registration for the DMA controller happens after the
NAND driver probe and so the request is failing. I had a quick look, but
I can't see anything that would change this in more recent kernels. Any
ideas?

Also, I think you want to add the following for the atmel_nand Kconfig:
  select AT_HDMAC

or make the DMA parts of the driver ifdef CONFIG_AT_HDMAC (if the above
won't work for some reason) since you will get build errors on the
dmaengine functions otherwise.

~Ryan

-- 
Bluewater Systems Ltd - ARM Technology Solution Centre

Ryan Mallon         		5 Amuri Park, 404 Barbadoes St
ryan@bluewatersys.com         	PO Box 13 889, Christchurch 8013
http://www.bluewatersys.com	New Zealand
Phone: +64 3 3779127		Freecall: Australia 1800 148 751 
Fax:   +64 3 3779135			  USA 1800 261 2934
