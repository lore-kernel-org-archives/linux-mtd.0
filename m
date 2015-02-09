Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKnzq-0004vx-6h
 for linux-mtd@lists.infradead.org; Mon, 09 Feb 2015 13:03:27 +0000
Message-ID: <54D8AF6D.3080001@free-electrons.com>
Date: Mon, 09 Feb 2015 10:00:29 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
To: Nicholas Mc Guire <hofrat@osadl.org>
Subject: Re: [PATCH] mtd: pxa3xx_nand: cleanup wait_for_completion handling
References: <1422809737-3991-1-git-send-email-hofrat@osadl.org>
In-Reply-To: <1422809737-3991-1-git-send-email-hofrat@osadl.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/01/2015 01:55 PM, Nicholas Mc Guire wrote:
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

Not sure why you decided to put this explanation outside of the commit log.
It looks useful so I'd move it up.

> This patch was only compile tested for pxa3xx_defconfig 
> (implies CONFIG_MTD_NAND_PXA3xx=y)
> 

The change looks good, but I would like someone to test it on real hardware.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
