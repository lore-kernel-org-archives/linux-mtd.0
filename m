Subject: Re: [PATCH] MTD: Add support for the CPCI405 board
From: David Woodhouse <dwmw2@infradead.org>
To: Matthias Fuchs <matthias.fuchs@esd-electronics.com>
In-Reply-To: <449017E0.7070008@esd-electronics.com>
References: <449017E0.7070008@esd-electronics.com>
Content-Type: text/plain
Date: Wed, 14 Jun 2006 21:12:27 +0100
Message-Id: <1150315948.11159.182.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-06-14 at 16:06 +0200, Matthias Fuchs wrote:
> This patch adds MTD support for the NOR flash on CPCI405 boards.
>
> These boards may have different flash chips installed. Some of them
> are detected by the cfi probing. Others need the jedec_probe support.
> The patch also adds support for SST39VF3201 chips in jedec_probe.c

Please could you send the SST39VF3201 support separately? 

I want to stop adding map drivers -- any reason you can't use physmap?
Either with a platform_device, or preferably by extending it to use an
of_device too, since this is a PPC platform.

-- 
dwmw2
