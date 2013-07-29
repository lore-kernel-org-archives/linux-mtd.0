Received: from mail-oa0-x22e.google.com ([2607:f8b0:4003:c02::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V3dve-00038Y-M1
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2013 03:15:23 +0000
Received: by mail-oa0-f46.google.com with SMTP id h1so11939033oag.33
 for <linux-mtd@lists.infradead.org>; Sun, 28 Jul 2013 20:15:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <51F4A0FE.1020007@gmail.com>
References: <1374891256-20248-1-git-send-email-akinobu.mita@gmail.com>
 <1374891256-20248-2-git-send-email-akinobu.mita@gmail.com>
 <CAN8TOE987JxGfj-O5NxVCOCVkjsiFy2pRuNMaY3m6+mHdvqtnA@mail.gmail.com>
 <CAC5umyhmumvmVuQDSMUjWnhh79Kn3AqfBWa5ZuCbyjspVtL-CQ@mail.gmail.com>
 <51F4A069.7020902@gmail.com> <51F4A0FE.1020007@gmail.com>
Date: Mon, 29 Jul 2013 12:15:01 +0900
Message-ID: <CAC5umygKFqhEND36eJyQOKxFafHMLBSsGGAZOXWAagLy4aqQiA@mail.gmail.com>
Subject: Re: [PATCH -next 1/7] mtd: tests: introduce mtd_test module
From: Akinobu Mita <akinobu.mita@gmail.com>
To: Vikram Narayanan <vikram186@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/7/28 Vikram Narayanan <vikram186@gmail.com>:
> On 28/Jul/2013 10:09 AM, Vikram Narayanan wrote:
>>
>> On 28/Jul/2013 7:51 AM, Akinobu Mita wrote:
>>>
>>> 2013/7/28 Brian Norris <computersforpeace@gmail.com>:
>>>>
>>>> I like this idea. There is definitely too much code duplication.
>>>>
>>>> However, there is an important tradeoff here: now to run these (very
>>>> simple) tests, we have a two-step process*:
>>>>
>>>> insmod mtd_test.ko
>>>> insmod mtd_<actualtest>.ko dev=<MTD>
>>>>
>>>> [* modprobe would solve this problem, but these tests are often
>>>> compiled and run by hand, sometimes on systems without the convenience
>>>> of modprobe ]
>>>>
>>>> We could still accomplish the reduction in (source) code duplication
>>>> by simply including these simple routines in a header, then the code
>>>> would be compiled into each test module. I realize this isn't
>>>> typically the "best" way to share code, but since these are just test
>>>> modules and really don't need to be optimized for code size, I think
>>>> it is worth avoiding the extra step of inserting another module.
>>>
>>>
>>> I understand your concern and I'm going to change this series to move
>>> all these functions into a header file.  But I'll wait other opinion
>>> for a while.
>>
>>
>> You can refer this.
>> <http://thread.gmane.org/gmane.linux.drivers.mtd/43932/focus=43941>
>
>
> http://article.gmane.org/gmane.linux.drivers.mtd/43933

Thanks.  I noticed that there were a few more places where erase_eraseblock()
could be used in mtd/tests modules.  I'll include these in next version
of this patch set.

>> And also Artem's feedback here
>> <http://thread.gmane.org/gmane.linux.drivers.mtd/43932/focus=43941>
>
>
> http://article.gmane.org/gmane.linux.drivers.mtd/44007

I checked all callsites of mtd_erase() in the tree, but there is no places where
we can simply use erase_eraseblock().  If erase_eraseblock() can take
additional arguments (callback and priv), there are only a few places
(in mtdswap.c and ubi/io.c) where we can use it.  So I think we don't
need to extend mtdcore.c for now.
