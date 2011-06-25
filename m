Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QaM6G-00064X-0Q
	for linux-mtd@lists.infradead.org; Sat, 25 Jun 2011 06:12:12 +0000
Received: by bwf12 with SMTP id 12so514708bwf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2011 23:12:10 -0700 (PDT)
Subject: Re: [PATCH] punt redundant libcrc32
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Date: Sat, 25 Jun 2011 09:12:03 +0300
In-Reply-To: <1308977857-3220-1-git-send-email-vapier@gentoo.org>
References: <1308977857-3220-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1308982328.23868.1.camel@koala>
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

On Sat, 2011-06-25 at 00:57 -0400, Mike Frysinger wrote:
> The libcrc32.a is only used in one place: mkfs.ubifs.  But this also
> uses libmtd.a, and the only file in libcrc32.a is also in libmtd.a.
> So libcrc32.a itself is completely redundant.  Punt!
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed, thank you!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
