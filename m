Subject: Re: [PATCH 1/2] MTD: generic FSMC NAND MTD driver
From: David Woodhouse <dwmw2@infradead.org>
To: Linus Walleij <linus.walleij@stericsson.com>
In-Reply-To: <1284330922-3569-1-git-send-email-linus.walleij@stericsson.com>
References: <1284330922-3569-1-git-send-email-linus.walleij@stericsson.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 Oct 2010 00:28:20 +0100
Message-ID: <1287962900.5674.21.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Viresh Kumar <viresh.kumar@st.com>, Rajeev Kumar <rajeev-dlh.kumar@st.com>,
	Vipin Kumar <vipin.kumar@st.com>, Shiraz Hashim <shiraz.hashim@st.com>,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-09-13 at 00:35 +0200, Linus Walleij wrote:
> 
> +#define PARTITION(n, off, sz)  {.name = n, .offset = off, .size = sz}
> +
> +/*
> + * Default partition layout for small page(= 512 bytes) devices
> + * Size for "Root file system" is updated in driver based on actual device size
> + */
> +static struct mtd_partition partition_info_16KB_blk[] = {
> +       PARTITION("X-loader", 0, 4 * 0x4000),
> +       PARTITION("U-Boot", 0x10000, 20 * 0x4000),
> +       PARTITION("Kernel", 0x60000, 256 * 0x4000),
> +       PARTITION("Root File System", 0x460000, 0),
> +}; 

Er, you use a macro just so that you can use order-dependent non-C99
structure initialisation? You realise that this would do the same thing:
 #define PARTITION(a,b,c) {a,c,b}

And no, I don't think *that* would be a good idea either :)

Please fix.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
