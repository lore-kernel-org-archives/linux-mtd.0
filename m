Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dnijn-00087H-Jk
 for linux-mtd@lists.infradead.org; Fri, 01 Sep 2017 09:59:45 +0000
Date: Fri, 1 Sep 2017 12:52:47 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Stefan Roese <sr@denx.de>
Subject: Re: [PATCH 10/10] spi-nor: intel-spi: Fall back to use SW sequencer
 to erase
Message-ID: <20170901095247.GY2598@lahna.fi.intel.com>
References: <1504252841-2445-1-git-send-email-bmeng.cn@gmail.com>
 <1504252841-2445-11-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1504252841-2445-11-git-send-email-bmeng.cn@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 01, 2017 at 01:00:41AM -0700, Bin Meng wrote:
>  	/*
> +	 * Determine whether erase operatoin should use HW or SW sequencer.
                                   ^^^^^^^^^
Typo

> +	 *
> +	 * The HW sequencer has a predefined list of opcodes, with only the
> +	 * erase opcode being programmable in LVSCC and UVSCC registers.
> +	 * If these registers don't contain a valid erase opcode, erase
> +	 * cannot be done using HW sequencer.
> +	 */
