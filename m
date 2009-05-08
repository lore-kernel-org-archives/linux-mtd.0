Received: from wf-out-1314.google.com ([209.85.200.172])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M2RXj-0004w6-KB
	for linux-mtd@lists.infradead.org; Fri, 08 May 2009 14:59:26 +0000
Received: by wf-out-1314.google.com with SMTP id 23so1203729wfg.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 May 2009 07:59:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1241792079.27996.107.camel@localhost.localdomain>
References: <1241691709-17624-1-git-send-email-corentincj@iksaif.net>
	<1241691709-17624-2-git-send-email-corentincj@iksaif.net>
	<1241772563.27996.81.camel@localhost.localdomain>
	<71cd59b00905080507j17bceecu3c5f2728e084bde7@mail.gmail.com>
	<1241785222.27996.85.camel@localhost.localdomain>
	<1241792079.27996.107.camel@localhost.localdomain>
Date: Fri, 8 May 2009 16:59:18 +0200
Message-ID: <71cd59b00905080759o66e8da5awaa0afd76e2064ef8@mail.gmail.com>
Subject: Re: [PATCH 1/2] mkfs.ubifs: UBI I/O Library
From: Corentin Chary <corentin.chary@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, vapier.adi@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 8, 2009 at 4:14 PM, Artem Bityutskiy <dedekind@infradead.org> wrote:
> In fact, I already have simple implementation of setprop/unmap
> functions which I use in the ubi tests.
>
> I've just pushed them. There are some other patches as well.
> But the main change - mtd sysfs support is not pushed - but
> I'll do it very soon. After this the change rate will become
> low again.
>
> Some of my changes are not very good, in a sense that they do
> not fix one small thing, but contain several things. But this
> is mostly because I was accustomed to be the only ubi-utils
> developer. If you are going to work with the code base, I
> will be more careful.

I'll see what I can do to use libubi the way I want.
The problem of using libubi in mkfs is not the includes (we can copy
the headers in /include or add -I../ubi-utils/include).
The main problem is that ubi-utils/Makefile make a libubi.a but
mkfs.ubifs/Makefile have no way to use it (we could add
../ubi-utils/src/libubi.c to the sources, but it's ugly).
I think it's why there is 3 crc32.c in mtd-utils ...
As I'm working on my free time I don't have the time to try to make it
works with the current buildsystem.
Mike, have you got any suggestion ?
Maybe moving to autotools instead of CMake could help us ?

Thanks

-- 
Corentin Chary
http://xf.iksaif.net
