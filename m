Received: from mail-oa0-x22b.google.com ([2607:f8b0:4003:c02::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V74SY-0000x3-LO
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 14:11:31 +0000
Received: by mail-oa0-f43.google.com with SMTP id i10so3507607oag.30
 for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2013 07:11:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1375798078.30770.145.camel@sauron.fi.intel.com>
References: <1375523536-32671-1-git-send-email-akinobu.mita@gmail.com>
 <1375798078.30770.145.camel@sauron.fi.intel.com>
Date: Wed, 7 Aug 2013 23:11:07 +0900
Message-ID: <CAC5umyj=7Eug0Eaqacps1y_2zfzQrU93Z+Ukxgvh=AeXgHRPRA@mail.gmail.com>
Subject: Re: [PATCH -next v2 00/10] mtd: tests: reduce duplication among mtd
 tests modules
From: Akinobu Mita <akinobu.mita@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Iwo Mergler <Iwo.Mergler@netcommwireless.com.au>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Vikram Narayanan <vikram186@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/8/6 Artem Bityutskiy <dedekind1@gmail.com>:
> On Sat, 2013-08-03 at 18:52 +0900, Akinobu Mita wrote:
>> This patch set reduces code duplication among mtd/tests modules by
>> moving common helper functions into mtd_test.c.
>>
>
> You could make this nicer by incorporating the error messages to the
> common handlers, and removing them from tests - they are almost the same
> everywhere.

Sounds good.  Especially incorporating the error messages to mtdtest_read()
and mtdtest_write() enables to convert some of remaining usages of
mtd_read() and mtd_write in the test modules.

> But this is anyway a good clean-up, so pushed to l2-mtd.git, thanks!

Thanks.
