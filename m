Received: from mail-qc0-x232.google.com ([2607:f8b0:400d:c01::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X6rnT-0008KQ-2J
 for linux-mtd@lists.infradead.org; Tue, 15 Jul 2014 01:44:47 +0000
Received: by mail-qc0-f178.google.com with SMTP id x3so2388809qcv.37
 for <linux-mtd@lists.infradead.org>; Mon, 14 Jul 2014 18:44:25 -0700 (PDT)
Date: Mon, 14 Jul 2014 18:44:22 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Kevin Hao <haokexin@gmail.com>
Subject: Re: [PATCH v2 2/2] mtd/ftl: fix the double free of the buffers
 allocated in build_maps()
Message-ID: <20140715014422.GR7537@ld-irv-0074>
References: <1402905157-10330-3-git-send-email-haokexin@gmail.com>
 <1404354926-25930-1-git-send-email-haokexin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1404354926-25930-1-git-send-email-haokexin@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 03, 2014 at 10:35:26AM +0800, Kevin Hao wrote:
> I got the following panic on my fsl p5020ds board.
> 
>   Unable to handle kernel paging request for data at address 0x7375627379737465
>   Faulting instruction address: 0xc000000000100778
>   Oops: Kernel access of bad area, sig: 11 [#1]
>   SMP NR_CPUS=24 CoreNet Generic
...
> It seems that the corrupted partition header on my mtd device triggers
> a bug in the ftl. In function build_maps() it will allocate the buffers
> needed by the mtd partition, but if something goes wrong such as kmalloc
> failure, mtd read error or invalid partition header parameter, it will
> free all allocated buffers and then return non-zero. In my case, it
> seems that partition header parameter 'NumTransferUnits' is invalid.
> 
> And the ftl_freepart() is a function which free all the partition
> buffers allocated by build_maps(). Given the build_maps() is a self
> cleaning function, so there is no need to invoke this function even
> if build_maps() return with error. Otherwise it will causes the
> buffers to be freed twice and then weird things would happen.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Kevin Hao <haokexin@gmail.com>
> ---
> v2: Just update the commit log and add Cc stable.

Thanks for the updated description. Pushed to l2-mtd.git. Thanks!

Brian
