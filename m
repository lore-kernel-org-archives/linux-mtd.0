Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UtbWl-0001qm-5p
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2013 10:40:11 +0000
Message-ID: <1372675431.22014.60.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v4 0/4] mtd:nand:omap2: clean-up of supported ECC schemes
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Pekon Gupta <pekon@ti.com>
Date: Mon, 01 Jul 2013 13:43:51 +0300
In-Reply-To: <1372672313-4104-1-git-send-email-pekon@ti.com>
References: <1372672313-4104-1-git-send-email-pekon@ti.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: arnd@arndb.de, tony@atomide.com, avinashphilipk@gmail.com,
 jp.francois@cynove.com, balbi@ti.com, linux-mtd@lists.infradead.org,
 benoit.cousson@linaro.org, linux-omap@vger.kernel.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-07-01 at 15:21 +0530, Pekon Gupta wrote:
> +---------------------------------------+---------------+---------------+
> | ECC scheme				|ECC calculation|Error detection|
> +---------------------------------------+---------------+---------------+
> |OMAP_ECC_HAMMING_CODE_DEFAULT		|S/W		|S/W		|
> |OMAP_ECC_HAMMING_CODE_HW		|H/W (GPMC)	|S/W		|
> |OMAP_ECC_HAMMING_CODE_HW_ROMCODE	|H/W (GPMC)	|S/W		|
> +---------------------------------------+---------------+---------------+
> |OMAP_ECC_BCH4_CODE_HW_DETECTION_SW	|H/W (GPMC)	|S/W (lib/bch.h)|
> |OMAP_ECC_BCH4_CODE_HW			|H/W (GPMC)	|H/W (ELM)	|
> +---------------------------------------+---------------+---------------+
> |OMAP_ECC_BCH8_CODE_HW_DETECTION_SW	|H/W (GPMC)	|S/W (lib/bch.h)|
> |OMAP_ECC_BCH8_CODE_HW			|H/W (GPMC)	|H/W (ELM)	|
> +---------------------------------------+---------------+---------------+

Pushed patches 1-3 to l2-mtd.git, thanks. I had to fix the table because
you use tabs there, and git log makes the table look messy. Please, use
spaces instead next time.

Thanks!

-- 
Best Regards,
Artem Bityutskiy
