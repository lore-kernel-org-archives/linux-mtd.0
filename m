Received: from mail-oa0-f49.google.com ([209.85.219.49])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uf1f3-0007NO-Af
 for linux-mtd@lists.infradead.org; Wed, 22 May 2013 05:32:30 +0000
Received: by mail-oa0-f49.google.com with SMTP id k14so1953846oag.36
 for <linux-mtd@lists.infradead.org>; Tue, 21 May 2013 22:32:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <519C40A8.1070506@huawei.com>
References: <1367743225-3484-1-git-send-email-libo.chen@huawei.com>
 <519C40A8.1070506@huawei.com>
Date: Wed, 22 May 2013 07:32:07 +0200
Message-ID: <CACna6rxaBGLVsMzckr5+XLgVoZAH0m-Hz73C6OmXay4vT+_fKA@mail.gmail.com>
Subject: Re: [PATCH RESEND] mtd: fix kfree bcm47xxsflash
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Libo Chen <clbchenlibo.chen@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Li Zefan <lizefan@huawei.com>, artem.bityutskiy@linux.intel.com,
 LKML <linux-kernel@vger.kernel.org>, wfp5p@virginia.edu,
 linux-mtd@lists.infradead.org, hauke@hauke-m.de,
 Andrew Morton <akpm@linux-foundation.org>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/5/22 Libo Chen <clbchenlibo.chen@huawei.com>:
> mtd is just member of bcm47xxsflash, so we should free bcm47xxsflash  not=
 its member.

Thanks!

--=20
Rafa=C5=82
