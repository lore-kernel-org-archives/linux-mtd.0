Received: from mail-ie0-x234.google.com ([2607:f8b0:4001:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBoE9-0004FT-CZ
 for linux-mtd@lists.infradead.org; Thu, 15 Jan 2015 17:29:02 +0000
Received: by mail-ie0-f180.google.com with SMTP id rp18so16110688iec.11
 for <linux-mtd@lists.infradead.org>; Thu, 15 Jan 2015 09:28:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20150114191907.GX9759@ld-irv-0074>
References: <1421206498-28826-1-git-send-email-dehrenberg@chromium.org>
 <alpine.DEB.2.02.1501140846310.27318@lnxricardw1.se.axis.com>
 <CAAK6Zt29rv0CSC42BbpULP=rwzSGUWcxBC=ewg5aX03JoCjzCg@mail.gmail.com>
 <20150114191907.GX9759@ld-irv-0074>
Date: Thu, 15 Jan 2015 09:28:38 -0800
Message-ID: <CAAK6Zt3suTh9=GpYP8CYooqOsq6xFnLOUAPk=o4N2dnL7P-sgg@mail.gmail.com>
Subject: Re: [PATCH] mtd: Add config option to skip scanning bad blocks in
 partitions
From: Daniel Ehrenberg <dehrenberg@google.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "grundler@chromium.org" <grundler@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "gwendal@chromium.org" <gwendal@chromium.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 "ezequiel@vanguardiasur.com.ar" <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 14, 2015 at 11:19 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Wed, Jan 14, 2015 at 10:08:51AM -0800, Daniel Ehrenberg wrote:
>> To initialize the partitions, it takes me 3.5s with this config option
>> turned on and .2s with the config option turned off. So a large
>> proportion of the NAND startup time (not counting ubi coming up) is
>> comes from this bad block scan. It takes about 1.87s to scan over the
>> device, and I have my partitioning set up so there's an extra
>> partition covering the whole device in addition to the individual
>> partitions.
>
> Why don't you have BBT enabled? Even if it's just in-memory (not
> on-flash), you should only have to scan the entire flash once (not once
> for each partition), after which every subsequent lookup should only be
> a memory access. That'd cut your time in half already, I expect. But if
> you use the on-flash BBT (NAND_BBT_USE_FLASH), then you should only have
> to scan the flash once per flash lifetime, after which the bad block
> information will be stored in just a few pages, and should take only a
> millisecond or two to read.
>
> (There are other reasons for using on-flash BBT, but I won't detail them
> here.)
>
> I also recall the bad block scanning process will read not just the
> spare area, but actually the full 1st page. So that might cause a little
> unnecessary slowness.
>
> All in all, I think it's highly unlikely that your patch is necessary.
> There are much better ways to get you a faster boot time.
>
> Brian

Thanks for the suggestions. I'm new and I definitely want to do things
the right way, if there's a better way that doesn't need all these
modifications.

I'm using UBI, so I thought an on-device BBT is redundant and would be
ignored by UBI. Also, I couldn't figure out how I'm supposed to to
enable it--the out-of-tree driver I'm using isn't really based on
nand_base.c; correct me if I'm wrong, but it looks like that's a
requirement for using the nand_bbt code. Cutting my time in half
wouldn't be all that great since that's still almost 2 seconds of
useless work.

Where can I read about the other advantages of on-flash BBT when using
UBI? Maybe I can use this technique for other devices I'm working on
where nand_bbt could be used.

Thanks,
Dan
