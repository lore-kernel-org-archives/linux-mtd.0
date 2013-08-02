Received: from mail-oa0-x236.google.com ([2607:f8b0:4003:c02::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5HlM-000733-MW
 for linux-mtd@lists.infradead.org; Fri, 02 Aug 2013 15:59:33 +0000
Received: by mail-oa0-f54.google.com with SMTP id o6so1673934oag.41
 for <linux-mtd@lists.infradead.org>; Fri, 02 Aug 2013 08:59:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1375458364.14869.348.camel@sauron.fi.intel.com>
References: <1374978118-11418-1-git-send-email-akinobu.mita@gmail.com>
 <1375454326.14869.325.camel@sauron.fi.intel.com>
 <1375458364.14869.348.camel@sauron.fi.intel.com>
Date: Sat, 3 Aug 2013 00:59:09 +0900
Message-ID: <CAC5umyiX2j_hv29zy6C0k0mkp1KHqLuhTwVvNMmRFfS2jmqW+A@mail.gmail.com>
Subject: Re: [PATCH 1/6] mtd: nandsim: convert pages_written[] to bitmap
From: Akinobu Mita <akinobu.mita@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
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

2013/8/3 Artem Bityutskiy <dedekind1@gmail.com>:
> On Fri, 2013-08-02 at 17:38 +0300, Artem Bityutskiy wrote:
>> On Sun, 2013-07-28 at 11:21 +0900, Akinobu Mita wrote:
>> > nandsim.pages_written[] is the array of unsigned char which is indexed
>> > by the page number and used for identifying which pages have been written
>> > when cache_file is used.  Each entry holds 0 (not written) or 1 (written),
>> > so it can be converted to bitmap.  This reduces the allocation size of
>> > pages_written[] by 1/8.
>>
>> Did you test this patch-set, if yes, how?
>
> Note, I am asking because this is an ancient and probably poor piece of
> code, but quite important, so I am just trying to understand whether I
> should test your patches before applying, and if yes, how.

I tested this with mtd/tests modules and mounting a filesystem through
mtdblock.  I also tried cache_file module parameter to test patch 1/6
because nandsim.pages_written[] is only used when cache_file is used.
Also I tried second_id_byte module parameter to check both 8-bit and
16-bit bus width are working.
