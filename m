Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ox6g1-0008Qk-Qa
	for linux-mtd@lists.infradead.org; Sat, 18 Sep 2010 23:18:42 +0000
Received: by fxm4 with SMTP id 4so198404fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 18 Sep 2010 16:17:48 -0700 (PDT)
Subject: Re: Cannot rmmod after call to add_mtd_blktrans_dev
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
In-Reply-To: <1283957007.7935.0.camel@maxim-laptop>
References: <20100908122039.GA25005@angel.research.nokia.com>
	<1283957007.7935.0.camel@maxim-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 19 Sep 2010 01:17:42 +0200
Message-ID: <1284851862.28101.2.camel@maxim-laptop>
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

On Wed, 2010-09-08 at 17:43 +0300, Maxim Levitsky wrote: 
> On Wed, 2010-09-08 at 15:20 +0300, Jarkko Lavinen wrote: 
> > I am working with mtdswap driver which uses
> > add_mtd_blktrans_dev().  Once I call add_mtd_blktrans_dev() the
> > driver module reference count is 1 and I cannot remove the
> > module.
> > 
> > Before commit 048d871 (mtd: blktrans: Hotplug fixes) the module
> > ref count was 0 after loading. Ref count was increased only when
> > thedevice was opened and it was possible to remove the module if
> > none was using it.
> > 
> > After the 048d871 it doesn't seem to be possible to remove
> > drivers which use add_mtd_blktrans_dev().  Many drivers similar
> > to ftl have ftl_remove_dev() which calls del_mtd_blktrans_dev()
> > that would put the module but cannot be called unless the ref
> > count is already 0.
> > 
> > Jarkko Lavinen
> 
> My fault, I take a good look at how to fix that differently.
> Best regards,
> Maxim Levitsky

Please test the patch I have just posted on linux-mtd.

Best regards,
Maxim Levitsky
