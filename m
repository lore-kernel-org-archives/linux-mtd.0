Received: from mail-yk0-f173.google.com ([209.85.160.173])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wzp7r-0003nH-4u
 for linux-mtd@lists.infradead.org; Wed, 25 Jun 2014 15:28:44 +0000
Received: by mail-yk0-f173.google.com with SMTP id 142so1183928ykq.18
 for <linux-mtd@lists.infradead.org>; Wed, 25 Jun 2014 08:28:21 -0700 (PDT)
Date: Wed, 25 Jun 2014 12:27:35 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v1 1/3] ARM: dts: am335x-bone: add support for beaglebone
 NAND cape
Message-ID: <20140625152735.GA17792@arch.cereza>
References: <1403612666-31197-1-git-send-email-pekon@ti.com>
 <1403612666-31197-2-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1403612666-31197-2-git-send-email-pekon@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, Jason Kridner <jkridner@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 Robert Nelson <robertcnelson@gmail.com>,
 Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 24 Jun 05:54 PM, Pekon Gupta wrote:
> +&gpmc {
> +	ranges = <0 0 0 0x01000000>;	/* address range = 16MB (minimum GPMC partition) */
> +	nand@0,0 {
> +		status = "disabled";
> +		reg = <0 0 4>;		/* device IO registers */
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&bbcape_nand_flash_pins>;
> +		ti,nand-ecc-opt = "bch8";
> +		ti,elm-id = <&elm>;

Don't you need something like this to turn on the elm device?

&elm {
	status = "okay";
};

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
