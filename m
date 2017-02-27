Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ciS8M-0004z5-Os
 for linux-mtd@lists.infradead.org; Mon, 27 Feb 2017 20:43:05 +0000
Received: by mail-wm0-x241.google.com with SMTP id u63so15205145wmu.2
 for <linux-mtd@lists.infradead.org>; Mon, 27 Feb 2017 12:42:42 -0800 (PST)
Subject: Re: [RFC 0/3] drivers: Add an API to read device specific config data
To: Alban <albeu@free.fr>, linux-kernel@vger.kernel.org
References: <1488227292-18906-1-git-send-email-albeu@free.fr>
Cc: linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <56dbc1bb-236f-09ff-dae9-f4afea1298e7@gmail.com>
Date: Mon, 27 Feb 2017 21:42:38 +0100
MIME-Version: 1.0
In-Reply-To: <1488227292-18906-1-git-send-email-albeu@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/27/2017 09:28 PM, Alban wrote:
> Hi all,
> 
> while looking at adding OF support for the ath9k driver I had the problem of
> reading the EEPROM data. On the SoC platforms this data is stored in an SPI
> flash along with a few other things. In OpenWRT/LEDE this data is read from
> the board init code using the fact that the flash is (normaly) readable from
> a memory map. A bit too hackish for my taste.
> 
> This is just one example, there is various other similar cases, mostly with
> MAC addresses. I thought it would be nicer if we had a clean API for this,
> similar to the firmware API but per device instance instead of beeing per
> driver. The device driver wouldn't have to care where the data is stored,
> they just request it and the backend take care of reading the EEPROM, MTD
> or whatever is used on the board.

Can't we use the NVMEM for this stuff ?

> This series implement such an API along with an implementation for MTD
> devices and a use in the ath9k driver. As this is an RFC I didn't yet
> write the OF binding documentation, that will come later if the feedback
> is positive.
> 
> Alban Bedel (3):
>   drivers: Add an API to read device specific config data
>   mtd: Add support for reading device data out of MTD devices
>   ath9k: ahb: Add OF support
> 
>  drivers/base/Kconfig                   |   6 +
>  drivers/base/Makefile                  |   1 +
>  drivers/base/devdata.c                 | 204 +++++++++++++++++++++++++++++++++
>  drivers/mtd/Kconfig                    |   9 ++
>  drivers/mtd/Makefile                   |   1 +
>  drivers/mtd/devdata.c                  |  70 +++++++++++
>  drivers/net/wireless/ath/ath9k/Kconfig |   1 +
>  drivers/net/wireless/ath/ath9k/ahb.c   |  55 +++++++--
>  drivers/net/wireless/ath/ath9k/init.c  |  41 ++++++-
>  include/linux/devdata.h                |  79 +++++++++++++
>  10 files changed, 459 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/base/devdata.c
>  create mode 100644 drivers/mtd/devdata.c
>  create mode 100644 include/linux/devdata.h
> 


-- 
Best regards,
Marek Vasut
