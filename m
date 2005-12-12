Received: from fmr20.intel.com ([134.134.136.19] helo=orsfmr005.jf.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ElgxB-0001bk-MV
	for linux-mtd@lists.infradead.org; Mon, 12 Dec 2005 01:14:32 -0500
From: "zhao, forrest" <forrest.zhao@intel.com>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
In-Reply-To: <439C33D2.506@yandex.ru>
References: <439C33D2.506@yandex.ru>
Content-Type: text/plain
Date: Mon, 12 Dec 2005 14:07:55 +0800
Message-Id: <1134367675.3152.9.camel@localhost.localdomain>
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

On Sun, 2005-12-11 at 17:12 +0300, Artem B. Bityutskiy wrote:
> Zhao,
> 
> did JFFS2 work in your test in this case:
> 
> 1. flash_eraseall -j /dev/mtd0
> flash_eraseall is *old*, it puts cleanmarkers and is not EBH-aware.
> 
> 2. mount jffs2
> 3. copy any file to jffs2
> 4. unmount
> 5. mount
> 
> ?
> 

Yes, it can work. I have tested before checking in the patch.
In particular it handled the eraseblocks with cleanmarker by
the old way and cleanmarker is replaced by EBH after an erase
operation happened to an eraseblock.


Thanks,
Forrest
