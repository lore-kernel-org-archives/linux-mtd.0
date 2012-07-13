Received: from mail-gg0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SpjnE-0006X6-Si
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2012 17:36:42 +0000
Received: by ggcs5 with SMTP id s5so4183892ggc.36
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2012 10:36:39 -0700 (PDT)
Message-ID: <50005C4B.4070400@gmail.com>
Date: Fri, 13 Jul 2012 14:35:07 -0300
From: "William F." <william76.sh@gmail.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] mtd: nand: allow NAND_NO_SUBPAGE_WRITE to be set from
 driver (REPORT SPAM)
References: <1342196904-13850-1-git-send-email-computersforpeace@gmail.com>
 <201207131912.42495.marex@denx.de>
In-Reply-To: <201207131912.42495.marex@denx.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Huang Shijie <shijie8@gmail.com>,
 linux-mtd@lists.infradead.org, Scott Wood <scottwood@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Em 13-07-2012 14:12, Marek Vasut escreveu:
> Dear Brian Norris,
>
>> The NAND_CHIPOPTIONS_MSK has limited utility and is causing real bugs. It
>> silently masks off at least one flag that might be set by the driver
>> (NAND_NO_SUBPAGE_WRITE). This breaks the GPMI NAND driver and possibly
>> others.
>>
>> Really, as long as driver writers exercise a small amount of care with
>> NAND_* options, this mask is not necessary at all; it was only here to
>> prevent certain options from accidentally being set by the driver. But the
>> original thought turns out to be a bad idea occasionally. Thus, kill it.
>>
>> Signed-off-by: Brian Norris<computersforpeace@gmail.com>
>> Cc: Huang Shijie<shijie8@gmail.com>
>> Cc: Marek Vasut<marex@denx.de>
> [...]
>
> Maybe we should simply split it into two sets of flags to make it clear -- chip
> ones and controller ones ?
>
> Best regards,
> Marek Vasut
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> .
>
