Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1Vum-0001Kq-Dx
 for linux-mtd@lists.infradead.org; Thu, 18 Dec 2014 07:54:29 +0000
From: Arnd Bergmann <arnd@linaro.org>
To: Chunyan Zhang <zhang.chunyan@linaro.org>
Subject: Re: [PATCH v3] mtd: test: Replace timeval with ktime_t in speedtest.c
 and torturetest.c
Date: Thu, 18 Dec 2014 08:53:10 +0100
Message-ID: <4170676.z5yoWA4Rtc@wuerfel>
In-Reply-To: <1418873011-4974-1-git-send-email-zhang.chunyan@linaro.org>
References: <1418873011-4974-1-git-send-email-zhang.chunyan@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: zhang.lyra@gmail.com, linux-kernel@vger.kernel.org, john.stultz@linaro.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 18 December 2014 11:23:31 Chunyan Zhang wrote:
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
> This patch is based on another patch which privides a millisecond
> time difference function 'ktime_ms_delta' in ktime.h
> 
> http://lkml.iu.edu//hypermail/linux/kernel/1412.2/00625.html
> 
> Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 

The new version still looks good to me, but as there is now a
dependency on another patch, I'd suggest we queue this up in the
y2038 branch together with the patch that introduces ktime_ms_delta.

David or Brian, can you provide an Ack for this, or do you have
any objections?

	Arnd
