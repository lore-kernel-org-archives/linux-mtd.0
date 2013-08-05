Received: from mail-oa0-x232.google.com ([2607:f8b0:4003:c02::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6Tnq-0004ho-Og
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2013 23:03:03 +0000
Received: by mail-oa0-f50.google.com with SMTP id i4so7806215oah.9
 for <linux-mtd@lists.infradead.org>; Mon, 05 Aug 2013 16:02:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1375707773.14869.452.camel@sauron.fi.intel.com>
References: <1374978118-11418-1-git-send-email-akinobu.mita@gmail.com>
 <1375707773.14869.452.camel@sauron.fi.intel.com>
Date: Tue, 6 Aug 2013 08:02:40 +0900
Message-ID: <CAC5umyh8_NuHi9OK2qy=b8SEwY0mXc_vGjkNug1JizJz8apUUA@mail.gmail.com>
Subject: Re: [PATCH 1/6] mtd: nandsim: convert pages_written[] to bitmap
From: Akinobu Mita <akinobu.mita@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/8/5 Artem Bityutskiy <dedekind1@gmail.com>:
> On Sun, 2013-07-28 at 11:21 +0900, Akinobu Mita wrote:
>> nandsim.pages_written[] is the array of unsigned char which is indexed
>> by the page number and used for identifying which pages have been written
>> when cache_file is used.  Each entry holds 0 (not written) or 1 (written),
>> so it can be converted to bitmap.  This reduces the allocation size of
>> pages_written[] by 1/8.
>
> Pushed all to l2-mtd.git, thanks.

Thanks.

> I wonder, what is your motivation for doing this? Did you just notice
> the imperfection and decided to fix it, or you really suffer from too
> much memory allocated?

I found all in this patch set when I was reading nandsim.c.  So I did
not suffer any real problems.
