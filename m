Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LfhXG-00027x-Ib
	for linux-mtd@lists.infradead.org; Fri, 06 Mar 2009 21:24:53 +0000
Date: Fri, 6 Mar 2009 13:24:38 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "hartleys" <hartleys@visionengravers.com>
Subject: Re: [PATCH] mtd: plat_nand: add platform probe/remove callbacks
Message-Id: <20090306132438.e55fef0d.akpm@linux-foundation.org>
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE1909013B7114@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE1909013B7114@mi8nycmail19.Mi8.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: vitalywool@gmail.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, alex@digriz.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 5 Mar 2009 18:58:12 -0500
"hartleys" <hartleys@visionengravers.com> wrote:

> From: "hartleys" <hartleys@visionengravers.com>

You might want to change your email setup so that the above reads "H
Hartley Sweeten <hsweeten@visionengravers.com>" or whatever.  Because
most patch-merging people's tools will end up marking this commit as
being from someone called "hartleys".

Alternatively, put an explicit From: line at the top of the changelog.

> To: <linux-kernel@vger.kernel.org>
> Cc: <linux-mtd@lists.infradead.org>, "Alexander Clouter" <alex@digriz.org.uk>, "Andrew Morton" <akpm@linux-foundation.org>, <vitalywool@gmail.com>
> Subject: [PATCH] mtd: plat_nand: add platform probe/remove callbacks
> Date: Thu, 5 Mar 2009 18:58:12 -0500
> 
> Add optional probe and remove callbacks to the plat_nand driver.
> 
> Some platforms may require additional setup, such as configuring
> the memory controller, before the nand device can be accessed.
> This patch provides an optional callback to handle this setup as
> well as a callback to teardown the setup.
> 
> This patch was originally submitted to linux-mtd but it was
> suggested I post it here for a broader review.

Looks OK to me, but I'm an MTD ignoramus.

> Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
> Tested-By: Alexander Clouter <alex@digriz.org.uk>
> 
> ---
> 
> diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
> index 75f9f48..600fbe9 100644

The patch was quite wordwrapped.  Please fix your email client for next
time.
