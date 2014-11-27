Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xtmd2-00024Y-Vx
 for linux-mtd@lists.infradead.org; Thu, 27 Nov 2014 00:08:13 +0000
Received: by mail-pd0-f181.google.com with SMTP id z10so3758937pdj.12
 for <linux-mtd@lists.infradead.org>; Wed, 26 Nov 2014 16:07:52 -0800 (PST)
Date: Wed, 26 Nov 2014 16:07:48 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: zhangxingcai <zhangxingcai@huawei.com>
Subject: Re: =?utf-8?B?562U5aSNOiBbUEFUQw==?= =?utf-8?Q?H?= 3/3] [PATCH] mtd:
 fix concurrent access to mtd->usecount
Message-ID: <20141127000748.GF21347@ld-irv-0074>
References: <1417008990-24413-1-git-send-email-zhangxingcai@huawei.com>
 <20141126181030.GC21347@ld-irv-0074>
 <DFCD9FCD7B2D0148BC097DBCAE107A3327C764@SZXEML503-MBS.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DFCD9FCD7B2D0148BC097DBCAE107A3327C764@SZXEML503-MBS.china.huawei.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Fengfuqiu <fengfuqiu@huawei.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tanhaijun <tanhaijun@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Please don't top-post)

On Thu, Nov 27, 2014 at 12:04:52AM +0000, zhangxingcai wrote:
> I am sorry about it, it has only one patch indeed. 
> 
> because another two patch is not related to it, so it didn't display in the email.
> 
> Should I send-email again ?

No, at least not yet. I just wanted to make sure I wasn't missing
anything.

> -----邮件原件-----
> 发件人: Brian Norris [mailto:computersforpeace@gmail.com] 
> 发送时间: 2014年11月27日 2:11
> 收件人: zhangxingcai
> 抄送: dwmw2@infradead.org; linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.org; Fengfuqiu; Tanhaijun
> 主题: Re: [PATCH 3/3] [PATCH] mtd: fix concurrent access to mtd->usecount
> 
> On Wed, Nov 26, 2014 at 09:36:30PM +0800, zhangxingcai wrote:
> [...]
> 
> What series is this patch 3/3 of? It looks like it stands alone, and I wasn't CC'd on anything else related to it.

Brian
