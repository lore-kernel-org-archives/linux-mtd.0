Received: from mail-ob0-x232.google.com ([2607:f8b0:4003:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UiKDb-00023i-B9
 for linux-mtd@lists.infradead.org; Fri, 31 May 2013 07:57:48 +0000
Received: by mail-ob0-f178.google.com with SMTP id fb19so2442946obc.9
 for <linux-mtd@lists.infradead.org>; Fri, 31 May 2013 00:57:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <51A6B7D4.7040202@huawei.com>
References: <51A6B7D4.7040202@huawei.com>
Date: Fri, 31 May 2013 09:57:25 +0200
Message-ID: <CACna6rwz8fx_wBoNe2bko+Rtoq2xpfAGgCKZDFy4iBqGQuSbkg@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] mtd: bcm47: convert kzalloc to avoid invalid
 access
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Libo Chen <clbchenlibo.chen@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Li Zefan <lizefan@huawei.com>, artem.bityutskiy@linux.intel.com,
 LKML <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bill Pemberton <wfp5p@virginia.edu>, linux-mtd@lists.infradead.org,
 hauke@hauke-m.de, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/5/30 Libo Chen <clbchenlibo.chen@huawei.com>:
> mtd is just member of bcm47xxsflash, so we should free bcm47xxsflash not =
its member.
> So I use devm_kazlloc instead of kazlloc to avoid it.

I think you should use
mtd: bcm47xxsflash:
prefix for both patches, but Artem or David may want to comment on that.

Nice trick with that devm_kzalloc, I didn't know it.

--=20
Rafa=C5=82
