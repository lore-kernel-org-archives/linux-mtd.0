Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V3Ilc-0002kM-43
 for linux-mtd@lists.infradead.org; Sun, 28 Jul 2013 04:39:36 +0000
Received: by mail-pa0-f43.google.com with SMTP id hz10so3681088pad.16
 for <linux-mtd@lists.infradead.org>; Sat, 27 Jul 2013 21:39:13 -0700 (PDT)
Message-ID: <51F4A069.7020902@gmail.com>
Date: Sun, 28 Jul 2013 10:09:05 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: Akinobu Mita <akinobu.mita@gmail.com>
Subject: Re: [PATCH -next 1/7] mtd: tests: introduce mtd_test module
References: <1374891256-20248-1-git-send-email-akinobu.mita@gmail.com>
 <1374891256-20248-2-git-send-email-akinobu.mita@gmail.com>
 <CAN8TOE987JxGfj-O5NxVCOCVkjsiFy2pRuNMaY3m6+mHdvqtnA@mail.gmail.com>
 <CAC5umyhmumvmVuQDSMUjWnhh79Kn3AqfBWa5ZuCbyjspVtL-CQ@mail.gmail.com>
In-Reply-To: <CAC5umyhmumvmVuQDSMUjWnhh79Kn3AqfBWa5ZuCbyjspVtL-CQ@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
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

On 28/Jul/2013 7:51 AM, Akinobu Mita wrote:
> 2013/7/28 Brian Norris <computersforpeace@gmail.com>:
>> I like this idea. There is definitely too much code duplication.
>>
>> However, there is an important tradeoff here: now to run these (very
>> simple) tests, we have a two-step process*:
>>
>> insmod mtd_test.ko
>> insmod mtd_<actualtest>.ko dev=<MTD>
>>
>> [* modprobe would solve this problem, but these tests are often
>> compiled and run by hand, sometimes on systems without the convenience
>> of modprobe ]
>>
>> We could still accomplish the reduction in (source) code duplication
>> by simply including these simple routines in a header, then the code
>> would be compiled into each test module. I realize this isn't
>> typically the "best" way to share code, but since these are just test
>> modules and really don't need to be optimized for code size, I think
>> it is worth avoiding the extra step of inserting another module.
>
> I understand your concern and I'm going to change this series to move
> all these functions into a header file.  But I'll wait other opinion
> for a while.

You can refer this.
<http://thread.gmane.org/gmane.linux.drivers.mtd/43932/focus=43941>

And also Artem's feedback here
<http://thread.gmane.org/gmane.linux.drivers.mtd/43932/focus=43941>

However, I didn't get much time to make this patch better as Artem 
suggested.

~Vikram
