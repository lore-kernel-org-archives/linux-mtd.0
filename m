Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: Hong Xu <hong.xu@atmel.com>
Subject: Re: [PATCH] MTD: atmel_nand: Add DMA support to access Nandflash
References: <1294997687-12515-1-git-send-email-hong.xu@atmel.com>
Date: Fri, 14 Jan 2011 12:43:52 +0100
In-Reply-To: <1294997687-12515-1-git-send-email-hong.xu@atmel.com> (Hong Xu's
	message of "Fri, 14 Jan 2011 17:34:47 +0800")
Message-ID: <878vynww07.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: nicolas.ferre@atmel.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Hong" == Hong Xu <hong.xu@atmel.com> writes:

 Hong> Some SAM9 chips have the ability to perform DMA between CPU and
 Hong> SMC controller.  This patch adds DMA support for SAM9RL, SAM9G45,
 Hong> SSAM9G46,AM9M10, SAM9M11.

 Hong> Signed-off-by: Hong Xu <hong.xu@atmel.com>

But mtd buffers are not guaranteed to be DMA safe (E.G. might come from
vmalloc), so you'll need to walk the page tables.

-- 
Bye, Peter Korsgaard
