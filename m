Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A15C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Oct 2022 09:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vGm30rKWwX6aOQs0SddRm5UEOesMbUbYsv3jruvqb9w=; b=4Qr/UpP9QRASU4
	FrtXMo8We+cDmlAkfTPTlN2F8bvcSbeK4HdOyqX1K5EYpBf5MxryIHAUR+zG12cGA/ezqagvYzQvM
	uSpWe7K8PqNzZO62ZZv2ApN9uNXCg/yI247Vc4HVlpLfzf70T75r7HwMeHdzsw30G2dIH1GkWArgn
	DiVg4NHRZQq7suwtmRQKvKJg6xr4F7ESrFsW6MwEwnbWUZ+eJX3r7d5Gc8LBH6t0oDwcfDSHCv6Wq
	nBNhZKAZlySHPKbBs1QOUShS7GiiQDsPnzvS5We8pX8/ZW7C2Ue0RaWVQUY26/DDsBV7s5xTvHcWx
	utclidLLBUugf5CoDuBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogjRn-008FR0-HY; Fri, 07 Oct 2022 09:15:11 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogjRk-008FLT-1p
	for linux-mtd@lists.infradead.org; Fri, 07 Oct 2022 09:15:10 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-165-SM2il4aTNXS-NQtWmWJl3A-1; Fri, 07 Oct 2022 10:14:58 +0100
X-MC-Unique: SM2il4aTNXS-NQtWmWJl3A-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Fri, 7 Oct
 2022 10:14:54 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.040; Fri, 7 Oct 2022 10:14:54 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christophe Leroy' <christophe.leroy@csgroup.eu>, "Jason A. Donenfeld"
	<Jason@zx2c4.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>, Andreas Noever
	<andreas.noever@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, Borislav Petkov
	<bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
	=?utf-8?B?Q2hyaXN0b3BoIELDtmhtd2FsZGVy?= <christoph.boehmwalder@linbit.com>,
	Christoph Hellwig <hch@lst.de>, Daniel Borkmann <daniel@iogearbox.net>, "Dave
 Airlie" <airlied@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Florian Westphal <fw@strlen.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "H . Peter Anvin" <hpa@zytor.com>, "Heiko
 Carstens" <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Herbert Xu
	<herbert@gondor.apana.org.au>, Huacai Chen <chenhuacai@kernel.org>, "Hugh
 Dickins" <hughd@google.com>, Jakub Kicinski <kuba@kernel.org>, "James E . J .
 Bottomley" <jejb@linux.ibm.com>, Jan Kara <jack@suse.com>, Jason Gunthorpe
	<jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>, Johannes Berg
	<johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>, "Jozsef
 Kadlecsik" <kadlec@netfilter.org>, KP Singh <kpsingh@kernel.org>, Kees Cook
	<keescook@chromium.org>, Marco Elver <elver@google.com>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, "Pablo
 Neira Ayuso" <pablo@netfilter.org>, Paolo Abeni <pabeni@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Richard Weinberger <richard@nod.at>,
	"Russell King" <linux@armlinux.org.uk>, Theodore Ts'o <tytso@mit.edu>,
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>, Thomas Gleixner
	<tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>, Ulf Hansson
	<ulf.hansson@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, WANG Xuerui
	<kernel@xen0n.name>, Will Deacon <will@kernel.org>, Yury Norov
	<yury.norov@gmail.com>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "kasan-dev@googlegroups.com"
	<kasan-dev@googlegroups.com>, "kernel-janitors@vger.kernel.org"
	<kernel-janitors@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-fsdevel@vger.kernel.org"
	<linux-fsdevel@vger.kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "x86@kernel.org"
	<x86@kernel.org>, =?utf-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?=
	<toke@toke.dk>, Chuck Lever <chuck.lever@oracle.com>, Jan Kara <jack@suse.cz>
Subject: RE: [PATCH v3 3/5] treewide: use get_random_u32() when possible
Thread-Topic: [PATCH v3 3/5] treewide: use get_random_u32() when possible
Thread-Index: AQHY2asa0LDp17FxT0u8eu+L+6kCF64CocNw
Date: Fri, 7 Oct 2022 09:14:54 +0000
Message-ID: <e0c127f9e80146c19fab9f987bb2f588@AcuMS.aculab.com>
References: <20221006165346.73159-1-Jason@zx2c4.com>
 <20221006165346.73159-4-Jason@zx2c4.com>
 <848ed24c-13ef-6c38-fd13-639b33809194@csgroup.eu>
 <CAHmME9raQ4E00r9r8NyWJ17iSXE_KniTG0onCNAfMmfcGar1eg@mail.gmail.com>
 <f10fcfbf-2da6-cf2d-6027-fbf8b52803e9@csgroup.eu>
 <6396875c-146a-acf5-dd9e-7f93ba1b4bc3@csgroup.eu>
In-Reply-To: <6396875c-146a-acf5-dd9e-7f93ba1b4bc3@csgroup.eu>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_021508_385501_075AD468 
X-CRM114-Status: GOOD (  13.84  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Christophe Leroy
> Sent: 06 October 2022 18:43
...
> But taking into account that sp must remain 16 bytes aligned, would it
> be better to do something like ?
> 
> 	sp -= prandom_u32_max(PAGE_SIZE >> 4) << 4;

That makes me think...
If prandom_u32_max() is passed a (constant) power of 2 it doesn't
need to do the multiply, it can just do a shift right.

Doesn't it also always get a 32bit random value?
So actually get_random_u32() & PAGE_MASK & ~0xf is faster!

When PAGE_SIZE is 4k, PAGE_SIZE >> 4 is 256 so it could use:
	get_ramdom_u8() << 4

You also seem to have removed prandom_u32() in favour of
get_random_u32() but have added more prandom_xxxx() functions.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
