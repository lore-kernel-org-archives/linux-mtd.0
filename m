Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bvoFD-0001bs-AR
 for linux-mtd@lists.infradead.org; Sun, 16 Oct 2016 16:25:04 +0000
Date: Sun, 16 Oct 2016 18:24:41 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Daniel Walter <dwalter@sigma-star.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/46] Nandsim facelift (part I of II)
Message-ID: <20161016182441.49adc653@bbrezillon>
In-Reply-To: <cover.1474450295.git.dwalter@sigma-star.at>
References: <cover.1474450295.git.dwalter@sigma-star.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Daniel, Richard,

On Wed, 21 Sep 2016 11:43:29 +0200
Daniel Walter <dwalter@sigma-star.at> wrote:

> Changes since V1:
>   Incooperate feedback for nand_cleanup()
>   Improve commit messages
> 
> 
> 
> Over a decade ago nandsim was introduced to Linux. The main purpose is having a software implementation of a NAND chip for rapid prototyping systems such as UBI on top of it. On
> the other hand is it also heavily used to load and inspect dumps from real NAND flashes. The current design allows only having a single chip and all parameters are passed as
> modules parameters. Another draw back is that it emulates all NAND chip internals including command parsing, this makes it slow and error prone wrt. changes in nand_base.c since
> the emulated chip is not really ONFI compliant.
> 
> This series addresses the singleton property of nandsim. It allows having multiple instances which can be controlled by a new userspace tool, nandsimctl. Nandsimctl works like
> losetup. You can add and remove instances with different settings.
> To allow multiple instances nandsim offers an ioctl() interface via a new device file, /dev/nandsimctl, to userspace.
> 
> Currently nandsim has two backends, ram and cache. In the default backend mode, ram, all data you change is stored in main memory. For smaller chips this works well but becomes
> problematic when modern multi-gigabyte chips are emulated. Cache mode addresses this drawback and redirects program commands to a local file. Using the cache_file module parameter
> the path of the backing file can be set. When nandsim is not a module passing a file name to it can lead to unexpected behavior since during kernel bootup the real root filesystem
> might not be ready and nandsim will populate the cache file on the initial root filesysem which is either tmpfs or worse a ramfs.
> 
> Via the new ioctl() interface a third backend mode can be used, file mode. File mode works like cache file but all data (including erases and OOB data) are stored on a local file.
> This file can also also be reused later. It is also possible to operate nandsim in a mode to omit existing OOB data and masquerade OOB bytes to 0xFF. This allows using a nanddump
> (without OOB) from a real NAND chip directly in nandsim using the file backend. That way you don't have to use nandwrite or other tools to write the dump into yout MTD before using
> it. You can directly attach the dump in a losetup alike way.
> 
> The ioctl() accepts all existing nandsim parameters except that in cache mode you pass a file descriptor instead of a file name to nandsim. This allows utilizing O_TMPFILE.
> To preserve existing behavior and no breaking any users of nandsim it is still possible to specify all parameters using module parameters but these parameters will only affect the
> first nandsim instance which will be automatically created upon module loading. If you don't have to have a default instance and explicitly create nandsim instances using
> nandsimctl pass defaults=n to the module.
> 
> There will be an additional patch series for mtd-utils containing nandsimctl.
> 
> A side effect of heavily reworking nandsim's backend internals it is now also possible to create custom backends. A custom backed was added to UserModeLinux. It allows directly
> booting from a nanddump using UML such that UBIFS as rootfs can be tested nicely on virtual machines.
> On step ahead for MTD testing.
> 
> The series itself is less straight forward than I wanted it to be, mostly because while adding new features it was needed to cleanup some parts, over and over.
> 
> Part II of that series will address the chip emulation nature of nandsim. It will add a second emulation mode. By default NAND chip emulation will be used but to allow arbitrary
> sized MTDs a more simple mode will be added which just allocates a MTD with the expected sizes instead of mocking nand_base.c.

I really like the new approach for 2 reasons:
1/ it allows creating several NAND devs, and you can do that after the
   module has been loaded.
2/ it fixes the partial NAND detection support by allowing one to
   describe its NAND in term of page size, eraseblock size, oob
   size, ...

But I'm wondering if we should not create a new driver instead of
trying to fix the old one (I must admit I haven't been through the 46
patches of this series, but last time we discussed it on IRC, Richard
said it actually was a complete rewrite of the nandsim driver).

Moreover, if we specify the flash layout manually, maybe we could make
it an mtdsim driver instead of restricting the emulation to NAND
devices.

What do you think?

Regards,

Boris
