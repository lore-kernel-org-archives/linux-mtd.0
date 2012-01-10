Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]
 helo=VA3EHSOBE008.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkQF0-0003XI-6D
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 01:11:06 +0000
Message-ID: <4F0B901C.6020100@freescale.com>
Date: Mon, 9 Jan 2012 19:10:52 -0600
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Prabhakar Kushwaha <prabhakar@freescale.com>
Subject: Re: [PATCH 2/2][v2] mtd/nand: Fix IFC driver to support 2K NAND page
References: <1326111866-13120-1-git-send-email-prabhakar@freescale.com>
In-Reply-To: <1326111866-13120-1-git-send-email-prabhakar@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Poonam Aggrwal <poonam.aggrwal@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/09/2012 06:24 AM, Prabhakar Kushwaha wrote:
> 1) OOB area should be updated irrespective of NAND page size. Earlier it was
> updated only for 512byte NAND page.
> 
> 2) During OOB update fbcr should be equal to OOB size.
> 
> Signed-off-by: Poonam Aggrwal <poonam.aggrwal@freescale.com>
> Signed-off-by: Prabhakar Kushwaha <prabhakar@freescale.com>
> ---
>  git://git.kernel.org/pub/scm/linux/kernel/git/galak/powerpc.git (branch next)
> 
>  This patch is created on top of IFC driver patch (already floated in mailing
>  list). Please find their link:
>  http://patchwork.ozlabs.org/patch/133315/
>  http://patchwork.ozlabs.org/patch/133316/

Looks good.

-Scott
