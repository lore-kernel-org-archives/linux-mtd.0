Received: from itaqui.terra.com.br ([200.176.3.19])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A6Wi0-000727-HN
	for <linux-mtd@lists.infradead.org>; Mon, 06 Oct 2003 15:51:36 +0100
Message-ID: <3F81820F.2000602@terra.com.br>
Date: Mon, 06 Oct 2003 11:54:07 -0300
From: Felipe W Damasio <felipewd@terra.com.br>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@redhat.com>
References: <3F81800A.5000500@terra.com.br>
	<1065451568.22491.215.camel@hades.cambridge.redhat.com>
In-Reply-To: <1065451568.22491.215.camel@hades.cambridge.redhat.com>
Content-Type: multipart/mixed;
 boundary="------------060108070302070803010705"
cc: linux-mtd@lists.infradead.org
cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Memory leak in mtd/chips/cfi_cmdset_0020
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------060108070302070803010705
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit



David Woodhouse wrote:
> Applied; thanks. It'll be in the next update sent to Linus, when I get a
> few spare moments for merging and testing.

	Great, thanks.

> Out of interest, why didn't smatch also find the same error 25 lines
> further down?

	He did...I didn't ;)

	If you want, updated patch is attached.

	Cheers,

Felipe

--------------060108070302070803010705
Content-Type: text/plain;
 name="cfi_cmdset_0020-leak.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="cfi_cmdset_0020-leak.patch"

--- linux-2.6.0-test6/drivers/mtd/chips/cfi_cmdset_0020.c.orig	2003-10-06 11:37:31.000000000 -0300
+++ linux-2.6.0-test6/drivers/mtd/chips/cfi_cmdset_0020.c	2003-10-06 11:52:40.000000000 -0300
@@ -208,6 +208,7 @@
 	if (!mtd->eraseregions) { 
 		printk(KERN_ERR "Failed to allocate memory for MTD erase region info\n");
 		kfree(cfi->cmdset_priv);
+		kfree(mtd);
 		return NULL;
 	}
 	
@@ -232,6 +233,7 @@
 			printk(KERN_WARNING "Sum of regions (%lx) != total size of set of interleaved chips (%lx)\n", offset, devsize);
 			kfree(mtd->eraseregions);
 			kfree(cfi->cmdset_priv);
+			kfree(mtd);
 			return NULL;
 		}
 

--------------060108070302070803010705--
