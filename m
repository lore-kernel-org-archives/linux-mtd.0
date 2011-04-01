Subject: Re: [PATCH] MTD: atmel_nand: Fall back to CPU I/O when buffer is
	in vmalloc(ed) region
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Hong Xu <hong.xu@atmel.com>
In-Reply-To: <1301567595-31075-1-git-send-email-hong.xu@atmel.com>
References: <1301567595-31075-1-git-send-email-hong.xu@atmel.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Apr 2011 17:20:12 +0300
Message-ID: <1301667612.2789.86.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: nicolas.ferre@atmel.com, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-03-31 at 18:33 +0800, Hong Xu wrote:
> The previous way of dealing with vmalloc(ed) region by walking though the pages can not work well actually.
> We just fall back to CPU I/O when the buffer address is higher than `high_memory'.
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
> Signed-off-by: Hong Xu <hong.xu@atmel.com>

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
