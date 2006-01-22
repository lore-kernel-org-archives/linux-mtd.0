Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1F0j0w-00012G-L5
	for linux-mtd@lists.infradead.org; Sun, 22 Jan 2006 12:28:42 -0500
Message-ID: <43D3C098.70808@yandex.ru>
Date: Sun, 22 Jan 2006 20:27:52 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Adrian Bunk <bunk@stusta.de>
References: <20060122171256.GE10003@stusta.de>
In-Reply-To: <20060122171256.GE10003@stusta.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@osdl.org>, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC: 2.6 patch] MTD_NAND_SHARPSL and MTD_NAND_NANDSIM should
 be	tristate's
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adrian Bunk wrote:
> - config MTD_NAND_NANDSIM
> - 	bool "Support for NAND Flash Simulator"
> - 	depends on MTD_NAND && MTD_PARTITIONS
Oh, thanks, long time supposed to be fixed.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
