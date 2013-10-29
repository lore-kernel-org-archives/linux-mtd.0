Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbB6R-0003aa-Nq
 for linux-mtd@lists.infradead.org; Tue, 29 Oct 2013 15:21:08 +0000
Message-ID: <1383060043.29619.54.camel@sauron.fi.intel.com>
Subject: Re: Patching mkfs.ubifs.c for running under Windows ?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 29 Oct 2013 17:20:43 +0200
In-Reply-To: <CAFLxGvyt2w31v7v1cmvKBE6=hLkY1G-v31srsoQz82ktxg7SAg@mail.gmail.com>
References: <mailman.6.1379692801.23497.linux-mtd@lists.infradead.org>
 <7c74c0d714e8e87daebbfd0163642d71@localhost>
 <1382782672.5901.25.camel@karhu.quadriga.com>
 <CAGVrzcY7RD0AFvkPLvoCSe5iFFtwXnLthVepJ=XrR4bhMPN6_A@mail.gmail.com>
 <CAFLxGvyt2w31v7v1cmvKBE6=hLkY1G-v31srsoQz82ktxg7SAg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: gutemine <gutemine@oozoon.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Florian Fainelli <florian@openwrt.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-10-28 at 11:47 +0100, Richard Weinberger wrote:
> > https://dev.openwrt.org/browser/trunk/tools/mtd-utils/patches
> >
> > in particular:
> > https://dev.openwrt.org/browser/trunk/tools/mtd-utils/patches/110-portability.patch
> > https://dev.openwrt.org/browser/trunk/tools/mtd-utils/patches/120-cygwin_fixes.patch
> > https://dev.openwrt.org/browser/trunk/tools/mtd-utils/patches/134-freebsd_loff_t.patch
> >
> > Not sure how acceptable they look like to you?
> 
> Looks not that bad. :-)
> But why do you need the file "include/cygwin/bits-byteswap.h"?
> 
> Artem, what do you think?
> IMHO adding cygwin support is less intrusive than adding native win32 support.

I would clean-up these patches even more, and split them further. But
yes, it looks like these could be turned into something not so intrusive
and maintainable and be merged if MTD users need them.

-- 
Best Regards,
Artem Bityutskiy
