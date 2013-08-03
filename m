Received: from mail-ee0-x22e.google.com ([2a00:1450:4013:c00::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5Wh5-0005bO-8V
 for linux-mtd@lists.infradead.org; Sat, 03 Aug 2013 07:56:07 +0000
Received: by mail-ee0-f46.google.com with SMTP id c13so684772eek.5
 for <linux-mtd@lists.infradead.org>; Sat, 03 Aug 2013 00:55:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1375452301.14869.323.camel@sauron.fi.intel.com>
References: <1374891256-20248-1-git-send-email-akinobu.mita@gmail.com>
 <1374891256-20248-2-git-send-email-akinobu.mita@gmail.com>
 <CAN8TOE987JxGfj-O5NxVCOCVkjsiFy2pRuNMaY3m6+mHdvqtnA@mail.gmail.com>
 <1375452301.14869.323.camel@sauron.fi.intel.com>
Date: Sat, 3 Aug 2013 16:55:43 +0900
Message-ID: <CAC5umyhCQGLP4XvryFbgm_kZYm_qJmQ=h1Yj-7UyCxjhSyt50Q@mail.gmail.com>
Subject: Re: [PATCH -next 1/7] mtd: tests: introduce mtd_test module
From: Akinobu Mita <akinobu.mita@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/8/2 Artem Bityutskiy <dedekind1@gmail.com>:
> On Sat, 2013-07-27 at 12:27 -0700, Brian Norris wrote:
>> > These functions will be used for reducing code duplication among
>> > mtd/tests modules later.
>>
>> I like this idea. There is definitely too much code duplication.
>>
>> However, there is an important tradeoff here: now to run these (very
>> simple) tests, we have a two-step process*:
>>
>> insmod mtd_test.ko
>> insmod mtd_<actualtest>.ko dev=<MTD>
>
> The helpers do not have to be in a separate module. Here is a short
> patch demonstrating how we could put all the helpers to a single .c file
> and then just link it to the tests.
>
> It renames mtd_oobtest.c to oobtest.c, and this part of the patch is
> omitted. Do it by hand if you want to try this patch:
>
> $ mv drivers/mtd/tests/mtd_oobtest.c drivers/mtd/tests/oobtest.c
>
> Note, I do realize that the code will actually be copied to every test
> module, but I think it is fine for our small test infrastructure.

I took this idea.  I have finished rewriting this patch series and
testing with nandsim using badblocks module parameter.  I'll send
next version later on.
