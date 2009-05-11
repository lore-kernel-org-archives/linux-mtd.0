Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M3WVn-0006vV-Lv
	for linux-mtd@lists.infradead.org; Mon, 11 May 2009 14:30:04 +0000
Subject: Re: [PATCH 0/3] libubi / mkfs.ubifs #2
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentincj@iksaif.net>
In-Reply-To: <1241862068-10596-1-git-send-email-corentincj@iksaif.net>
References: <1241862068-10596-1-git-send-email-corentincj@iksaif.net>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 11 May 2009 17:29:37 +0300
Message-Id: <1242052177.27996.139.camel@localhost.localdomain>
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

On Sat, 2009-05-09 at 11:41 +0200, Corentin Chary wrote:
> These patchs will allow mkfs.ubifs to write the image directly
> on an UBI volume. This time libubi is used. I couldn't manage to
> make the Makefile works correctly, even with Mike trick for dependencies.
> Mike, could you help me on that ?
> You can still make it compile with "cd ubi-utils; make; cd ../mkfs.ubifs; make"

Just pushed the first 2 of your patches. Also, there is
a similar problem in libmtd - I've fixed that too. And
I walked through all memset calls and amended/fixed them
as well.

Thanks. Will look at the third patch later.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
