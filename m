Received: from mail-we0-f170.google.com ([74.125.82.170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBJCZ-0007lO-Rn
 for linux-mtd@lists.infradead.org; Wed, 14 Jan 2015 08:21:21 +0000
Received: by mail-we0-f170.google.com with SMTP id w61so7331168wes.1
 for <linux-mtd@lists.infradead.org>; Wed, 14 Jan 2015 00:20:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20150108012616.GQ9759@ld-irv-0074>
References: <1418873011-4974-1-git-send-email-zhang.chunyan@linaro.org>
 <4170676.z5yoWA4Rtc@wuerfel> <20150108012616.GQ9759@ld-irv-0074>
Date: Wed, 14 Jan 2015 16:20:56 +0800
Message-ID: <CAG2=9p-CJyFiid2=eA5cOi7zt9oSxScfsox5YVNngfN9nQz8-Q@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: test: Replace timeval with ktime_t in speedtest.c
 and torturetest.c
From: Chunyan Zhang <zhang.chunyan@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Lyra Zhang <zhang.lyra@gmail.com>, linux-kernel@vger.kernel.org,
 John Stultz <john.stultz@linaro.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Arnd Bergmann <arnd@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Brian

Thank you so much !

Best regards,
Chunyan

On Thu, Jan 8, 2015 at 9:26 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Thu, Dec 18, 2014 at 08:53:10AM +0100, Arnd Bergmann wrote:
>> On Thursday 18 December 2014 11:23:31 Chunyan Zhang wrote:
>> > This patch changes the 32-bit time type (timeval) to the 64-bit one
>> > (ktime_t), since 32-bit time types will break in the year 2038.
>> >
>> > I use ktime_t instead of timeval to define 'start' and 'finish'
>> > which are used to get the time for tow points.
>> >
>> > This patch also changes do_gettimeofday() to ktime_get() accordingly,
>> > since ktime_get returns a ktime_t, but do_gettimeofday returns a
>> > struct timeval, and the other reason is that ktime_get() uses
>> > the monotonic clock.
>> >
>> > This patch is based on another patch which privides a millisecond
>> > time difference function 'ktime_ms_delta' in ktime.h
>> >
>> > http://lkml.iu.edu//hypermail/linux/kernel/1412.2/00625.html
>> >
>> > Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
>> > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
>> >
>>
>> The new version still looks good to me, but as there is now a
>> dependency on another patch, I'd suggest we queue this up in the
>> y2038 branch together with the patch that introduces ktime_ms_delta.
>>
>> David or Brian, can you provide an Ack for this, or do you have
>> any objections?
>
> I just tested v2, which doesn't have this dependency and has only a
> trivial difference from v3. Seems to work OK. So:
>
> Tested-by: Brian Norris <computersforpeace@gmail.com>
> Acked-by: Brian Norris <computersforpeace@gmail.com>
>
> Feel free to queue it in the dependent branch.
>
> Thanks,
> Brian
