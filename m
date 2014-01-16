Received: from mail-oa0-x234.google.com ([2607:f8b0:4003:c02::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W3uYE-0000gD-NH
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2014 21:32:35 +0000
Received: by mail-oa0-f52.google.com with SMTP id o6so3541060oag.25
 for <linux-mtd@lists.infradead.org>; Thu, 16 Jan 2014 13:32:11 -0800 (PST)
Date: Thu, 16 Jan 2014 13:32:06 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] mtd: davinci_nand: Remove unnecessary labels from error
 path
Message-ID: <20140116213206.GG8919@ld-irv-0074>
References: <1389773306-7055-1-git-send-email-prabhakar.csengg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1389773306-7055-1-git-send-email-prabhakar.csengg@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 15, 2014 at 01:38:26PM +0530, Prabhakar Lad wrote:
> From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
> 
> This patch removes the unnecessary labels from
> the error path in probe function which did nothing
> than just returning error values, Thus simplifying code
> path and improved readability.
> 
> Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>

This does not apply to my branch, since some OOM messages have been
dropped. Can you rebase on l2-mtd.git (or linux-next)?

Thanks,
Brian
