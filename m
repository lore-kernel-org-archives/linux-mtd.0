Received: from mail-la0-x236.google.com ([2a00:1450:4010:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSMDQ-0004Ll-7m
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 09:32:56 +0000
Received: by laba3 with SMTP id a3so18971842lab.1
 for <linux-mtd@lists.infradead.org>; Thu, 20 Aug 2015 02:32:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55D43564.3060009@nod.at>
References: <CAHpGcM+bkFA-UDM0FKwH=FkS9+TWv_Br7nWJXSpKDquo5n_gFw@mail.gmail.com>
 <CAFLxGvxPGZoRX3Ft_g59fzfLhoOmEES=q-oPBmYuGVBzn-dRUA@mail.gmail.com>
 <55D3D6BB.3030307@huawei.com> <55D3DDD1.8060405@huawei.com>
 <55D42959.5070605@nod.at> <55D431E8.5040509@huawei.com>
 <55D43564.3060009@nod.at>
Date: Thu, 20 Aug 2015 11:32:34 +0200
Message-ID: <CAHpGcMKCfEnpR+fPUq3801cYV4c712i8HV53LwciMetUHdMgqA@mail.gmail.com>
Subject: Re: [kernel.org bug 103071] Dead "security.*" xattr code in ubifs
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Sheng Yong <shengyong1@huawei.com>, snijsure@grid-net.com,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 mkl@pengutronix.de, gratian.crisan@ni.com, brad.mouring@ni.com
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Richard,

2015-08-19 9:51 GMT+02:00 Richard Weinberger <richard@nod.at>:
> My concern is not that we don't need these xattr.
> I'm concerned about commit d7f0b70d30ffb9bbe6b8a3e1035cf0b79965ef53.
> Today it seems to be a no-op. Did it ever work?

The commit also initializes the security context of new inodes, so that part
likely works. It looks like the ubifs_ xattr inode operations will handle
"security.*" attributes just fine.

The "security.*" xattr handler was already dead code when introduced in that
commit, though. I've sent a patch to remove that.

Thanks,
Andreas
