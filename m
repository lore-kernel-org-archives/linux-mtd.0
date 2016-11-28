Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBBtb-0000g3-4x
 for linux-mtd@lists.infradead.org; Mon, 28 Nov 2016 02:42:20 +0000
Received: by mail-wm0-x230.google.com with SMTP id g23so192554730wme.1
 for <linux-mtd@lists.infradead.org>; Sun, 27 Nov 2016 18:41:57 -0800 (PST)
Subject: =?UTF-8?B?UmU6IOWbnuWkje+8miDlm57lpI3vvJpIYW5kbGluZyBzb2Z0IHJlc2V0?=
 =?UTF-8?Q?_on_mt7261_SoC_with_32M_flash?=
To: Tymon <banglang.huang@foxmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
References: <tencent_45F3AFA3524D96AA13E4449A@qq.com>
 <6f125fe0-a41a-61ca-04e6-d50cc8c8a5aa@gmail.com>
 <tencent_4CE5B4086D95E4B1431C87DE@qq.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <f38032e4-bfc1-a5a2-7ba0-4088812a7b29@gmail.com>
Date: Mon, 28 Nov 2016 03:41:54 +0100
MIME-Version: 1.0
In-Reply-To: <tencent_4CE5B4086D95E4B1431C87DE@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/28/2016 02:34 AM, Tymon wrote:
> The real reason had been described : when the flash size > 16MB, the SPI bus must
> be configured to use 4-byte mode. The problem arised after a soft reset, when the SoC
> expects the SPI to be in 3-byte addressing mode, but then can't communicate with the flash.
> 
> http://lists.infradead.org/pipermail/linux-mtd/2016-November/070368.html

Well yes, it's the same problem, over and over again. Some flashes have
dedicated 4-byte opcodes.

btw please stop top-posting.

> ------------------ 原始邮件 ------------------
> 发件人: "Marek Vasut";<marek.vasut@gmail.com>;
> 发送时间: 2016年11月25日(星期五) 晚上10:15
> 收件人: "Tymon"<banglang.huang@foxmail.com>; "linux-mtd"<linux-mtd@lists.infradead.org>; 
> 主题: Re: 回复：Handling soft reset on mt7261 SoC with 32M flash
> 
> On 11/23/2016 05:53 AM, Tymon wrote:
>> I think sending “0x66 0x99” to mx25l256 is a proper way to fix the issue,
>> because this action does not change the bit-mode of spi flash and it only work
>> when user reboot the system.
> 
> Since there is no context here, I cannot really comment, but is this
> about SPI NOR being in 4-byte addressing mode and bootrom which does
> not support it? If so, what happens if you press reset button on the
> device ? SPI NOR remains in undefined mode and bootrom won't read the
> bootloader from it. The only real fix is to implement CORRECT dedicated
> SPI NOR reset logic.
> 
>> ------------------
>> Regards,
>>
>> banglang huang
>>  
>>
>>
>> ------------------ 原始邮件 ------------------
>> 发件人: "Dominik Menke";<dom@digineo.de>;
>> 发送时间: 2016年11月18日(星期五) 晚上10:20
>> 收件人: "linux-mtd"<linux-mtd@lists.infradead.org>; 
>> 主题: Handling soft reset on mt7261 Soc with 32M flash
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>
> 
> 


-- 
Best regards,
Marek Vasut
