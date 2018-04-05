Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f4AO9-000482-3n
 for linux-mtd@lists.infradead.org; Thu, 05 Apr 2018 19:17:38 +0000
Received: by mail-wm0-x229.google.com with SMTP id p9so8377829wmc.3
 for <linux-mtd@lists.infradead.org>; Thu, 05 Apr 2018 12:17:20 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: Add Micron MT25QU02 support
To: thor.thayer@linux.intel.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@bootlin.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org
References: <1522955569-19927-1-git-send-email-thor.thayer@linux.intel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <5b5783bc-5f7b-0076-6dde-993ffe36ca58@gmail.com>
Date: Thu, 5 Apr 2018 21:17:17 +0200
MIME-Version: 1.0
In-Reply-To: <1522955569-19927-1-git-send-email-thor.thayer@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/05/2018 09:12 PM, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> Add support for a new Micron 2Gb Flash memory part.
> Datasheet is available: mt25q_qlkt_l_02g_cbb_0.pdf
> 
> Testing was done on a Stratix10 SoCFPGA Development Kit.
> 
> Reported-by: Sujith Chidurala <sujith.chakra.chidurala@intel.com>
> Tested-by: Paul Kim <paul.kim@intel.com>
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
> ---

Do we need this or can this be recognized as a SFDP flash ?

-- 
Best regards,
Marek Vasut
