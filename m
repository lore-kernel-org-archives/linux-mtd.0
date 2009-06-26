Subject: Re: [PATCH][MTD][NAND]: fix omap2.c compile failure and warning
From: David Woodhouse <dwmw2@infradead.org>
To: vimal singh <vimalsingh@ti.com>
In-Reply-To: <57946.192.168.10.89.1246035773.squirrel@dbdmail.itg.ti.com>
References: <53729.192.168.10.89.1246035472.squirrel@dbdmail.itg.ti.com>
	<57946.192.168.10.89.1246035773.squirrel@dbdmail.itg.ti.com>
Content-Type: text/plain
Date: Fri, 26 Jun 2009 18:14:02 +0100
Message-Id: <1246036442.663.47.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "david-b@pacbell.net" <david-b@pacbell.net>,
	"tom.leiming@gmail.com" <tom.leiming@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-06-26 at 22:32 +0530, vimal singh wrote:
> Somehow I do not see below errors on compilation:
> drivers/mtd/nand/omap2.c: In function 'omap_wait':
> drivers/mtd/nand/omap2.c:543: error: 'jiffies' undeclared (first use in this
> function)
> drivers/mtd/nand/omap2.c:543: error: (Each undeclared identifier is reported
> only once
> drivers/mtd/nand/omap2.c:543: error: for each function it appears in.)
> drivers/mtd/nand/omap2.c:557: error: implicit declaration of function
> 'time_before'
> 
> But still including 'linux/jiffies.h'.
> 
> Below is the patch.

The 'status' you return in the case that you _have_ gone through the
loop is still wrong though, isn't it?

-- 
dwmw2
