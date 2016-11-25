Received: from mail-wj0-x22d.google.com ([2a00:1450:400c:c01::22d])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAHM7-0000XJ-9K
 for linux-mtd@lists.infradead.org; Fri, 25 Nov 2016 14:20:04 +0000
Received: by mail-wj0-x22d.google.com with SMTP id qp4so60226026wjc.3
 for <linux-mtd@lists.infradead.org>; Fri, 25 Nov 2016 06:19:38 -0800 (PST)
Subject: =?UTF-8?B?UmU6IOWbnuWkje+8mkhhbmRsaW5nIHNvZnQgcmVzZXQgb24gbXQ3MjYx?=
 =?UTF-8?Q?_SoC_with_32M_flash?=
To: Tymon <banglang.huang@foxmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
References: <tencent_45F3AFA3524D96AA13E4449A@qq.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <6f125fe0-a41a-61ca-04e6-d50cc8c8a5aa@gmail.com>
Date: Fri, 25 Nov 2016 15:15:08 +0100
MIME-Version: 1.0
In-Reply-To: <tencent_45F3AFA3524D96AA13E4449A@qq.com>
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

On 11/23/2016 05:53 AM, Tymon wrote:
> I think sending “0x66 0x99” to mx25l256 is a proper way to fix the issue,
> because this action does not change the bit-mode of spi flash and it only work
> when user reboot the system.

Since there is no context here, I cannot really comment, but is this
about SPI NOR being in 4-byte addressing mode and bootrom which does
not support it? If so, what happens if you press reset button on the
device ? SPI NOR remains in undefined mode and bootrom won't read the
bootloader from it. The only real fix is to implement CORRECT dedicated
SPI NOR reset logic.

> ------------------
> Regards,
> 
> banglang huang
>  
> 
> 
> ------------------ 原始邮件 ------------------
> 发件人: "Dominik Menke";<dom@digineo.de>;
> 发送时间: 2016年11月18日(星期五) 晚上10:20
> 收件人: "linux-mtd"<linux-mtd@lists.infradead.org>; 
> 主题: Handling soft reset on mt7261 Soc with 32M flash
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 


-- 
Best regards,
Marek Vasut
