Received: from mail-pb0-x22e.google.com ([2607:f8b0:400e:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEfei-0005BP-Dr
 for linux-mtd@lists.infradead.org; Wed, 28 Aug 2013 13:19:29 +0000
Received: by mail-pb0-f46.google.com with SMTP id rq2so6219700pbb.19
 for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2013 06:19:06 -0700 (PDT)
Date: Wed, 28 Aug 2013 21:24:05 -0400
From: Huang Shijie <shijie8@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 06/10] mtd: fix the wrong mtd->type for nand chip
Message-ID: <20130829012403.GA4254@gmail.com>
References: <1377509808-29363-1-git-send-email-b32955@freescale.com>
 <1377509808-29363-7-git-send-email-b32955@freescale.com>
 <521D69B6.7070504@gmail.com> <521D9FCC.5010104@freescale.com>
 <521DA6B3.9080003@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <521DA6B3.9080003@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 28, 2013 at 12:28:51AM -0700, Brian Norris wrote:
> On 08/27/2013 11:59 PM, Huang Shijie wrote:
> 
> Yes, I saw that.
> 
> >That's why we should expose the MTD_MLCNANDFLASH to the user-space
> 
> All you've shown is the breakage, not the reason for exposing
> MTD_MLCNANFLASH. There's a difference between MTD_MLCNANDFLASH being
Do you mean this patch exposes the MTD_MLCNANDFLASH to user space?
or the patch 8 exposes the MTD_MLCNANDFLASH to user space?


thanks
Huang Shijie
