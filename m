Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BWAMo-00042R-Et
	for linux-mtd@lists.infradead.org; Fri, 04 Jun 2004 04:47:59 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <E1BW9s0-0007ic-LQ@phoenix.infradead.org>
References: <E1BW9s0-0007ic-LQ@phoenix.infradead.org>
Content-Type: text/plain
Message-Id: <1086338874.4588.62.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Fri, 04 Jun 2004 09:47:54 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/include/mtd mtd-abi.h,1.1,1.2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-06-04 at 09:16 +0100, gleixner@infradead.org wrote:
> Log Message:
> Extend eccpos array to support HW8_512 ecc on 2k chips. Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Er, you just changed the kernel<->user ABI and broke all existing
userspace tools compiled with the old one.

Which is OK since this hasn't gone to Linus yet.... but as soon as it
goes to Linus these things are set in stone and you have to extend, not
change. 

Do we want a couple of ints in that structure saying how big the arrays
are? While we're at it, it's better to use explicitly sized types to
make 64<->32 bit ioctl conversion easier.

> --- mtd-abi.h	5 May 2004 14:44:57 -0000	1.1
> +++ mtd-abi.h	4 Jun 2004 08:16:06 -0000	1.2
> @@ -86,7 +86,7 @@
>  struct nand_oobinfo {
>  	int	useecc;
>  	int	eccbytes;
> -	int	eccpos[24];
> +	int	eccpos[32];
>  	int	oobfree[8][2];
>  };

-- 
dwmw2
