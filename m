Received: from mail-qa0-x235.google.com ([2607:f8b0:400d:c00::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y91s1-0001cg-Ne
 for linux-mtd@lists.infradead.org; Thu, 08 Jan 2015 01:26:42 +0000
Received: by mail-qa0-f53.google.com with SMTP id j7so5400405qaq.12
 for <linux-mtd@lists.infradead.org>; Wed, 07 Jan 2015 17:26:19 -0800 (PST)
Date: Wed, 7 Jan 2015 17:26:16 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Arnd Bergmann <arnd@linaro.org>
Subject: Re: [PATCH v3] mtd: test: Replace timeval with ktime_t in
 speedtest.c and torturetest.c
Message-ID: <20150108012616.GQ9759@ld-irv-0074>
References: <1418873011-4974-1-git-send-email-zhang.chunyan@linaro.org>
 <4170676.z5yoWA4Rtc@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4170676.z5yoWA4Rtc@wuerfel>
Cc: zhang.lyra@gmail.com, linux-kernel@vger.kernel.org,
 Chunyan Zhang <zhang.chunyan@linaro.org>, john.stultz@linaro.org,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 18, 2014 at 08:53:10AM +0100, Arnd Bergmann wrote:
> On Thursday 18 December 2014 11:23:31 Chunyan Zhang wrote:
> > This patch changes the 32-bit time type (timeval) to the 64-bit one
> > (ktime_t), since 32-bit time types will break in the year 2038.
> > 
> > I use ktime_t instead of timeval to define 'start' and 'finish'
> > which are used to get the time for tow points.
> > 
> > This patch also changes do_gettimeofday() to ktime_get() accordingly,
> > since ktime_get returns a ktime_t, but do_gettimeofday returns a
> > struct timeval, and the other reason is that ktime_get() uses
> > the monotonic clock.
> > 
> > This patch is based on another patch which privides a millisecond
> > time difference function 'ktime_ms_delta' in ktime.h
> > 
> > http://lkml.iu.edu//hypermail/linux/kernel/1412.2/00625.html
> > 
> > Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
> > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> > 
> 
> The new version still looks good to me, but as there is now a
> dependency on another patch, I'd suggest we queue this up in the
> y2038 branch together with the patch that introduces ktime_ms_delta.
> 
> David or Brian, can you provide an Ack for this, or do you have
> any objections?

I just tested v2, which doesn't have this dependency and has only a
trivial difference from v3. Seems to work OK. So:

Tested-by: Brian Norris <computersforpeace@gmail.com>
Acked-by: Brian Norris <computersforpeace@gmail.com>

Feel free to queue it in the dependent branch.

Thanks,
Brian
