Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cptPG-0001BH-K4
 for linux-mtd@lists.infradead.org; Mon, 20 Mar 2017 09:15:32 +0000
Subject: Re: UBIFS: Failed to read/write file when contiguous pages are not
 enough
To: yhb@ruijie.com.cn, linux-mtd@lists.infradead.org
References: <80B78A8B8FEE6145A87579E8435D78C3079814E8@FZEX3.ruijie.com.cn>
Cc: dedekind1@gmail.com, yushouhua@ruijie.com.cn, dengwenjie@ruijie.com.cn,
 huangcb@ruijie.com.cn, jiangxh@ruijie.com.cn
From: Richard Weinberger <richard@nod.at>
Message-ID: <1a5eb9d2-8db0-5ca3-d873-a2bd8439c30d@nod.at>
Date: Mon, 20 Mar 2017 10:14:42 +0100
MIME-Version: 1.0
In-Reply-To: <80B78A8B8FEE6145A87579E8435D78C3079814E8@FZEX3.ruijie.com.cn>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 20.03.2017 um 10:09 schrieb yhb@ruijie.com.cn:
> The number of free pages is above high watermark, but the number of the free pages with order >= 1 is below half of min watermark.
> Many processes hang in the page fault handler.
> UBIFS needs improvement: do not allocate contiguous pages.

Also care to answer my questions?

Thanks,
//richard
