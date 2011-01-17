From: Hong Xu <hong.xu@atmel.com>
To: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, jamie@jamieiles.com, jacmet@sunsite.dk
Subject: [PATCH v2] MTD: atmel_nand: Add DMA support to access Nandflash 
Date: Mon, 17 Jan 2011 15:20:08 +0800
Message-Id: <1295248809-30334-1-git-send-email-hong.xu@atmel.com>
In-Reply-To: <hong.xu@atmel.com>
References: <hong.xu@atmel.com>
Cc: hong.xu@atmel.com, nicolas.ferre@atmel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch includes the fixes according to Jamie Iles and Peter Korsgaard
