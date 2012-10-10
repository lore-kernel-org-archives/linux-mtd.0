Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TM3dB-0002hl-2W
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 21:15:53 +0000
Received: by mail-bk0-f49.google.com with SMTP id j4so559302bkw.36
 for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2012 14:15:49 -0700 (PDT)
Message-ID: <5075E57B.1090702@gmail.com>
Date: Wed, 10 Oct 2012 23:15:39 +0200
From: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Subject: Re: [PATCH] [MTD] MTD driver for LPDDR2-NVM PCM memories
References: <1349385434-3073-1-git-send-email-valibert@micron.com>
In-Reply-To: <1349385434-3073-1-git-send-email-valibert@micron.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: lporzio@micron.com, svenkatr@ti.com, arnd@arndb.de,
 Vincenzo Aliberti <vincenzo.aliberti@gmail.com>, valibert@micron.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David,
     can you pull this patch in the main line?

On 10/04/2012 11:17 PM, Vincenzo Aliberti wrote:
> Dear All,
>      continuing Micron support activity on PCM memories you can find here-below a
> patch containing MTD driver for LPDDR2-NVM memories as demoed during Q2 Linaro
> Connect in Hong Kong.
>
> Let me thank TI Panda open source team for support on platform enablement
> activity and Arnd for his first feedback on driver implementation
>
> Regards,
> 	Vincenzo
>
>
> Signed-off-by: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
> ---
>   drivers/mtd/Kconfig                 |    2 +
>   drivers/mtd/Makefile                |    2 +-
>   drivers/mtd/lpddr2_nvm/Kconfig      |    9 +
>   drivers/mtd/lpddr2_nvm/Makefile     |    5 +
>   drivers/mtd/lpddr2_nvm/lpddr2_nvm.c |  547 +++++++++++++++++++++++++++++++++++
>   include/mtd/mtd-abi.h               |    1 +
>   6 files changed, 565 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/mtd/lpddr2_nvm/Kconfig
>   create mode 100644 drivers/mtd/lpddr2_nvm/Makefile
>   create mode 100644 drivers/mtd/lpddr2_nvm/lpddr2_nvm.c
>

Thanks,
     Vincenzo
