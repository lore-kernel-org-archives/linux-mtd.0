Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MMdP3-0005V4-K7
	for linux-mtd@lists.infradead.org; Fri, 03 Jul 2009 07:42:09 +0000
Subject: Re: Compile Error: structure has no member named lowest_vol_num
From: Artem Bityutskiy <dedekind@infradead.org>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <8bd0f97a0907011815r644dd021mc394406ba913767a@mail.gmail.com>
References: <077E41CFFD002C4CAB7DFA4386A53264F5D7E7@DEMUEXC014.nsn-intra.net>
	<1246373088.20721.11.camel@localhost.localdomain>
	<8bd0f97a0907011815r644dd021mc394406ba913767a@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jul 2009 10:41:34 +0300
Message-Id: <1246606894.20721.32.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Biefel, Reiner \(NSN - DE/Munich\)" <reiner.biefel@nsn.com>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-07-01 at 21:15 -0400, Mike Frysinger wrote:
> barring that, here is the simple fix:
> --- a/ubi-utils/old-utils/Makefile
> +++ b/ubi-utils/old-utils/Makefile
> @@ -5,8 +5,8 @@
>  KERNELHDR := ../../include
> 
>  CFLAGS ?= -O2 -g -Werror
> -CPPFLAGS += -I./inc -I./src -I$(KERNELHDR) \
> -   -std=gnu99 -DPACKAGE_VERSION=\"1.0\"
> +CPPFLAGS := -I./inc -I./src -I$(KERNELHDR) \
> +   -std=gnu99 -DPACKAGE_VERSION=\"1.0\" $(CPPFLAGS)
> 
>  PERLPROGS = mkpfi ubicrc32.pl

Pushed this patch, thanks!

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
