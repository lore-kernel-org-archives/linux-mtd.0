Subject: Re: [PATCH] mtd: OneNAND: OMAP3: unmap correct DMA buffer
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mika Westerberg <ext-mika.1.westerberg@nokia.com>
In-Reply-To: <1269351224-10637-1-git-send-email-ext-mika.1.westerberg@nokia.com>
References: <1269351224-10637-1-git-send-email-ext-mika.1.westerberg@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 08 Apr 2010 11:25:22 +0300
Message-ID: <1270715122.6754.109.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-03-23 at 15:33 +0200, Mika Westerberg wrote:
> Function omap3_onenand_write_bufferram() maps the write buffer and stores the
> returned handle in dma_src. However, when it does the DMA unmap, it uses wrong
> DMA handle (dma_dst).
> 
> This patch fixes it to use the correct DMA handle.
> 
> Signed-off-by: Mika Westerberg <ext-mika.1.westerberg@nokia.com>

Pushed to l2-mtd-2.6.git / master, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
