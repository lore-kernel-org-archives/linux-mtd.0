Date: Thu, 6 Mar 2014 23:27:02 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 0/3] mtd: gpmi: add subpage read support
Message-ID: <20140307072702.GC13420@norris-Latitude-E6410>
References: <a>
 <1388718102-26097-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1388718102-26097-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 03, 2014 at 11:01:39AM +0800, Huang Shijie wrote:
>  5) This patch depends on the following patch:
>     http://lists.infradead.org/pipermail/linux-mtd/2013-December/051091.html

Do you have an actual dependency? I don't spot it myself. They applied
fine to my tree, and the code is logically independent.

I'm ready to push this series (but not the linked one quite yet; let me
have a look). Shout if this is incorrect.

> Huang Shijie (3):
>   mtd: nand: add "page" argument for read_subpage hook
>   mtd: gpmi: do not use the mtd->writesize
>   mtd: gpmi: add subpage read support

Thanks,
Brian
