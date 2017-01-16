Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cT94C-0007Vz-LK
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 15:19:30 +0000
Subject: Re: [PATCH] mtd: partitions: no unnecessary check for erase block
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <20170106162624.544-1-bst@pengutronix.de>
 <20170109111855.7580f007@bbrezillon>
Cc: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger
 <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>
From: Bastian Stender <bst@pengutronix.de>
Message-ID: <fe55ed55-6f50-9c4a-def6-3a5f41276a63@pengutronix.de>
Date: Mon, 16 Jan 2017 16:19:05 +0100
MIME-Version: 1.0
In-Reply-To: <20170109111855.7580f007@bbrezillon>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 01/09/2017 11:18 AM, Boris Brezillon wrote:
> On Fri,  6 Jan 2017 17:26:24 +0100
> Bastian Stender <bst@pengutronix.de> wrote:
>
>> Partitions must start/end on erase block or boundary to be writeable.
>> This makes only sense if erasing is necessary. Do not force the
>> partition to be read-only if MTD_NO_ERASE flag is set.
>
> Shouldn't the partition be aligned on ->writesize in this case?

Yes, you are right. This patch is obsolete, I reworked it:

[PATCH 1/2] mtd: spi-nor: make n_sectors in flash_info 32 bit wide
<20170116151214.11195-1-bst@pengutronix.de>

[PATCH 2/2] mtd: spi-nor: fix mr25h* definitions
<20170116151214.11195-2-bst@pengutronix.de>

Regards,
Bastian Stender

-- 
Pengutronix e.K.
Industrial Linux Solutions
http://www.pengutronix.de/
Peiner Str. 6-8, 31137 Hildesheim, Germany
Amtsgericht Hildesheim, HRA 2686
