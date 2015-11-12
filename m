In-Reply-To: <OFD19ED9E9.14F44100-ON48257EFB.00077C5B-48257EFB.000D5F50@zte.com.cn>
References: <2015102618531107256082@top-vision.cn>,
 <OF29DE4023.3FDE364E-ONC1257EF8.004B3067-C1257EF8.00613BF0@rohde-schwarz.com>
 <2015111020502373692025@top-vision.cn>
 <OF69D506BE.C7212435-ONC1257EFA.002F1880-C1257EFA.0043D703@rohde-schwarz.com>
 <OFD19ED9E9.14F44100-ON48257EFB.00077C5B-48257EFB.000D5F50@zte.com.cn>
To: deng.chao1@zte.com.cn
Cc: chao.deng@linaro.org, Joakim Tjernlund <joakim.tjernlund@transmode.se>,
 "'Li Jiaxin'" <lijiaxin@top-vision.cn>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-mtd <linux-mtd-bounces@lists.infradead.org>,
 Ming Liu <liu.ming50@gmail.com>, lizhenwei <lizhenwei@top-vision.cn>,
 wangzaiwei <wangzaiwei@top-vision.cn>
MIME-Version: 1.0
Subject: Re: Another JFFS2 deadlock, kernel 3.4.11
From: Thomas.Betker@rohde-schwarz.com
Message-ID: <OF8CC5717E.18886308-ONC1257EFB.003410F0-C1257EFB.0035CF9A@rohde-schwarz.com>
Date: Thu, 12 Nov 2015 10:47:43 +0100
Content-Type: text/plain; charset="ISO-2022-JP"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Deng:

>   My patch makes jffs2_garbage_collect_pass return 0 NOT error when 
> it can not get page lock. This means "try again".
>   No matter where jffs2_garbage_collect_pass is called, it will 
> always loop until it gets its goal.
>   However wangzaiwei's doubt is somehow reasonable. 
> jffs2_garbage_collect_pass is not only called by gc thread but also 
> by jffs2_reserve_space, this will introduce a living lock in a rare 
situation.
>   Consider this:
>   The disk is almost full, this means jffs2_reserve_space may call 
> jffs2_garbage_collect_pass to get free space when performing write 
operation.
>   Then Thread A has acquired the page lock when it is now writing, 
> and its priority is low.
>   Thread B is a rt thread, and its priority is higher than A, is 
> also writing. If B preempts A when A is holding the page lock, and 
> in the same time B calls jffs2_reserve_space->jffs2_collect_pass to 
> acquire the page lock, living lock occurs: B will always loop to 
> wait A to release the page lock which is preemptted by B itself.
> 
>   To solve this, I make jffs2_reserve_space to sleep a while when it
> finds jffs2_garbage_collect_pass cannot fetch the page lock.
> 
>   Still，I agree with Thomas that my patch is too heavy. It will be 
> much better if we find way to just modify jffs2_garbage_collect_pass
> to avoid the original deadlock.
>   But I think the fix is too tricky to me, I have not got any idea yet.

I would still think it's a goood idea if you sent your current patch to 
linux-mtd and linux-mm. At the moment, it's the only solution we got, and 
perhaps somebody on linux-mm will find a better way. And your (old) patch 
has been running happily on our devices for almost two years now, so I can 
provide a Tested-by:.

@wangzaiwei: Your test scripts have actually run for 24 hours on my device 
without any problems (I had to stop it this morning).

Best regards,
Thomas Betker
