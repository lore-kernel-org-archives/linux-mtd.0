From: David Woodhouse <dwmw2@infradead.org>
To: J C <jjcar1526@hotmail.com>
In-Reply-To: <BAY14-F215ScEbWIyTW000329ac@hotmail.com>
References: <BAY14-F215ScEbWIyTW000329ac@hotmail.com>
Content-Type: text/plain
Message-Id: <1084371773.4426.162.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 12 May 2004 15:22:53 +0100
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: MD2811-D32 DOC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-05-12 at 10:13 -0400, J C wrote:
> Hello all,
> 
>   I am having problems with the DOC MD2811-D32.  I am assuming to use the 
> nand drivers for it since M-sys says it is nand technology.  The diskonchip 
> module in the nand directory will not compile.  I am using kernel 
> 2.4.21-rmk1-omap and it is patched with the latest drivers.  Can anyone tell 
> me if there is a newer version where diskonchip isn't broken date 3-27-2004 
> on the diskonchip module.

It might help if you were slightly more specific about the compilation
failure you see.

It probably won't help _much_ though. It's likely that it's because
you're using such an ancient kernel.

-- 
dwmw2
