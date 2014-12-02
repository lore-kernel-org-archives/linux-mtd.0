Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvnWd-0004Nt-QS
 for linux-mtd@lists.infradead.org; Tue, 02 Dec 2014 13:29:56 +0000
From: Arnd Bergmann <arnd@linaro.org>
To: Chunyan Zhang <zhang.chunyan@linaro.org>
Subject: Re: [PATCH v2] mtd: test: Replace timeval with ktime_t in speedtest.c
 and torturetest.c
Date: Tue, 02 Dec 2014 14:28:55 +0100
Message-ID: <2445506.vMokCWrmuB@wuerfel>
In-Reply-To: <1417519354-25794-1-git-send-email-zhang.chunyan@linaro.org>
References: <1417519354-25794-1-git-send-email-zhang.chunyan@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: john.stultz@linaro.org, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 02 December 2014 19:22:34 Chunyan Zhang wrote:
> This patch changes the 32-bit time type (timeval) to the 64-bit one
> (ktime_t), since 32-bit time types will break in the year 2038.
> 
> I use ktime_t instead of timeval to define 'start' and 'finish'
> which are used to get the time for tow points.
> 
> This patch also changes do_gettimeofday() to ktime_get() accordingly,
> since ktime_get returns a ktime_t, but do_gettimeofday returns a
> struct timeval, and the other reason is that ktime_get() uses
> the monotonic clock.
> 
> Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
> ---
> Changes since v1:
>  - Add including <linux/ktime.h> in torturetest.c

Looks good to me,

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
