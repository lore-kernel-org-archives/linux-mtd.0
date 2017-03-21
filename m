Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqJCh-00075E-9c
 for linux-mtd@lists.infradead.org; Tue, 21 Mar 2017 12:48:01 +0000
Subject: Re: UBIFS: Failed to read/write file when contiguous pages are not
 enough
To: yhb@ruijie.com.cn, dedekind1@gmail.com, linux-mtd@lists.infradead.org
References: <80B78A8B8FEE6145A87579E8435D78C30798ADD9@FZEX3.ruijie.com.cn>
Cc: yushouhua@ruijie.com.cn, dengwenjie@ruijie.com.cn, huangcb@ruijie.com.cn,
 jiangxh@ruijie.com.cn
From: Richard Weinberger <richard@nod.at>
Message-ID: <a28ed6f1-212a-233e-fd66-9f32cd0f9540@nod.at>
Date: Tue, 21 Mar 2017 13:47:30 +0100
MIME-Version: 1.0
In-Reply-To: <80B78A8B8FEE6145A87579E8435D78C30798ADD9@FZEX3.ruijie.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 21.03.2017 um 13:34 schrieb yhb@ruijie.com.cn:
> Yes, I look forward to this improvement.

In general it would be nice to replace all large buffers in UBIFS
by scatter gather lists. But this is a non-trivial change.

Thanks,
//richard
