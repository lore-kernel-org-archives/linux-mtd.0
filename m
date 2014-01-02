Received: from mail-oa0-f41.google.com ([209.85.219.41])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VyaQW-0004v2-BM
 for linux-mtd@lists.infradead.org; Thu, 02 Jan 2014 05:02:36 +0000
Received: by mail-oa0-f41.google.com with SMTP id j17so14640733oag.0
 for <linux-mtd@lists.infradead.org>; Wed, 01 Jan 2014 21:02:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1388466690-16435-1-git-send-email-sachin.kamat@linaro.org>
References: <1388466690-16435-1-git-send-email-sachin.kamat@linaro.org>
Date: Thu, 2 Jan 2014 10:32:11 +0530
Message-ID: <CAK9yfHy9qi6NOtyW333e9WoSo4DFfz6C6uu-6cvUUm4JAyAAEw@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: s3c2410: Move plat/regs-nand.h to drivers/mtd
From: Sachin Kamat <sachin.kamat@linaro.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: Brian Norris <computersforpeace@gmail.com>,
 Kukjin Kim <kgene.kim@samsung.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Sachin Kamat <sachin.kamat@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 31 December 2013 10:41, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> plat/regs-nand.h is used only by s3c2410 nand driver.
> Move this file to the drivers folder to remove platform
> dependency.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>

Please ignore this patch. Sent an updated version.


-- 
With warm regards,
Sachin
