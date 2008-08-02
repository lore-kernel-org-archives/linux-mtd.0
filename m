Received: from an-out-0708.google.com ([209.85.132.242])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KPQhp-0005fB-HF
	for linux-mtd@lists.infradead.org; Sat, 02 Aug 2008 23:40:13 +0000
Received: by an-out-0708.google.com with SMTP id c24so248691ana.99
	for <linux-mtd@lists.infradead.org>;
	Sat, 02 Aug 2008 16:40:12 -0700 (PDT)
Message-ID: <a4423d670808021640he3ec660k1b5ddfcb6efd1ae5@mail.gmail.com>
Date: Sun, 3 Aug 2008 03:40:12 +0400
From: "Alexander Beregalov" <a.beregalov@gmail.com>
To: "Adrian Bunk" <bunk@kernel.org>
Subject: Re: [PATCH] drivers/mtd/mtdsuper.c: fix build error
In-Reply-To: <20080802233240.GA4385@cs181140183.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080802225304.GD4856@orion>
	<20080802233240.GA4385@cs181140183.pp.htv.fi>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, viro@zeniv.linux.org.uk,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008/8/3 Adrian Bunk <bunk@kernel.org>:
> On Sun, Aug 03, 2008 at 02:53:04AM +0400, Alexander Beregalov wrote:
>> From: Alexander Beregalov <a.beregalov@gmail.com>
>>
>> drivers/mtd/mtdsuper.c: fix build error
>>
>> drivers/mtd/mtdsuper.c:184: error: implicit declaration of
>>       function 'lookup_bdev'
>> drivers/mtd/mtdsuper.c:197: error: implicit declaration of
>>       function 'bdput'
>
>
> It already gets fs.h indirectly through linux/mtd/super.h, so while
> your patch might be correct it cannot fix a compile error.
>
> If that's with CONFIG_BLOCK=n then it's
>  http://bugzilla.kernel.org/show_bug.cgi?id=11225
>
> Otherwise please send your .config .

I do not have this config, I collect log from builds with randconfig
and try to fix problems.
It seems it is the same bug.
