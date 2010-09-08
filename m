Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OtJeC-0007KN-Fd
	for linux-mtd@lists.infradead.org; Wed, 08 Sep 2010 12:21:04 +0000
Date: Wed, 8 Sep 2010 15:20:39 +0300
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
To: David Woodhouse <david.woodhouse@intel.com>
Subject: Cannot rmmod after call to add_mtd_blktrans_dev
Message-ID: <20100908122039.GA25005@angel.research.nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, Maxim Levitsky <maximlevitsky@gmail.com>
Reply-To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am working with mtdswap driver which uses
add_mtd_blktrans_dev().  Once I call add_mtd_blktrans_dev() the
driver module reference count is 1 and I cannot remove the
module.

Before commit 048d871 (mtd: blktrans: Hotplug fixes) the module
ref count was 0 after loading. Ref count was increased only when
thedevice was opened and it was possible to remove the module if
none was using it.

After the 048d871 it doesn't seem to be possible to remove
drivers which use add_mtd_blktrans_dev().  Many drivers similar
to ftl have ftl_remove_dev() which calls del_mtd_blktrans_dev()
that would put the module but cannot be called unless the ref
count is already 0.

Jarkko Lavinen
