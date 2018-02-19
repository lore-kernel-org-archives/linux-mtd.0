Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1enlgc-0005NZ-7l
 for linux-mtd@lists.infradead.org; Mon, 19 Feb 2018 13:40:57 +0000
Received: by mail-pf0-x243.google.com with SMTP id j24so1202934pff.12
 for <linux-mtd@lists.infradead.org>; Mon, 19 Feb 2018 05:40:43 -0800 (PST)
Message-ID: <1519047636.2063.3.camel@gmail.com>
Subject: Re: [PATCH NAND v2] mtd: nand: Replace printk() with appropriate
 pr_*macro()
From: Shreeya Patel <shreeya.patel23498@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: boris.brezillon@free-electrons.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr,  maximlevitsky@gmail.com,
 linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
 ezequiel@vanguardiasur.com.ar,  outreachy-kernel@googlegroups.com
Date: Mon, 19 Feb 2018 19:10:36 +0530
In-Reply-To: <5296610.PbIriun04K@blindfold>
References: <1519046025-9412-1-git-send-email-shreeya.patel23498@gmail.com>
 <5296610.PbIriun04K@blindfold>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2018-02-19 at 14:30 +0100, Richard Weinberger wrote:
> Shreeya,
Hi Richard,
> 
> Am Montag, 19. Februar 2018, 14:13:45 CET schrieb Shreeya Patel:
> > 
> > The log levels embedded with the name are more concise than
> > printk.
> > Replace printks having a log level with the appropriate
> > pr_*macro.
> > 
> > Signed-off-by: Shreeya Patel <shreeya.patel23498@gmail.com>
> Multiple patches with the same subject are confusing. :)

I'll keep this in mind.

I did not combine the two patches as they had some different
changes.

Thanks :)
> 
> Thanks,
> //richard 
