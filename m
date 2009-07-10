Subject: Re: [PATCH 2:2][MTD][NAND]omap : Adding DMA mode support in nand
	prefetch/post-write
From: Artem Bityutskiy <dedekind@infradead.org>
To: vimal singh <vimalsingh@ti.com>
In-Reply-To: <63362.192.168.10.89.1247226916.squirrel@dbdmail.itg.ti.com>
References: <63362.192.168.10.89.1247226916.squirrel@dbdmail.itg.ti.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 10 Jul 2009 15:02:24 +0300
Message-Id: <1247227344.20721.363.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
	david-b@pacbell.net, linux-mtd@lists.infradead.org,
	linux-omap@vger.kernel.org, dwmw2@infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-07-10 at 17:25 +0530, vimal singh wrote:
> +	/* The fifo depth is 64 bytes. We have a sync at each frame and frame
> +	 * length is 64 bytes.
> +	 */
> +	int buf_len = len/64;

To optimize performance it is better not to rely on gcc and use <<

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
