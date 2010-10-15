Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P6fw4-00026H-Cp
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2010 08:46:45 +0000
Received: by gyf1 with SMTP id 1so242335gyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Oct 2010 01:46:43 -0700 (PDT)
Subject: Re: Latest mkfs.jffs2 is broken.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Peter Korsgaard <jacmet@sunsite.dk>
In-Reply-To: <87pqvbetux.fsf@macbook.be.48ers.dk>
References: <0D753D10438DA54287A00B02708426976450C42B27@AUSP01VMBX24.collaborationhost.net>
	<1287123245.18576.2.camel@localhost>
	<87pqvbetux.fsf@macbook.be.48ers.dk>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 15 Oct 2010 11:43:38 +0300
Message-ID: <1287132218.18576.12.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: H Hartley Sweeten <hartleys@visionengravers.com>,
	linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-10-15 at 10:35 +0200, Peter Korsgaard wrote:
> commit b864c387e8f16273aad1453d6457d847e29c3d25
> Author: Mike Frysinger <vapier@gentoo.org>
> Date:   Wed Sep 22 22:32:56 2010 -0400
> 
>     mtd-utils: clean up zlib.h usage a bit
>     
>     Hide zlib's crc32 in compr_zlib.c and mkfs.ubifs/compr.c.
>     
>     jffs2reader.c and mkfs.jffs2.c don't actually use zlib, so punt the
>     include from the file.
>     
>     mkfs.jffs2.c is implicitly using crc32 from zlib.h instead of the
>     local mtd_crc32, so fix the local usage.  otherwise we get warnings
>     about undefined crc32 because the file was redirecting the prototype.
>     
>     Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>     Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> 
> Hartley, that commit applies OK to 1.4.0, could you give it a try?
> 
> Artem: Time for a v1.4.1 release?

Thanks. If it works, I'll back-port Mike's patch to 1.4.0 and tag it as
1.4.1. So 1.4.1 won't include tons of irrelevant commits.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
