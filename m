Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M2Lm7-0002qv-GA
	for linux-mtd@lists.infradead.org; Fri, 08 May 2009 08:49:59 +0000
Subject: Re: [PATCH 1/2] mkfs.ubifs: UBI I/O Library
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentincj@iksaif.net>
In-Reply-To: <1241691709-17624-2-git-send-email-corentincj@iksaif.net>
References: <1241691709-17624-1-git-send-email-corentincj@iksaif.net>
	<1241691709-17624-2-git-send-email-corentincj@iksaif.net>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 08 May 2009 11:49:23 +0300
Message-Id: <1241772563.27996.81.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, vapier.adi@gmail.com
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

thanks for patches. Could you please avoid synchronizing 
include/mtd/ubi-user.h for now? There is nothing new there
except of this insane s/int32_t/__s32/ type change, right?

On Thu, 2009-05-07 at 12:21 +0200, Corentin Chary wrote:
>  include/mtd/ubi-user.h    |   72 ++--
>  include/ubi.h             |  192 +++++++++
>  mkfs.ubifs/libubiio.c     |  936 +++++++++++++++++++++++++++++++++++++++++++++
>  mkfs.ubifs/libubiio.h     |   47 +++
>  mkfs.ubifs/libubiio_int.h |  187 +++++++++
>  5 files changed, 1399 insertions(+), 35 deletions(-)
>  create mode 100644 include/ubi.h
>  create mode 100644 mkfs.ubifs/libubiio.c
>  create mode 100644 mkfs.ubifs/libubiio.h
>  create mode 100644 mkfs.ubifs/libubiio_int.h

What is the point of making a second copy of libubi?
AFAICS, libubio is libubi + other stuff, right?
Why not to just improve libubi instead of having yet
another copy? How much sense does it make?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
