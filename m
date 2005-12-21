Received: from fmr20.intel.com ([134.134.136.19] helo=orsfmr005.jf.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EoxsN-00015J-Qg
	for linux-mtd@lists.infradead.org; Wed, 21 Dec 2005 01:55:10 -0500
From: "zhao, forrest" <forrest.zhao@intel.com>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
In-Reply-To: <43A6A105.9020407@yandex.ru>
References: <439C33D2.506@yandex.ru>
	<1134367675.3152.9.camel@localhost.localdomain>
	<439D5159.4030704@yandex.ru>
	<1134455209.7346.12.camel@localhost.localdomain>
	<43A6A105.9020407@yandex.ru>
Content-Type: text/plain
Date: Wed, 21 Dec 2005 14:49:12 +0800
Message-Id: <1135147753.28556.8.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: EBH question 1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> 
> > 2 ./patchkernel.sh -c -2 /usr/src/linux.2.6.12.2
> > 3 make; make modules_install
> > 4 modprobe mtdram
> > 5 cd util/; make
> > 6 ./flash_eraseall -j /dev/mtd0
> > Then kernel panic happened, seemed there's a bug
> > in mtd_char code.
> I've fixed this revently.
> 

Today I tried to build mtd latest CVS snapshot on kernel
2.6.15-rc5, but got the following error message:

WARNING: /lib/modules/2.6.15-rc5/kernel/drivers/mtd/mtdchar.ko
needs unknown symbol mtd_class_device_create

I grep the whole kernel source tree, but no other files
have the definition of mtd_class_device_create.

Did I miss something?

Thanks,
Forrest  
