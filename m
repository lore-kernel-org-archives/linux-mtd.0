Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qucsx-0007P0-2Z
	for linux-mtd@lists.infradead.org; Sat, 20 Aug 2011 04:10:15 +0000
Received: by bke17 with SMTP id 17so3266742bke.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Aug 2011 21:10:12 -0700 (PDT)
Subject: Re: [PATCH] Increase PEB size limit to 2MiB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Viktar Palstsiuk <viktar.palstsiuk@promwad.com>
Date: Sat, 20 Aug 2011 07:10:08 +0300
In-Reply-To: <1313486854-7917-1-git-send-email-viktar.palstsiuk@promwad.com>
References: <1313486854-7917-1-git-send-email-viktar.palstsiuk@promwad.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1313813410.4475.12.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-08-16 at 12:27 +0300, Viktar Palstsiuk wrote:
> ---
>  include/mtd/ubi-media.h  |    3 +++
>  mkfs.ubifs/mkfs.ubifs.c  |    2 +-
>  mkfs.ubifs/ubifs-media.h |    3 +++
>  ubi-utils/ubinize.c      |    2 +-
>  4 files changed, 8 insertions(+), 2 deletions(-)

I've amended the patch and pushed.

I moved the declarations to other header files because this limitation
is not a fundamental UBIFS limitation, this is just a sanity check. So
the macros should not live in '*-media.h' because they are not related
to the media format.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
