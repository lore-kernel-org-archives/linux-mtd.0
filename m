MIME-Version: 1.0
In-Reply-To: <AANLkTikVAU5KAN072O7xp=A3meFTw5AadUSoqbzEGofO@mail.gmail.com>
References: <1287742484-4276-1-git-send-email-leiwen@marvell.com>
	<AANLkTikVAU5KAN072O7xp=A3meFTw5AadUSoqbzEGofO@mail.gmail.com>
Date: Fri, 19 Nov 2010 12:42:47 +0800
Message-ID: <AANLkTin2O-mQi9jxnJsgBr82T1FRrRavMA5MMnvzueJ7@mail.gmail.com>
Subject: Re: [PATCH V3 0/6] pxa3xx_nand update series set
From: Lei Wen <adrian.wenl@gmail.com>
To: Haojian Zhuang <haojian.zhuang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Eric Miao <eric.y.miao@gmail.com>, Lei Wen <leiwen@marvell.com>,
	Haojian Zhuang <haojian.zhuang@marvell.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

Would you mind check whether those patches need any fix, or could be merged now?

Thanks,
Lei

On Fri, Oct 22, 2010 at 6:15 PM, Haojian Zhuang
<haojian.zhuang@gmail.com> wrote:
> On Fri, Oct 22, 2010 at 6:14 PM, Lei Wen <leiwen@marvell.com> wrote:
>> [PATCH V3 1/6] pxa3xx_nand: make scan procedure more clear
>> [PATCH V3 2/6] pxa3xx_nand: rework irq logic
>> [PATCH V3 3/6] pxa3xx_nand: discard wait_for_event,write_cmd,__readid function
>> [PATCH V3 4/6] pxa3xx_nand: unify prepare command
>> [PATCH V3 5/6] pxa3xx_nand: mtd scan id process could be defined by driver itself
>> [PATCH V3 6/6] pxa3xx_nand: clean the keep configure code
>>
>
> Hi Eric and all,
>
> Patches are refreshed. Please help to review.
>
> Best Regards
> Haojian
>
