Subject: Re: [PATCH 0/5] mtd: nand: gpmi: add i.MX 7 support
To: Stefan Agner <stefan@agner.ch>, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 richard@nod.at, cyrille.pitchen@atmel.com
References: <20170421010755.18025-1-stefan@agner.ch>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
 kernel@pengutronix.de, han.xu@nxp.com, fabio.estevam@freescale.com,
 LW@KARO-electronics.de, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <644017ff-7b26-143c-df2f-1223841c81f4@gmail.com>
Date: Fri, 21 Apr 2017 04:33:04 +0200
MIME-Version: 1.0
In-Reply-To: <20170421010755.18025-1-stefan@agner.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/21/2017 03:07 AM, Stefan Agner wrote:
> This patchset adds support for i.MX 7 SoC for the GPMI NAND controller.
> There have been similar patchsets already:
> https://lkml.org/lkml/2016/2/23/912
> 
> However, this patchset does not make use of any of the new features.
> The current feature set seems to work fine, I successfully run the MTD
> tests on a Colibri iMX7.
> 
> --

The rest of the patchset is IMO OK too, but you probably want the DT
changes Acked by Shawn or Fabio.

-- 
Best regards,
Marek Vasut
