Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bme4K-0004P0-HA
 for linux-mtd@lists.infradead.org; Wed, 21 Sep 2016 09:43:58 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Daniel Walter <dwalter@sigma-star.at>
Subject: [PATCH v2 00/46] Nandsim facelift (part I of II)
Date: Wed, 21 Sep 2016 11:43:29 +0200
Message-Id: <cover.1474450295.git.dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Changes since V1:
  Incooperate feedback for nand_cleanup()
  Improve commit messages



Over a decade ago nandsim was introduced to Linux. The main purpose is having a software implementation of a NAND chip for rapid prototyping systems such as UBI on top of it. On
the other hand is it also heavily used to load and inspect dumps from real NAND flashes. The current design allows only having a single chip and all parameters are passed as
modules parameters. Another draw back is that it emulates all NAND chip internals including command parsing, this makes it slow and error prone wrt. changes in nand_base.c since
the emulated chip is not really ONFI compliant.

This series addresses the singleton property of nandsim. It allows having multiple instances which can be controlled by a new userspace tool, nandsimctl. Nandsimctl works like
losetup. You can add and remove instances with different settings.
To allow multiple instances nandsim offers an ioctl() interface via a new device file, /dev/nandsimctl, to userspace.

Currently nandsim has two backends, ram and cache. In the default backend mode, ram, all data you change is stored in main memory. For smaller chips this works well but becomes
problematic when modern multi-gigabyte chips are emulated. Cache mode addresses this drawback and redirects program commands to a local file. Using the cache_file module parameter
the path of the backing file can be set. When nandsim is not a module passing a file name to it can lead to unexpected behavior since during kernel bootup the real root filesystem
might not be ready and nandsim will populate the cache file on the initial root filesysem which is either tmpfs or worse a ramfs.

Via the new ioctl() interface a third backend mode can be used, file mode. File mode works like cache file but all data (including erases and OOB data) are stored on a local file.
This file can also also be reused later. It is also possible to operate nandsim in a mode to omit existing OOB data and masquerade OOB bytes to 0xFF. This allows using a nanddump
(without OOB) from a real NAND chip directly in nandsim using the file backend. That way you don't have to use nandwrite or other tools to write the dump into yout MTD before using
it. You can directly attach the dump in a losetup alike way.

The ioctl() accepts all existing nandsim parameters except that in cache mode you pass a file descriptor instead of a file name to nandsim. This allows utilizing O_TMPFILE.
To preserve existing behavior and no breaking any users of nandsim it is still possible to specify all parameters using module parameters but these parameters will only affect the
first nandsim instance which will be automatically created upon module loading. If you don't have to have a default instance and explicitly create nandsim instances using
nandsimctl pass defaults=n to the module.

There will be an additional patch series for mtd-utils containing nandsimctl.

A side effect of heavily reworking nandsim's backend internals it is now also possible to create custom backends. A custom backed was added to UserModeLinux. It allows directly
booting from a nanddump using UML such that UBIFS as rootfs can be tested nicely on virtual machines.
On step ahead for MTD testing.

The series itself is less straight forward than I wanted it to be, mostly because while adding new features it was needed to cleanup some parts, over and over.

Part II of that series will address the chip emulation nature of nandsim. It will add a second emulation mode. By default NAND chip emulation will be used but to allow arbitrary
sized MTDs a more simple mode will be added which just allocates a MTD with the expected sizes instead of mocking nand_base.c.


Daniel Walter (1):
  mtd/nandsim: Add ioctl for info

Mathias Kresin (1):
  mtd: nandsim: use the existing output macros

Richard Weinberger (44):
  mtdpart: Propagate _get/put_device()
  mtd: nand: Provide nand_cleanup() function to free NAND related
    resources
  mtd: Don't unconditionally unregister reboot notifier
  mtd: Don't unconditionally execute remove notifiers
  mtd: Don't print a scary message when trying to remove a busy MTD
  mtd: nandsim: Add basic control file support
  mtd: nandsim: Begin with removal of global state
  mtd: nandsim: Kill global nsmtd
  mtd: nandsim: Don't directly use module parameters
  mtd: nandsim: Add helper functions for pointer magic
  mtd: nandsim: Factor out nandsim parameters
  mtd: nandsim: Make debugfs logic multi instance capable
  mtd: nandsim: Add final logic for multiple instances
  mtd: nandsim: Add simulator id to MTD parition name
  mtd: nandsim: Introduce backend operations
  mtd: nandsim: Print error when backend init failed
  mtd: nandsim: Allow external backends
  mtd: nandsim: Add basic support for a file backend
  mtd: nandsim: UAPI v1
  mtd: nandsim: Implement preliminary constructor function
  mtd: nandsim: Implement preliminary destructor function
  mtd: nandsim: Cleanup destroy handlers
  mtd: nandsim: Unify file backend init logic
  mtd: nandsim: Wire up NANDSIM_MODE_CACHEFILE ioctl mode
  mtd: nandsim: Print backend name
  mtd: nandsim: Add no_oob mode
  mtd: nandsim: Refine exports
  um: Add nandsim backend driver
  mtd: nandsim: Use pr_ style logging
  mtd: nandsim: Remove NS_RAW_OFFSET_OOB
  mtd: nandsim: Remove NS_IS_INITIALIZED
  mtd: nandsim: Relax page size restrictions
  mtd: nandsim: Support bitflip and read error emulation in file backend
  mtd: nandsim: Make NANDSIM_MAX_DEVICES part of uapi
  mtd: nandsim: Cleanup constants
  mtd: nandsim: Turn parts[] into a integer
  mtd: nandsim: Expose partition creation logic to user space
  mtd: nandsim: Rework init error paths
  mtd: nandsim: Expose BBT, delays, etc.. to userspace
  mtd: nandsim: Expose support for weakpages/blocks to userspace
  mtd: nandsim: Don't printk on ENOMEM
  mtd: nandsim: Wire up NANDSIM_IOC_NEW_INSTANCE
  mtd: nandsim: Wire up NANDSIM_IOC_DESTROY_INSTANCE
  mtd: nandsim: Always answer all 8 bytes from NAND_CMD_READID

 arch/um/Kconfig.um              |    6 +
 arch/um/drivers/Makefile        |    2 +
 arch/um/drivers/nand_kern.c     |  159 +++
 drivers/mtd/mtdcore.c           |   28 +-
 drivers/mtd/mtdpart.c           |   18 +
 drivers/mtd/nand/nand_base.c    |   18 +-
 drivers/mtd/nand/nandsim.c      | 2141 ++++++++++++++++++++++++++++-----------
 include/linux/mtd/nand.h        |    1 +
 include/linux/mtd/nandsim.h     |   79 ++
 include/uapi/mtd/nandsim-user.h |  113 +++
 10 files changed, 1961 insertions(+), 604 deletions(-)
 create mode 100644 arch/um/drivers/nand_kern.c
 create mode 100644 include/linux/mtd/nandsim.h
 create mode 100644 include/uapi/mtd/nandsim-user.h

-- 
2.8.3
