Date: Thu, 14 Nov 2013 15:04:36 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v5 00/14] Armada 370/XP NAND support
Message-ID: <20131114230436.GV9468@ld-irv-0074.broadcom.com>
References: <1384464339-6817-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1384464339-6817-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 14, 2013 at 06:25:25PM -0300, Ezequiel Garcia wrote:
> * Changes from v4
> 
>   * Rebased on top of l2-mtd.git origin/next branch
> 
>   * Fixed is_ready flag reset, renamed by a more descriptive
>     and readble "need_wait".
> 

...

I think this series is now good as-is. Pushing to l2-mtd.git/next.
Thanks for the efforts! I can submit my extra diff from patch 12 as a
separate patch for review.

Do you have any available regression tests? Or was there somebody else
we could run this by for some Tested-by's? Daniel Mack, perhaps?

Thanks,
Brian
