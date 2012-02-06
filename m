From: Stefan Roese <sr@denx.de>
To: devicetree-discuss@lists.ozlabs.org
Subject: Re: [PATCH 4/6 V2] of/mtd/nand: add generic bindings and helpers
Date: Mon, 6 Feb 2012 17:20:24 +0100
References: <1327727444-23908-1-git-send-email-plagnioj@jcrosoft.com>
 <1328524512-18159-1-git-send-email-plagnioj@jcrosoft.com>
In-Reply-To: <1328524512-18159-1-git-send-email-plagnioj@jcrosoft.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201202061720.24996.sr@denx.de>
Cc: linux-mtd@lists.infradead.org,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jean-Christophe,

On Monday 06 February 2012 11:35:11 Jean-Christophe PLAGNIOL-VILLARD wrote:
> - nand-ecc-mode : String, operation mode of the NAND ecc mode.
>   Supported values are: "none", "soft", "hw", "hw_syndrome",
> "hw_oob_first", "soft_bch".
> - nand-bus-width : 8 or 16 bus width if not present 8
> - nand-on-flash-bbt: boolean to enable on flash bbt option if not present
> false

Why not use an "empty" type (without argument) for nand-on-flash-bbt then?

Thanks,
Stefan
