Received: from mail-oa0-x236.google.com ([2607:f8b0:4003:c02::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VFvt0-0004ZK-Hr
 for linux-mtd@lists.infradead.org; Sun, 01 Sep 2013 00:51:27 +0000
Received: by mail-oa0-f54.google.com with SMTP id n10so2977043oag.41
 for <linux-mtd@lists.infradead.org>; Sat, 31 Aug 2013 17:51:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1377883043.22372.72.camel@shinybook.infradead.org>
References: <1375523536-32671-1-git-send-email-akinobu.mita@gmail.com>
 <1375523536-32671-3-git-send-email-akinobu.mita@gmail.com>
 <1377878039.22372.55.camel@shinybook.infradead.org>
 <5220C733.7090401@gmail.com>
 <1377883043.22372.72.camel@shinybook.infradead.org>
Date: Sun, 1 Sep 2013 09:51:03 +0900
Message-ID: <CAC5umyg026AJbkEo5Ckb6PdaWJzqnsQghv_Wb2q47MVGnK0EdA@mail.gmail.com>
Subject: Re: [PATCH -next v2 02/10] mtd: tests: rename sources in order to
 link a helper object
From: Akinobu Mita <akinobu.mita@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Vikram Narayanan <vikram186@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/8/31 David Woodhouse <dwmw2@infradead.org>:
> On Fri, 2013-08-30 at 09:24 -0700, Brian Norris wrote:
>> We actually had the discussion (in multiple threads?) that because a
>> separate module would complicate the process for running the test
>> modules, it is preferable to copy the small helper code into each
>> module. That is, we don't want to do this:
>>
>> insmod mtd_test.ko
>> insmod mtd_<actualtest>.ko dev=X ...
>
> So use modprobe instead :)
>
>> However, this is still fairly trivial, so if you think there are good
>> reasons to provide separate modules, I do not object to separate modules.
>
> Even if you can't use modprobe, once mtd_test.ko is loaded it's going to
> stay loaded and you can just forget about it and do your various tests.
>
> Unless you're actually making changes to the code within mtd_test.ko
> itself, of course. In which case you really *don't* want to have eight
> different copies of it built in to eight different modules. I know that
> making changes to that code is going to be relatively infrequent, but we
> probably shouldn't make it suck *this* much :)

Brian, even if we have a separate mtd_test.ko module and we want to
run a custom mtd test module which may also make some changes within
mtd_test.c, we can just build it as we currently do by adding the
following lines in Makefile.

        obj-$(CONFIG_MTD_TESTS) += mtd_mytest.o
        mtd_mytest-objs := mytest.o mtd_test.o

You need to ignore the warnings like "'mtdtest_write' exported twice",
but you can install a custom test module without the extra step of
inserting another module as far as you don't insert mtd_test.ko.

So I'm going to prepare the patch that makes it a separate module.
