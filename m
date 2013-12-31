Received: from mail-ob0-f181.google.com ([209.85.214.181])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VxtBM-0005LC-NU
 for linux-mtd@lists.infradead.org; Tue, 31 Dec 2013 06:52:05 +0000
Received: by mail-ob0-f181.google.com with SMTP id uy5so12421931obc.40
 for <linux-mtd@lists.infradead.org>; Mon, 30 Dec 2013 22:51:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <001801cf05f4$1d573f90$5805beb0$%han@samsung.com>
References: <1388466690-16435-1-git-send-email-sachin.kamat@linaro.org>
 <001801cf05f4$1d573f90$5805beb0$%han@samsung.com>
Date: Tue, 31 Dec 2013 12:21:42 +0530
Message-ID: <CAK9yfHws5BqAVPHkY7Lnqz8zpXb9LsrB9YxmAunwhRLO=mLrgg@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: s3c2410: Move plat/regs-nand.h to drivers/mtd
From: Sachin Kamat <sachin.kamat@linaro.org>
To: Jingoo Han <jg1.han@samsung.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Kukjin Kim <kgene.kim@samsung.com>, Patch Tracking <patches@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jingoo,

On 31 December 2013 12:17, Jingoo Han <jg1.han@samsung.com> wrote:
> On Tuesday, December 31, 2013 2:12 PM, Sachin Kamat wrote:
>>
>> plat/regs-nand.h is used only by s3c2410 nand driver.
>> Move this file to the drivers folder to remove platform
>> dependency.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>
> Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Thanks.

> However, how about consolidating this header into 's3c2410.c'?
> This comment also applies to the patch "ata: pata_samsung_cf: Move
> plat/regs-ata.h to drivers/ata".

That was an option. However considering the size of the header files, I chose to
keep them separate. Either way is fine with me though.

-- 
With warm regards,
Sachin
