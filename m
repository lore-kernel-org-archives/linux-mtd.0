Received: from mail-pb0-x236.google.com ([2607:f8b0:400e:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VabnX-0000PW-4P
 for linux-mtd@lists.infradead.org; Mon, 28 Oct 2013 01:39:16 +0000
Received: by mail-pb0-f54.google.com with SMTP id ro8so2365760pbb.27
 for <linux-mtd@lists.infradead.org>; Sun, 27 Oct 2013 18:38:52 -0700 (PDT)
MIME-Version: 1.0
Sender: f.fainelli@gmail.com
In-Reply-To: <1382782672.5901.25.camel@karhu.quadriga.com>
References: <mailman.6.1379692801.23497.linux-mtd@lists.infradead.org>
 <7c74c0d714e8e87daebbfd0163642d71@localhost>
 <1382782672.5901.25.camel@karhu.quadriga.com>
From: Florian Fainelli <florian@openwrt.org>
Date: Sun, 27 Oct 2013 18:38:12 -0700
Message-ID: <CAGVrzcY7RD0AFvkPLvoCSe5iFFtwXnLthVepJ=XrR4bhMPN6_A@mail.gmail.com>
Subject: Re: Patching mkfs.ubifs.c for running under Windows ?
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: gutemine <gutemine@oozoon.de>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

2013/10/26 Artem Bityutskiy <dedekind1@gmail.com>:
> On Sat, 2013-09-21 at 12:58 +0200, gutemine wrote:
>> As users of ubidump under Windows now asked me for getting also the
>> possibility to re-pack their extracted ubifs images, I'm considering to
>> patch mkfs.ubifs.c, so that it handles also the Windows hard and softlinks
>> and my dummy device files correctly.
>
> Generally, I am OK with making the code support windows, why not? But
> this should be done very nicely and should not be intrusive. I guess you
> should send patches and then we'll see.

We do have some patches in OpenWrt to make mtd-utils build and work
under FreeBSD and Cygwin here:

https://dev.openwrt.org/browser/trunk/tools/mtd-utils/patches

in particular:
https://dev.openwrt.org/browser/trunk/tools/mtd-utils/patches/110-portability.patch
https://dev.openwrt.org/browser/trunk/tools/mtd-utils/patches/120-cygwin_fixes.patch
https://dev.openwrt.org/browser/trunk/tools/mtd-utils/patches/134-freebsd_loff_t.patch

Not sure how acceptable they look like to you?
-- 
Florian
