Received: from mail-ie0-f177.google.com ([209.85.223.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TW17T-0007ci-7E
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2012 08:36:19 +0000
Received: by mail-ie0-f177.google.com with SMTP id e14so1945032iej.36
 for <linux-mtd@lists.infradead.org>; Wed, 07 Nov 2012 00:36:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <dd11b4d47ab566931cb943dea34e67c1ce2c3e59.1351530856.git.viresh.kumar@linaro.org>
References: <dd11b4d47ab566931cb943dea34e67c1ce2c3e59.1351530856.git.viresh.kumar@linaro.org>
Date: Wed, 7 Nov 2012 14:06:16 +0530
Message-ID: <CAKohpokakFB6v9P=ocmb3Zx8K6k7qmibzha7+2+boDSBt-TQbQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: map: Fix compilation warning
From: Viresh Kumar <viresh.kumar@linaro.org>
To: dwmw2@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: linaro-dev@lists.linaro.org, dedekind1@gmail.com,
 Viresh Kumar <viresh.kumar@linaro.org>, patches@linaro.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 29 October 2012 22:47, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> This patch is an attempt to fix following compilation warning.
>
> In file included from drivers/mtd/chips/cfi_cmdset_0001.c:35:0:
> drivers/mtd/chips/cfi_cmdset_0001.c: In function 'cfi_intelext_write_words':
> include/linux/mtd/map.h:331:11: warning: 'r.x[0]' may be used uninitialized in this function [-Wmaybe-uninitialized]
>
> I could have used uninitialized_var() too, but didn't used it as the final else
> part of map_word_load() is missing. So there is a chance that it might be passed
> uninitialized. Better initialize to zero.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Ping!!
