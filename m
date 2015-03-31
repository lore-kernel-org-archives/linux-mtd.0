Received: from mail-pd0-x229.google.com ([2607:f8b0:400e:c02::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ycl1Z-0000JE-M7
 for linux-mtd@lists.infradead.org; Tue, 31 Mar 2015 01:31:26 +0000
Received: by pdbni2 with SMTP id ni2so3595624pdb.1
 for <linux-mtd@lists.infradead.org>; Mon, 30 Mar 2015 18:31:03 -0700 (PDT)
Date: Mon, 30 Mar 2015 18:30:58 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Nicholas Mc Guire <hofrat@osadl.org>
Subject: Re: [PATCH] mtd: pxa3xx_nand: cleanup wait_for_completion handling
Message-ID: <20150331013058.GQ32500@ld-irv-0074>
References: <1422809737-3991-1-git-send-email-hofrat@osadl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1422809737-3991-1-git-send-email-hofrat@osadl.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Feb 01, 2015 at 11:55:37AM -0500, Nicholas Mc Guire wrote:
> return type of wait_for_completion_timeout is unsigned long not int, this
> patch uses the return value of wait_for_completion_timeout in the condition
> directly rather than assigning it to an incorrect type variable.
> 
> The timeout declaration cleanup is just for readability
> 
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> ---
> 
> The variable used for handling the return of wait_for_cmpletion_timeout
> was int but should be unsigned long, where it was not in use for anything
> else and the return value in case of completion (>0) is not used it was
> removed and wait_for_completion_timeout() used directly in the if condition.
> 
> To make the timeout values a bit simpler to read and also handle all of
> the corner cases correctly the declarations are moved to msecs_to_jiffies().
> 
> This patch was only compile tested for pxa3xx_defconfig 
> (implies CONFIG_MTD_NAND_PXA3xx=y)
> 
> Patch is against 3.0.19-rc6 -next-20150130 

Reworked the commit message a bit and pushed to l2-mtd.git.

Brian
