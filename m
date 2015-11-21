Date: Fri, 20 Nov 2015 17:36:03 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Bayi Cheng <bayi.cheng@mediatek.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Kurtz <djkurtz@chromium.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, srv_heupstream@mediatek.com,
 jteki@openedev.com, ezequiel@vanguardiasur.com.ar
Subject: Re: [PATCH v8 1/2] mtd: mtk-nor: mtk serial flash controller driver
Message-ID: <20151121013603.GG64635@google.com>
References: <1447817403-16631-1-git-send-email-bayi.cheng@mediatek.com>
 <1447817403-16631-2-git-send-email-bayi.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1447817403-16631-2-git-send-email-bayi.cheng@mediatek.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 18, 2015 at 11:30:02AM +0800, Bayi Cheng wrote:
> add spi nor flash driver for mediatek controller
> 
> Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
> ---
>  drivers/mtd/spi-nor/Kconfig       |   7 +
>  drivers/mtd/spi-nor/Makefile      |   1 +
>  drivers/mtd/spi-nor/mtk-quadspi.c | 486 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 494 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/mtk-quadspi.c

Looks good now. Thanks! Applied to l2-mtd.git, with a trivial whitespace
fixup.
