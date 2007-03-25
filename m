Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HVaBe-00039F-UL
	for linux-mtd@lists.infradead.org; Sun, 25 Mar 2007 17:23:39 -0400
Date: Sun, 25 Mar 2007 22:40:26 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Adrian Bunk <bunk@stusta.de>
Subject: Re: [2.6 patch] block2mtd_paramline[] mustn't be __initdata
Message-ID: <20070325204026.GB19691@lazybastard.org>
References: <20070325145805.GH16477@stusta.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070325145805.GH16477@stusta.de>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 25 March 2007 16:58:05 +0200, Adrian Bunk wrote:
> 
> block2mtd_paramline[] is used in the non-__init block2mtd_setup()
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
Acked-By: Jörn Engel <joern@lazybastard.org>

Adrian, can you put me on Cc: next time?

> ---
> --- linux-2.6.21-rc4-mm1/drivers/mtd/devices/block2mtd.c.old	2007-03-25 15:56:10.000000000 +0200
> +++ linux-2.6.21-rc4-mm1/drivers/mtd/devices/block2mtd.c	2007-03-25 15:56:31.000000000 +0200
> @@ -423,7 +423,7 @@
>  
>  #ifndef MODULE
>  static int block2mtd_init_called = 0;
> -static __initdata char block2mtd_paramline[80 + 12]; /* 80 for device, 12 for erase size */
> +static char block2mtd_paramline[80 + 12]; /* 80 for device, 12 for erase size */
>  #endif

Jörn

-- 
Das Aufregende am Schreiben ist es, eine Ordnung zu schaffen, wo
vorher keine existiert hat.
-- Doris Lessing
