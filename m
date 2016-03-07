Date: Mon, 7 Mar 2016 12:34:10 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Yuan Yao <yao.yuan@freescale.com>
Cc: dwmw2@infradead.org, han.xu@freescale.com, robh@kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 yao.yuan@nxp.com
Subject: Re: [PATCH v4 1/7] mtd: spi-nor: fsl-quadspi: add big-endian support
Message-ID: <20160307203410.GX55664@google.com>
References: <1453793041-35868-1-git-send-email-yao.yuan@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1453793041-35868-1-git-send-email-yao.yuan@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 26, 2016 at 03:23:55PM +0800, Yuan Yao wrote:
> Add R/W functions for big- or little-endian registers:
> The qSPI controller's endian is independent of the CPU core's endian.
> So far, the qSPI have two versions for big-endian and little-endian.
> 
> Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
> Acked-by: Han xu <han.xu@freescale.com>

Pushed patches 1, 2, 3, 5, and 7 to l2-mtd.git. Patch 4 seems unrelated,
and patch 6 should go through arm-soc.

Regards,
Brian
