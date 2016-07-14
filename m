Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNUcn-00039B-39
 for linux-mtd@lists.infradead.org; Thu, 14 Jul 2016 00:35:33 +0000
Received: by mail-pf0-x244.google.com with SMTP id i6so3597636pfe.0
 for <linux-mtd@lists.infradead.org>; Wed, 13 Jul 2016 17:35:11 -0700 (PDT)
Date: Wed, 13 Jul 2016 17:35:08 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: P L Sai Krishna <lakshmi.sai.krishna.potthuri@xilinx.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Ezequiel =?iso-8859-1?Q?Garc=EDa?= <ezequiel@vanguardiasur.com.ar>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marex@denx.de>, Jagan Teki <jteki@openedev.com>,
 Furquan Shaikh <furquan@google.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Michal Simek <michals@xilinx.com>,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
 Harini Katakam <harinik@xilinx.com>, Anirudha Sarangi <anirudh@xilinx.com>,
 P L Sai Krishna <lakshmis@xilinx.com>
Subject: Re: [LINUX PATCH] mtd: spi-nor: Added support for n25q00a.
Message-ID: <20160714003508.GC54628@google.com>
References: <1467985615-35153-1-git-send-email-lakshmis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1467985615-35153-1-git-send-email-lakshmis@xilinx.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 08, 2016 at 07:16:55PM +0530, P L Sai Krishna wrote:
> Add Micron (n25q00a) 1Gbit NOR Flash in the list of supported
> devices.
> This part is different from n25q00 in Memory Type.
> Memory Type for n25q00 - BAh
> Memory Type for n25q00a - BBh
> 
> Signed-off-by: P L Sai Krishna <lakshmis@xilinx.com>

Applied to l2-mtd.git
