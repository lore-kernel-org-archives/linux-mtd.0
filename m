Subject: Re: [PATCH] sst25l.c: fix multi-part messages with broken spi masters
From: Artem Bityutskiy <dedekind1@gmail.com>
To: H Hartley Sweeten <hartleys@visionengravers.com>
In-Reply-To: <0D753D10438DA54287A00B0270842697636E305D4A@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B0270842697636E305D4A@AUSP01VMBX24.collaborationhost.net>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 05 May 2010 08:45:49 +0300
Message-ID: <1273038349.3702.54.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	"ryan@bluewatersys.com" <ryan@bluewatersys.com>,
	"andre@bluewatersys.com" <andre@bluewatersys.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Linux Kernel <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-04-29 at 13:34 -0500, H Hartley Sweeten wrote:
> Some SPI masters (ep93xx) have limitations when using the SFRMOUT
> signal for the spi device chip select.  The SFRMOUT signal is
> only asserted as long as the spi transmit fifo contains data.  As
> soon as the last bit is clocked into the receive fifo it gets
> deasserted.
> 
> The functions sst25l_status and sst25l_match_device use the API
> function spi_write_then_read to write a command to the flash then
> read the response back.  This API function creates a two part spi
> message for the write then read.  When this message is transferred
> the SFRMOUT signal ends up getting deasserted after the command
> phase.  This causes the command to get aborted by the device so
> the read phase returns invalid data.
> 
> By changing sst25l_status and sst25l_match_device to use a single
> transfer synchronous message, the SFRMOUT signal stays asserted
> during the entire message so the correct data always gets returned.
> 
> This change will have no effect on SPI masters which use a chip
> select mechanism (GPIO's, etc.) which does stay asserted correctly.
> As a bonus, the single transfer synchronous messages complete faster
> than multi-part messages.
> 
> Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> Cc: Andre Renaud <andre@bluewatersys.com>
> Cc: Ryan Mallon <ryan@bluewatersys.com>

Pushed to l2-mtd-2.6 / dunno.

But please, notice for future:
1. It is much nicer to put something like [PATCH v2] when you re-send.
2. In MTD we prefix everything with mtd:

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
