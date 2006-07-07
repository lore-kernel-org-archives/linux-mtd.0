Received: from herkules.vianova.fi ([194.100.28.129] helo=mail.vianova.fi)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FypIm-0002dU-RY
	for linux-mtd@lists.infradead.org; Fri, 07 Jul 2006 08:19:32 -0400
Date: Fri, 7 Jul 2006 15:19:08 +0300
From: Ville Herva <vherva@vianova.fi>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] [MTD] block2mtd.c: Make kernel boot command line
	arguments work (try 2)
Message-ID: <20060707121908.GV6240@vianova.fi>
References: <20060706164105.GU6240@vianova.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20060706164105.GU6240@vianova.fi>
Reply-To: vherva@vianova.fi
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 06, 2006 at 07:41:05PM +0300, you [Ville Herva] wrote:
> +static __initdata char block2mtd_paramline[80 + 12]; /* 80 for device, 12 for erase size */

> +	ret = block2mtd_setup2(block2mtd_paramline);
> +	block2mtd_init_called = 1;

Seems this requires some more care get working in the module case. I'll redo
the patch.



-- v -- 

v@iki.fi
