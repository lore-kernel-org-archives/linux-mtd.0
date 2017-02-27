Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ciS8D-0004yt-L8
 for linux-mtd@lists.infradead.org; Mon, 27 Feb 2017 20:42:56 +0000
Date: Mon, 27 Feb 2017 21:42:30 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Alban <albeu@free.fr>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Moritz Fischer
 <moritz.fischer@ettus.com>
Subject: Re: [RFC 0/3] drivers: Add an API to read device specific config data
Message-ID: <20170227214230.53f05677@bbrezillon>
In-Reply-To: <1488227292-18906-1-git-send-email-albeu@free.fr>
References: <1488227292-18906-1-git-send-email-albeu@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+Moritz

Hi Alban,

On Mon, 27 Feb 2017 21:28:09 +0100
Alban <albeu@free.fr> wrote:

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
> 
> This series implement such an API along with an implementation for MTD
> devices and a use in the ath9k driver. As this is an RFC I didn't yet
> write the OF binding documentation, that will come later if the feedback
> is positive.

What you're looking for already exists and it's called nvmem[1]. Some
work has been done to expose MTD partitions as nvmem cells [2], but
it's never been finished.
Can you please finish Moritz implementation instead of creating a new
API?

Thanks,

Boris

[1]http://lxr.free-electrons.com/source/Documentation/nvmem/nvmem.txt
[2]https://patchwork.ozlabs.org/patch/626460/
