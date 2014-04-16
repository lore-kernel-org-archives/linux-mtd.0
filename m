Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaZSA-0000Dh-RL
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 23:41:19 +0000
From: Marek Vasut <marex@denx.de>
To: Austin Boyle <boyle.austin@gmail.com>
Subject: Re: [PATCH v3] mtd: m25p80: Calculate flash block protect bits based
 on number of sectors
Date: Thu, 17 Apr 2014 01:22:20 +0200
References: <alpine.DEB.2.02.1404162227120.3848@austin-Satellite-L510>
In-Reply-To: <alpine.DEB.2.02.1404162227120.3848@austin-Satellite-L510>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404170122.20996.marex@denx.de>
Cc: Angus Clark <angus.clark@st.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Gerlando Falauto <gerlando.falauto@keymile.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, April 16, 2014 at 02:37:13 PM, Austin Boyle wrote:
> This patch generalises the calculation of block protect bits based on the
> number of sectors and implements the _is_locked function.
> 
> Existing calculation of block protect bits only works for devices with 64
> sectors or more. This new logic is applicable to the STmicro devices:
> m25p10, p20, p40, p80, p16, pe16, p32, p64, p128.
> Note devices with >64 sectors only allow the protected region to be
> specified to a resolution of 1/64th of the total size (such as m25p64).
> 
> New return codes for ioctl(MEMISLOCKED) have been added to
> uapi/mtd/mtd-abi.h because the _is_locked function can query a region
> which is partially unlocked.
> 
> Added flag to m25p_ids table to indicate if flash protection is supported.
> 
> Added n_sectors and sector_size to m25p flash structure so it can be used
> in block protect bit calculation.
> 
> From: Austin Boyle <boyle.austin@gmail.com>
> Signed-off-by: Austin Boyle <boyle.austin@gmail.com>

Acked-by: Marek Vasut <marex@denx.de>

Thanks!

Best regards,
Marek Vasut
