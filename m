Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYdDG-00059l-Ih
 for linux-mtd@lists.infradead.org; Tue, 22 Oct 2013 14:45:39 +0000
Message-ID: <1382453064.23828.1.camel@karhu>
Subject: Re: [PATCH] UBIFS: remove unnecessary code in ubifs_garbage_collect
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
In-Reply-To: <20131019132748.GC2470@localhost>
References: <OF476A1E1E.10D82F3D-ON48257BC9.002911AE-48257BC9.002A75A8@zte.com.cn>
 <20130917015105.GM4550@ld-irv-0074.broadcom.com>
 <20131019132748.GC2470@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 22 Oct 2013 15:44:24 +0100
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: wang.bo116@zte.com.cn, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2013-10-19 at 10:27 -0300, Ezequiel Garcia wrote:
> (Ccing Artem who might have missed this one)
> 
> On Mon, Sep 16, 2013 at 06:51:05PM -0700, Brian Norris wrote:
> > On Fri, Aug 16, 2013 at 03:43:36PM +0800, wang.bo116@zte.com.cn wrote:
> > > Hi,
> > > 	In ubifs_garbage_collect,local variable "space_before" calculate twice. In fact, at the
> > > beginning of the loop, there is no need to calculate this variable. Calculate it before call
> > > "ubifs_garbage_collect_leb" is enough. This patch just remove the unnecessary calculate code.
> > > 
> > > 
> > > 
> > > Signed-off-by: wang bo <wang.bo116@zte.com.cn>
> > 
> > Acked-by: Brian Norris <computersforpeace@gmail.com>

Pushed to linux-ubifs.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
