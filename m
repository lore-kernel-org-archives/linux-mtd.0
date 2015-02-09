Received: from hofr.at ([212.69.189.236] helo=mail.hofr.at)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKpqr-0008Cj-Nv
 for linux-mtd@lists.infradead.org; Mon, 09 Feb 2015 15:02:20 +0000
Date: Mon, 9 Feb 2015 16:01:45 +0100
From: Nicholas Mc Guire <der.herr@hofr.at>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] mtd: pxa3xx_nand: cleanup wait_for_completion handling
Message-ID: <20150209150145.GA13655@opentech.at>
References: <1422809737-3991-1-git-send-email-hofrat@osadl.org>
 <54D8AF6D.3080001@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54D8AF6D.3080001@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Nicholas Mc Guire <hofrat@osadl.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 09 Feb 2015, Ezequiel Garcia wrote:

> On 02/01/2015 01:55 PM, Nicholas Mc Guire wrote:
> > return type of wait_for_completion_timeout is unsigned long not int, this
> > patch uses the return value of wait_for_completion_timeout in the condition
> > directly rather than assigning it to an incorrect type variable.
> > 
> > The timeout declaration cleanup is just for readability
> > 
> > Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> > ---
> > 
> > The variable used for handling the return of wait_for_cmpletion_timeout
> > was int but should be unsigned long, where it was not in use for anything
> > else and the return value in case of completion (>0) is not used it was
> > removed and wait_for_completion_timeout() used directly in the if condition.
> > 
> > To make the timeout values a bit simpler to read and also handle all of
> > the corner cases correctly the declarations are moved to msecs_to_jiffies().
> > 
> 
> Not sure why you decided to put this explanation outside of the commit log.
> It looks useful so I'd move it up.
>

simply because I was not sure about what should go into the log and what not
but this has been clarified by Dan Carpenter - should have it correct in 
future patches.
 
> > This patch was only compile tested for pxa3xx_defconfig 
> > (implies CONFIG_MTD_NAND_PXA3xx=y)
> > 
> 
> The change looks good, but I would like someone to test it on real hardware.

thx!
hofrat
