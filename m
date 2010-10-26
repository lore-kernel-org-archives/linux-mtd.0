Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PAg05-0003U9-Bn
	for linux-mtd@lists.infradead.org; Tue, 26 Oct 2010 09:39:26 +0000
Subject: Re: [PATCH 1/1] mtd: OneNAND: fix bufferram management when chip
	has 2-planes.
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Enric Balletbo i Serra <eballetbo@gmail.com>, "kyungmin.park"
	<kyungmin.park@samsung.com>
In-Reply-To: <1287841434-3349-2-git-send-email-eballetbo@gmail.com>
References: <1287841434-3349-1-git-send-email-eballetbo@gmail.com>
	<1287841434-3349-2-git-send-email-eballetbo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 26 Oct 2010 12:36:01 +0300
Message-ID: <1288085761.2227.40.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: m.szyprowski@samsung.com, dwmw2@infradead.org, linux-omap@vger.kernel.org,
	linux-mtd@lists.infradead.org, adrian.hunter@nokia.com
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-10-23 at 15:43 +0200, Enric Balletbo i Serra wrote:
> This patch adds code that I think was lost when it was applied the commit
>   5988af2319781bc8e0ce418affec4e09cfa77907 - mtd: Flex-OneNAND support
> 
> Test case:
>  1. Stress a jffs2 filesystem using
>     bonnie++ -u 0:0 -s 32 -m 16 -r 16
>  2. dmesg shows various 'Header CRC failed' errors like:
>     Header CRC failed on REF_PRISTINE node at 0x1e81315c: Read 0x000000e0,
>     calculated 0x564fc9e8
> 
> Tested on IGEP v2 board with a Muxed OneNAND(DDP) 512MB 1.8V 16-bit (0x58)
> with 2 planes from Numonyx and CONFIG_MTD_ONENAND_2X_PROGRAM set to y
> 
> Signed-off-by: Enric Balletbo i Serra <eballetbo@gmail.com>

Kyungmin, would be nice to have your ack/nack.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
