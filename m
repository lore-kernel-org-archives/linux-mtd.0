Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1beIMr-00062X-CP
 for linux-mtd@lists.infradead.org; Mon, 29 Aug 2016 08:56:34 +0000
Received: by mail-wm0-x22e.google.com with SMTP id o80so80395726wme.1
 for <linux-mtd@lists.infradead.org>; Mon, 29 Aug 2016 01:56:12 -0700 (PDT)
Subject: Re: [Patch] mtd: fix writing incorrect ECC parity data in OOB region.
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 mtk04561 <rogercc.lin@mediatek.com>
References: <1472443093.27061.4.camel@mtkswgap22>
 <20160829101006.2b200e0a@bbrezillon>
Cc: xiaolei.li@mediatek.com, steven.liu@mediatek.com, robh@kernel.org,
 computersforpeace@gmail.com, daniel.thompson@linaro.org,
 linux-mtd@lists.infradead.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, dwmw2@infradead.org, blogic@openwrt.org
From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <95823b9f-3c66-6d7c-4132-0deceba0de58@linaro.org>
Date: Mon, 29 Aug 2016 10:56:08 +0200
MIME-Version: 1.0
In-Reply-To: <20160829101006.2b200e0a@bbrezillon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/29/2016 10:10 AM, Boris Brezillon wrote:
> +Jorge

Thanks Boris. Xiaolei is looking into this - he is aware of the patch.
