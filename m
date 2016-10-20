Date: Thu, 20 Oct 2016 20:57:45 +0300
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sergio Prado <sergio.prado@e-labworks.com>
Cc: linux@armlinux.org.uk, linux@simtec.co.uk, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org, kgene@kernel.org,
 javier@osg.samsung.com, boris.brezillon@free-electrons.com,
 richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mtd: s3c2410: parse the device configuration from
 OF node
Message-ID: <20161020175745.GC7119@kozik-lap>
References: <1476906725-22613-1-git-send-email-sergio.prado@e-labworks.com>
 <1476906725-22613-4-git-send-email-sergio.prado@e-labworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1476906725-22613-4-git-send-email-sergio.prado@e-labworks.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 19, 2016 at 05:52:05PM -0200, Sergio Prado wrote:
> Allows configuring Samsung's s3c2410 memory controller using a
> devicetree.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  drivers/mtd/nand/s3c2410.c                     | 155 ++++++++++++++++++++++---
>  include/linux/platform_data/mtd-nand-s3c2410.h |   1 +
>  2 files changed, 140 insertions(+), 16 deletions(-)
>


Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
