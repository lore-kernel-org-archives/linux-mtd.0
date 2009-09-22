Date: Tue, 22 Sep 2009 16:25:48 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Anton Vorontsov <avorontsov@ru.mvista.com>
Subject: Re: [PATCH 2/2] mtd: m25p80: Add support for CAT25xxx serial EEPROMs
Message-Id: <20090922162548.3e20e67c.akpm@linux-foundation.org>
In-Reply-To: <20090818214628.GB22651@oksana.dev.rtsoft.ru>
References: <20090818214449.GA12848@oksana.dev.rtsoft.ru>
	<20090818214628.GB22651@oksana.dev.rtsoft.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: dbrownell@users.sourceforge.net, dedekind1@gmail.com,
	linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org,
	linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 19 Aug 2009 01:46:28 +0400
Anton Vorontsov <avorontsov@ru.mvista.com> wrote:

> CAT25 chips (as manufactured by On Semiconductor, previously Catalyst
> Semiconductor) are similar to the original M25Px0 chips, except:
> 
> - Address width can vary (1-2 bytes, in contrast to 3 bytes in M25P
>   chips). So, implement convenient m25p_addr2cmd() and m25p_cmdsz()
>   calls, and place address width information into flash_info struct;
> 
> - Page size can vary, therefore we shouldn't hardcode it, so get rid
>   of FLASH_PAGESIZE definition, and place the page size information
>   into flash_info struct;
> 
> - CAT25 EEPROMs don't need to be erased, so add NO_ERASE flag, and
>   propagate it to the mtd subsystem.

This patch (still) doesn't know about the mx25l3205d, mx25l12805d and
mx25l12855e devices.

I randomly did this:

->	{ "mx25l3205d", INFO(0xc22016, 0, 64 * 1024, 64, 256, 3, 0) },
->	{ "mx25l6405d", INFO(0xc22017, 0, 64 * 1024, 128, 256, 3, 0) },
	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 256, 3, 0) },
->	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 256, 3, 0) },
