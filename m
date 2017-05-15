Received: from host.buserror.net ([209.198.135.123])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAJnr-0002pc-Ss
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 17:29:05 +0000
Message-ID: <1494869313.29095.5.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Prabhakar Kushwaha
 <prabhakar.kushwaha@nxp.com>
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
Date: Mon, 15 May 2017 12:28:33 -0500
In-Reply-To: <20170515104824.2ffb5186@bbrezillon>
References: <1493882437-4541-1-git-send-email-prabhakar.kushwaha@nxp.com>
 <20170515104824.2ffb5186@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] driver: mtd: update struct map_info's swap as per map
 requirement.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2017-05-15 at 10:48 +0200, Boris Brezillon wrote:
> 
> You can even make this property a string property:
> 
> 		if (!of_property_read_string(dp->parent,
> 					     "cfi-endianness",
> 					     &endianness)) {
> 			if (!strcmp("big", endianness))
> 				info->list[i].map.swap = CFI_BIG_ENDIAN;
> 			else if (!strcmp("little", endianness))
> 				info->list[i].map.swap = CFI_LITTLE_ENDIAN;
> 			else if (!strcmp("host", endianness))
> 				info->list[i].map.swap = CFI_HOST_ENDIAN;
> 		}

Boolean endianness properties are the standard elsewhere -- why should CFI be
different?

See Documentation/devicetree/bindings/common-properties.txt

-Scott
