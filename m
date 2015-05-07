Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqFdw-0005e2-UV
 for linux-mtd@lists.infradead.org; Thu, 07 May 2015 06:50:49 +0000
Received: by pdbqa5 with SMTP id qa5so32863212pdb.1
 for <linux-mtd@lists.infradead.org>; Wed, 06 May 2015 23:50:27 -0700 (PDT)
Date: Wed, 6 May 2015 23:50:24 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Nicholas Mc Guire <hofrat@osadl.org>
Subject: Re: [PATCH 1/2 RESEND] mtd: fsmc_nand: fix handling of
 wait_for_completion_timeout return value
Message-ID: <20150507065024.GE6055@norris-Latitude-E6410>
References: <1426247686-30980-1-git-send-email-hofrat@osadl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1426247686-30980-1-git-send-email-hofrat@osadl.org>
Cc: Vinod Koul <vinod.koul@intel.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 13, 2015 at 07:54:45AM -0400, Nicholas Mc Guire wrote:
> wait_for_completion_timeout does not return negative values so
> result handling here does not need to check for negative return.
> 
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> ---
> 
> Patch was compile tested with nhk8815_defconfig
> (implies CONFIG_MTD_NAND_FSMC=y)
> 
> Patch is against 4.0-rc3 (localversion-next is -next-20150313

Applied both to l2-mtd.git.
