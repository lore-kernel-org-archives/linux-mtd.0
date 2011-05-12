Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKURd-0001SN-Hp
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 11:52:42 +0000
Received: by ewy3 with SMTP id 3so470932ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 04:52:39 -0700 (PDT)
Subject: Re: [PATCH] mtd: m25p80: Use CFI to identify unknown flash chips
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <97ed2bb63176b59ee2b283be69f0c6a4@localhost>
References: <97ed2bb63176b59ee2b283be69f0c6a4@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 May 2011 14:49:17 +0300
Message-ID: <1305200957.2713.99.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-05-08 at 16:16 -0700, Kevin Cernekee wrote:
> Many of the newer SPI flash devices support both JEDEC and CFI queries.
> While JEDEC RDID only returns the device ID, CFI provides the device
> size, eraseblock size, and other information.  In some cases this may
> allow previously unknown devices to be supported without adding yet
> another entry to m25p_ids[].
> 
> This patch replaces jedec_probe() with a new cfi_probe() function.  The
> existing JEDEC probe/match logic is attempted first, and CFI is only used
> if no match is found.
> 
> Additionally, platform_data.type may now specify "auto", which instructs
> m25p80.c to autodetect the chip type rather than trying to match a
> specific entry.  In some situations, board manufacturers have multiple
> sources for flash parts (usually with identical geometries), but do not
> know in advance which specific part will be used on a given board.  The
> "auto" parameter allows the BSP to indicate this to the driver, so that
> the driver does not warn the user about a flash device mismatch.
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> ---
>  drivers/mtd/devices/m25p80.c |  181 ++++++++++++++++++++++++++++--------------
>  1 files changed, 121 insertions(+), 60 deletions(-)

Could you please send a patch which cleanly applies to l2-mtd-2.6.git?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
