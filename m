Received: from an-out-0708.google.com ([209.85.132.248])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KPYXD-0000ee-8Q
	for linux-mtd@lists.infradead.org; Sun, 03 Aug 2008 08:01:48 +0000
Received: by an-out-0708.google.com with SMTP id c24so258129ana.99
	for <linux-mtd@lists.infradead.org>;
	Sun, 03 Aug 2008 01:01:46 -0700 (PDT)
Message-ID: <a4423d670808030101n12b45272w383355b18004815d@mail.gmail.com>
Date: Sun, 3 Aug 2008 12:01:46 +0400
From: "Alexander Beregalov" <a.beregalov@gmail.com>
To: "Adrian Bunk" <bunk@kernel.org>
Subject: Re: [PATCH] drivers/mtd/mtdsuper.c: fix build error
In-Reply-To: <a4423d670808021652o28607891g12ca137858109449@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080802225304.GD4856@orion>
	<20080802233240.GA4385@cs181140183.pp.htv.fi>
	<a4423d670808021640he3ec660k1b5ddfcb6efd1ae5@mail.gmail.com>
	<20080802234535.GA8929@cs181140183.pp.htv.fi>
	<a4423d670808021652o28607891g12ca137858109449@mail.gmail.com>
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

2008/8/3 Alexander Beregalov <a.beregalov@gmail.com>:
> 2008/8/3 Adrian Bunk <bunk@kernel.org>:
>> You must store the config of the failed builds somewhere, since
>> otherwise (like in this case) you cannot verify whether a patch
>> actually fixes a problem.
> Right, I have changed this script.
>
Yes, it is CONFIG_BLOCK=n.

Thanks.
