Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OBl3m-0003Pp-D8
	for linux-mtd@lists.infradead.org; Tue, 11 May 2010 08:43:27 +0000
Received: by fxm17 with SMTP id 17so3208534fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 11 May 2010 01:43:24 -0700 (PDT)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <1272520655.7750.74.camel@localhost>
References: <20100424155751.14723.46761.stgit@shiryu.yomgui.biz>
	<20100424155812.14723.66554.stgit@shiryu.yomgui.biz>
	<1272520655.7750.74.camel@localhost>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Tue, 11 May 2010 10:43:04 +0200
Message-ID: <q2gb8e9195f1005110143jb8d0d5b1v3eb92b595183e703@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] [MTD] remove bogus warning about missing boot bank
	location
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>, Chris Moore <moore@free.fr>,
	Wolfram Sang <w.sang@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.

2010/4/29 Artem Bityutskiy <dedekind1@gmail.com>:
> Pushed this v5 series to l2-mtd-2.6 / dunno. But please, if you re-send
> the series, use consistent "mtd: cfi_cmdset_0002:" prefix for this
> patch. Then I will be able to do git-am without manual work. Now I have
> to tweak this patch because git am removes [MTD].

David, could you please pick this series and push it to mtd-2.6.git
before the merge window ?
Thanks.


-- 
Guillaume LECERF
GeeXboX developer - www.geexbox.org
