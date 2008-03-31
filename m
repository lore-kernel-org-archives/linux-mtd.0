Received: from [63.81.120.155] (helo=imap.sh.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JgNTa-0001TQ-5N
	for linux-mtd@lists.infradead.org; Mon, 31 Mar 2008 17:07:19 +0000
Message-ID: <47F11A19.4050305@ru.mvista.com>
Date: Mon, 31 Mar 2008 21:06:33 +0400
From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
MIME-Version: 1.0
To: Laurent Pinchart <laurentp@cse-semaphore.com>
Subject: Re: [PATCHv2] powerpc: Describe memory-mapped RAM&ROM chips OF
	bindings
References: <200803311839.10519.laurentp@cse-semaphore.com>
In-Reply-To: <200803311839.10519.laurentp@cse-semaphore.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: ben@simtec.co.uk, linuxppc-dev@ozlabs.org,
	Rune Torgersen <runet@innovsys.com>, linux-mtd@lists.infradead.org,
	David Gibson <david@gibson.dropbear.id.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

Laurent Pinchart wrote:

> Signed-off-by: Laurent Pinchart <laurentp@cse-semaphore.com>
> ---
>  Documentation/powerpc/booting-without-of.txt |   13 ++++++++++++-
>  1 files changed, 12 insertions(+), 1 deletions(-)
> 
> diff --git a/Documentation/powerpc/booting-without-of.txt b/Documentation/powerpc/booting-without-of.txt
> index 7b4e8a7..3e1963b 100644
> --- a/Documentation/powerpc/booting-without-of.txt
> +++ b/Documentation/powerpc/booting-without-of.txt
> @@ -57,7 +57,8 @@ Table of Contents
>        n) 4xx/Axon EMAC ethernet nodes
>        o) Xilinx IP cores
>        p) Freescale Synchronous Serial Interface
> -	  q) USB EHCI controllers
> +      q) USB EHCI controllers
> +      r) Memory-mapped RAM & ROM

    Memory-mapped RA/RO Memory again? Should better drop this. :-)

WBR, Sergei
