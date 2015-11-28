Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a2bMb-0008Iq-87
 for linux-mtd@lists.infradead.org; Sat, 28 Nov 2015 09:00:14 +0000
Subject: Re: [PATCH] Revert "mtd: spi-nor: disable protection for Winbond
 flash at startup"
To: Brian Norris <computersforpeace@gmail.com>
References: <1448555221-24257-1-git-send-email-nbd@openwrt.org>
 <20151127222701.GA19615@localhost>
Cc: linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
From: Felix Fietkau <nbd@openwrt.org>
Message-ID: <56596CFF.10002@openwrt.org>
Date: Sat, 28 Nov 2015 09:59:43 +0100
MIME-Version: 1.0
In-Reply-To: <20151127222701.GA19615@localhost>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015-11-27 23:27, Brian Norris wrote:
> Hi Felix,
> 
> On Thu, Nov 26, 2015 at 05:27:01PM +0100, Felix Fietkau wrote:
>> This reverts commit c6fc2171b249e73745c497b578b417a2946f1b2f.
>> 
>> This commit is breaking read access on at least s25fl064k, but also
>> possibly other Spansion flash chips.
> 
> This makes no sense. This patch is about Winbond flash, but you're
> referencing Spansion flash in the commit subject. I suspect you have
> either some more explaining, or some better investigation to do, because
> I don't understand how the commit in question could be the problem for
> you.
Take a look at these Spansion flash ids:

    { "s25fl004k",  INFO(0xef4013,      0,  64 * 1024,   8, SECT_4K |
SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
    { "s25fl008k",  INFO(0xef4014,      0,  64 * 1024,  16, SECT_4K |
SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
    { "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32, SECT_4K |
SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
    { "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) },

Note how they start with 0xef (SNOR_MFR_WINBOND).

>> Any mtd read seems to succeed, but simply returns a zero-filled buffer.
> 
> If this is the symptom you're looking at, I doubt you have the right
> fix. Wild guess: something similar to this patch:
> 
>   http://patchwork.ozlabs.org/patch/547367/
>   "mtd: spi-nor: wait until lock/unlock operations are ready"
When I have access to a similar device again, I can give this fix a try.
If that doesn't work, then maybe we need to add an extra check to
exclude Spansion flashes from the codepath that checks for SNOR_MFR_WINBOND.

- Felix
