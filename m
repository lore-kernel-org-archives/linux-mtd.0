Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OtLs6-00081U-9C
	for linux-mtd@lists.infradead.org; Wed, 08 Sep 2010 14:43:34 +0000
Received: by bwz13 with SMTP id 13so191276bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Sep 2010 07:43:32 -0700 (PDT)
Subject: Re: Cannot rmmod after call to add_mtd_blktrans_dev
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
In-Reply-To: <20100908122039.GA25005@angel.research.nokia.com>
References: <20100908122039.GA25005@angel.research.nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Sep 2010 17:43:27 +0300
Message-ID: <1283957007.7935.0.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <david.woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-09-08 at 15:20 +0300, Jarkko Lavinen wrote: 
> I am working with mtdswap driver which uses
> add_mtd_blktrans_dev().  Once I call add_mtd_blktrans_dev() the
> driver module reference count is 1 and I cannot remove the
> module.
> 
> Before commit 048d871 (mtd: blktrans: Hotplug fixes) the module
> ref count was 0 after loading. Ref count was increased only when
> thedevice was opened and it was possible to remove the module if
> none was using it.
> 
> After the 048d871 it doesn't seem to be possible to remove
> drivers which use add_mtd_blktrans_dev().  Many drivers similar
> to ftl have ftl_remove_dev() which calls del_mtd_blktrans_dev()
> that would put the module but cannot be called unless the ref
> count is already 0.
> 
> Jarkko Lavinen

My fault, I take a good look at how to fix that differently.
Best regards,
Maxim Levitsky
