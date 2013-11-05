Received: from mail-vc0-x22d.google.com ([2607:f8b0:400c:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vdof6-0006N0-SZ
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2013 21:59:51 +0000
Received: by mail-vc0-f173.google.com with SMTP id lh4so6139023vcb.32
 for <linux-mtd@lists.infradead.org>; Tue, 05 Nov 2013 13:59:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <001101ced6a8$a18a2c80$e49e8580$%han@samsung.com>
References: <CAPgLHd8V06KzBcPmFywSfNxM0q6=s86xn-AdLKeY9h5JZ_nP7g@mail.gmail.com>
 <001101ced6a8$a18a2c80$e49e8580$%han@samsung.com>
Date: Tue, 5 Nov 2013 13:59:25 -0800
Message-ID: <CAN8TOE9Eac0LDA+Ke_OCPc_AQGnyYB806pO8JP-qOB1Dr8N2pg@mail.gmail.com>
Subject: Re: [PATCH -next] mtd: nand: omap: fix error return code in
 omap_nand_probe()
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>, "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Wei Yongjun <weiyj.lk@gmail.com>, "tony@atomide.com" <tony@atomide.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Daniel Mack <zonque@gmail.com>,
 yongjun_wei@trendmicro.com.cn, avinashphilip@ti.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 31, 2013 at 7:18 PM, Jingoo Han <jg1.han@samsung.com> wrote:
> On Friday, November 01, 2013 9:16 AM, Wei Yongjun wrote:
>>
>> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>>
>> Fix to return a negative error code from the error handling
>> case instead of 0, as done elsewhere in this function.
>
> Commit message is right? :-(

It sounds OK by my reading. Unless you're having trouble parsing what
"as done elsewhere in this function" is being applied to. (IOW, is the
rest of the function returning a negative error code on the error
paths, or is it returning 0? Of course the answer is the former, but
it's possible to misread it.) If it helps, I can try to tweak the
wording a bit when applying this patch.

Pekon, can I get an Acked-by?

Thanks,
Brian
