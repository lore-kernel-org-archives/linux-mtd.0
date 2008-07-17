Received: from [202.202.0.36] (helo=cqu.edu.cn)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KJK0S-0004hG-RQ
	for linux-mtd@lists.infradead.org; Thu, 17 Jul 2008 03:18:13 +0000
Message-ID: <416264428.20337@cqu.edu.cn>
Subject: Re: [PATCH][UBI]:Remove the prot tree from the WL unit
From: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
To: dedekind@infradead.org
In-Reply-To: <1216219840.29469.81.camel@sauron>
References: <1216214483.2782.91.camel@localhost.localdomain>
	<1216217566.29469.62.camel@sauron>
	<1216218027.2782.97.camel@localhost.localdomain>
	<1216218036.29469.64.camel@sauron>
	<1216218971.2782.112.camel@localhost.localdomain>
	<1216219840.29469.81.camel@sauron>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Jul 2008 11:17:42 +0800
Message-Id: <1216264662.2781.15.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Wed, 2008-07-16 at 17:50 +0300, Artem Bityutskiy wrote:
> 
> Sure, this is an intermediate state. Your next patches should fix
> this. We just removed the protection tree separately because it
> is an independed step and it will make further patches simpler
> to review and understand. 

I believe the next patch should modify the used tree, i.e., adding the
@tempr element to @struct ubi_wl_entry and some relative sentences.
Of course, a used tree special function refer to as @wl_used_tree_add()
is in need.  

What do you think?



-- 
yours Sincerely,

xiaochuan-xu (许小川)
