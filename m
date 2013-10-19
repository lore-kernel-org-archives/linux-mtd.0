Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VXWZN-0003g5-DX
 for linux-mtd@lists.infradead.org; Sat, 19 Oct 2013 13:27:54 +0000
Date: Sat, 19 Oct 2013 10:27:49 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] UBIFS: remove unnecessary code in ubifs_garbage_collect
Message-ID: <20131019132748.GC2470@localhost>
References: <OF476A1E1E.10D82F3D-ON48257BC9.002911AE-48257BC9.002A75A8@zte.com.cn>
 <20130917015105.GM4550@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20130917015105.GM4550@ld-irv-0074.broadcom.com>
Cc: wang.bo116@zte.com.cn, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Ccing Artem who might have missed this one)

On Mon, Sep 16, 2013 at 06:51:05PM -0700, Brian Norris wrote:
> On Fri, Aug 16, 2013 at 03:43:36PM +0800, wang.bo116@zte.com.cn wrote:
> > Hi,
> > 	In ubifs_garbage_collect,local variable "space_before" calculate twice. In fact, at the
> > beginning of the loop, there is no need to calculate this variable. Calculate it before call
> > "ubifs_garbage_collect_leb" is enough. This patch just remove the unnecessary calculate code.
> > 
> > 
> > 
> > Signed-off-by: wang bo <wang.bo116@zte.com.cn>
> 
> Acked-by: Brian Norris <computersforpeace@gmail.com>
> 

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
