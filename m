Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Na8oS-0003HW-Ed
	for linux-mtd@lists.infradead.org; Wed, 27 Jan 2010 14:24:12 +0000
Date: Wed, 27 Jan 2010 15:23:49 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH 0/8] Update support for MPC512x
Message-ID: <20100127152349.77fbb6de@wker>
In-Reply-To: <1264594052-20317-1-git-send-email-agust@denx.de>
References: <1264594052-20317-1-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: John Rigby <jcrigby@gmail.com>, dzu@denx.de, linux-usb@vger.kernel.org,
	Grant Likely <grant.likely@secretlab.ca>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	rtc-linux@googlegroups.com, Dan Williams <dan.j.williams@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 27 Jan 2010 13:07:24 +0100
Anatolij Gustschin <agust@denx.de> wrote:

> This patch series brings support for the Freescale MPC512x
> processsors up to date:
> 
> powerpc/mpc5121: Add machine restart support
> rtc: Add MPC5121 Real time clock driver
> mtd: Add NAND Flash Controller driver
> dma: Add MPC512x DMA driver
> powerpc/mpc5121: add USB host support
> powerpc/mpc5121: shared DIU framebuffer support
> powerpc/mpc5121: update mpc5121ads DTS
> powerpc/mpc5121: Add default config for MPC5121ADS

Now your can also pull these patches from 
    git://git.denx.de/linux-2.6-denx.git mpc512x-v2.6.33-devel
Branch. FEC Patches for interested people are also provided
in this Branch.

Best regards,

Anatolij

--
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
