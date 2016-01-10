Received: from smtp04.smtpout.orange.fr ([80.12.242.126]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aIMhw-0001Jb-70
 for linux-mtd@lists.infradead.org; Sun, 10 Jan 2016 20:35:25 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mtd: nand: pxa3xx_nand: add register access debug
References: <1439323034-8820-1-git-send-email-robert.jarzmik@free.fr>
 <20160107000626.GS109450@google.com>
Date: Sun, 10 Jan 2016 21:34:58 +0100
In-Reply-To: <20160107000626.GS109450@google.com> (Brian Norris's message of
 "Wed, 6 Jan 2016 16:06:26 -0800")
Message-ID: <87egdpdvgt.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian Norris <computersforpeace@gmail.com> writes:

> On Tue, Aug 11, 2015 at 09:57:12PM +0200, Robert Jarzmik wrote:
>> @@ -127,11 +127,23 @@
>>  #define EXT_CMD_TYPE_MONO	0 /* Monolithic read/write */
>>  
>>  /* macros for registers read/write */
>> -#define nand_writel(info, off, val)	\
>> -	writel_relaxed((val), (info)->mmio_base + (off))
>> -
>> -#define nand_readl(info, off)		\
>> -	readl_relaxed((info)->mmio_base + (off))
>> +#define nand_writel(info, off, val)					\
>> +	do {								\
>> +		dev_vdbg(&info->pdev->dev,				\
>> +			 "%s():%d nand_writel(0x%x, %s)\n",		\
>> +			 __func__, __LINE__, (val), #off);		\
>
> The stringification of 'off' works for now, but I think that'd be a bit
> restrictive in the future, if we ever want to (e.g.) do arithmetic to
> compute the offset, like:
>
> 	nand_writel(info, SOME_REGISTER_MACRO + idx * 4, foo);
>
> You might be better off just printing the hex value of the offset.
Sure. I can always have a post-processing script to recreate the register names.

I'll post a v2 soon.

Cheers.

--
Robert
