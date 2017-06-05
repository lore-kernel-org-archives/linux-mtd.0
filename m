Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dHnKz-0007WO-3c
 for linux-mtd@lists.infradead.org; Mon, 05 Jun 2017 08:26:11 +0000
Subject: Re: [PATCH] ubifs: Fix a sleep-in-atomic bug in ubifs_read_nnode
To: Jia-Ju Bai <baijiaju1990@163.com>, dedekind1@gmail.com
References: <1496633916-32362-1-git-send-email-baijiaju1990@163.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <0687ba2f-f7d5-4632-eebb-50bbadd8a4b0@nod.at>
Date: Mon, 5 Jun 2017 10:25:40 +0200
MIME-Version: 1.0
In-Reply-To: <1496633916-32362-1-git-send-email-baijiaju1990@163.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jia-Ju Bai,

Am 05.06.2017 um 05:38 schrieb Jia-Ju Bai:
> The driver may sleep under a spin lock, and the function call path is:
> ubifs_change_lp (acquire the lock by spin_lock)
>   change_category
>     ubifs_remove_from_cat
>       remove_from_lpt_heap
>         dbg_check_heap
>           ubifs_lpt_lookup
>             ubifs_read_nnode
>               kzalloc(GFP_NOFS) --> may sleep
> 
> To fix it, "GFP_NOFS" is replaced with "GFP_ATOMIC".

So, this happens only when dbg_check_heap() is activated, right?

Thanks,
//richard
