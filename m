Received: from mail-ve0-f173.google.com ([209.85.128.173])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VakM7-0001V3-NL
 for linux-mtd@lists.infradead.org; Mon, 28 Oct 2013 10:47:32 +0000
Received: by mail-ve0-f173.google.com with SMTP id jw12so4799676veb.4
 for <linux-mtd@lists.infradead.org>; Mon, 28 Oct 2013 03:47:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGVrzcY7RD0AFvkPLvoCSe5iFFtwXnLthVepJ=XrR4bhMPN6_A@mail.gmail.com>
References: <mailman.6.1379692801.23497.linux-mtd@lists.infradead.org>
 <7c74c0d714e8e87daebbfd0163642d71@localhost>
 <1382782672.5901.25.camel@karhu.quadriga.com>
 <CAGVrzcY7RD0AFvkPLvoCSe5iFFtwXnLthVepJ=XrR4bhMPN6_A@mail.gmail.com>
Date: Mon, 28 Oct 2013 11:47:06 +0100
Message-ID: <CAFLxGvyt2w31v7v1cmvKBE6=hLkY1G-v31srsoQz82ktxg7SAg@mail.gmail.com>
Subject: Re: Patching mkfs.ubifs.c for running under Windows ?
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Florian Fainelli <florian@openwrt.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: gutemine <gutemine@oozoon.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 28, 2013 at 2:38 AM, Florian Fainelli <florian@openwrt.org> wrote:
> Hello,
>
> 2013/10/26 Artem Bityutskiy <dedekind1@gmail.com>:
>> On Sat, 2013-09-21 at 12:58 +0200, gutemine wrote:
>>> As users of ubidump under Windows now asked me for getting also the
>>> possibility to re-pack their extracted ubifs images, I'm considering to
>>> patch mkfs.ubifs.c, so that it handles also the Windows hard and softlinks
>>> and my dummy device files correctly.
>>
>> Generally, I am OK with making the code support windows, why not? But
>> this should be done very nicely and should not be intrusive. I guess you
>> should send patches and then we'll see.
>
> We do have some patches in OpenWrt to make mtd-utils build and work
> under FreeBSD and Cygwin here:
>
> https://dev.openwrt.org/browser/trunk/tools/mtd-utils/patches
>
> in particular:
> https://dev.openwrt.org/browser/trunk/tools/mtd-utils/patches/110-portability.patch
> https://dev.openwrt.org/browser/trunk/tools/mtd-utils/patches/120-cygwin_fixes.patch
> https://dev.openwrt.org/browser/trunk/tools/mtd-utils/patches/134-freebsd_loff_t.patch
>
> Not sure how acceptable they look like to you?

Looks not that bad. :-)
But why do you need the file "include/cygwin/bits-byteswap.h"?

Artem, what do you think?
IMHO adding cygwin support is less intrusive than adding native win32 support.

-- 
Thanks,
//richard
