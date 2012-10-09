Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TLcWM-000281-DN
 for linux-mtd@lists.infradead.org; Tue, 09 Oct 2012 16:19:06 +0000
Date: Tue, 9 Oct 2012 16:18:47 +0200
From: Richard Weinberger <richard@nod.at>
To: Wei Yongjun <weiyj.lk@gmail.com>
Subject: Re: [PATCH] ubi: use list_move_tail instead of list_del/list_add_tail
Message-ID: <20121009161847.79031abb@spider.haslach.nod.at>
In-Reply-To: <CAPgLHd_AHHe7=H18K54LvbiS0M7_w1vTMOxwwxgVdRaiXNN-OA@mail.gmail.com>
References: <CAPgLHd_AHHe7=H18K54LvbiS0M7_w1vTMOxwwxgVdRaiXNN-OA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, yongjun_wei@trendmicro.com.cn,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Tue, 9 Oct 2012 14:14:21 +0800
schrieb Wei Yongjun <weiyj.lk@gmail.com>:

> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> 
> Using list_move_tail() instead of list_del() + list_add_tail().
> 
> dpatch engine is used to auto generate this patch.
> (https://github.com/weiyj/dpatch)
> 
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Acked-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
