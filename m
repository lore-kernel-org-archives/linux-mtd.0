Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWpu-00078F-Uv
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:36:18 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org
Subject: [PATCH 24/29] vfio.txt: standardize document format
Date: Thu, 18 May 2017 22:26:08 -0300
Message-Id: <bdc1d60c08d32dada1b3bee0d2bfcc31b75f2ac1.1495157082.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495157082.git.mchehab@s-opensource.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495157082.git.mchehab@s-opensource.com>
References: <cover.1495157082.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Each text file under Documentation follows a different
format. Some doesn't even have titles!

Change its representation to follow the adopted standard,
using ReST markups for it to be parseable by Sphinx:
- adjust title marks;
- use footnote marks;
- mark literal blocks;
- adjust identation.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/vfio.txt | 261 +++++++++++++++++++++++++------------------------
 1 file changed, 134 insertions(+), 127 deletions(-)

diff --git a/Documentation/vfio.txt b/Documentation/vfio.txt
index 1dd3fddfd3a1..ef6a5111eaa1 100644
--- a/Documentation/vfio.txt
+++ b/Documentation/vfio.txt
@@ -1,5 +1,7 @@
-VFIO - "Virtual Function I/O"[1]
--------------------------------------------------------------------------------
+==================================
+VFIO - "Virtual Function I/O" [1]_
+==================================
+
 Many modern system now provide DMA and interrupt remapping facilities
 to help ensure I/O devices behave within the boundaries they've been
 allotted.  This includes x86 hardware with AMD-Vi and Intel VT-d,
@@ -7,14 +9,14 @@ POWER systems with Partitionable Endpoints (PEs) and embedded PowerPC
 systems such as Freescale PAMU.  The VFIO driver is an IOMMU/device
 agnostic framework for exposing direct device access to userspace, in
 a secure, IOMMU protected environment.  In other words, this allows
-safe[2], non-privileged, userspace drivers.
+safe [2]_, non-privileged, userspace drivers.
 
 Why do we want that?  Virtual machines often make use of direct device
 access ("device assignment") when configured for the highest possible
 I/O performance.  From a device and host perspective, this simply
 turns the VM into a userspace driver, with the benefits of
 significantly reduced latency, higher bandwidth, and direct use of
-bare-metal device drivers[3].
+bare-metal device drivers [3]_.
 
 Some applications, particularly in the high performance computing
 field, also benefit from low-overhead, direct device access from
@@ -31,7 +33,7 @@ KVM PCI specific device assignment code as well as provide a more
 secure, more featureful userspace driver environment than UIO.
 
 Groups, Devices, and IOMMUs
--------------------------------------------------------------------------------
+---------------------------
 
 Devices are the main target of any I/O driver.  Devices typically
 create a programming interface made up of I/O access, interrupts,
@@ -114,40 +116,40 @@ well as mechanisms for describing and registering interrupt
 notifications.
 
 VFIO Usage Example
--------------------------------------------------------------------------------
+------------------
 
-Assume user wants to access PCI device 0000:06:0d.0
+Assume user wants to access PCI device 0000:06:0d.0::
 
-$ readlink /sys/bus/pci/devices/0000:06:0d.0/iommu_group
-../../../../kernel/iommu_groups/26
+	$ readlink /sys/bus/pci/devices/0000:06:0d.0/iommu_group
+	../../../../kernel/iommu_groups/26
 
 This device is therefore in IOMMU group 26.  This device is on the
 pci bus, therefore the user will make use of vfio-pci to manage the
-group:
+group::
 
-# modprobe vfio-pci
+	# modprobe vfio-pci
 
 Binding this device to the vfio-pci driver creates the VFIO group
-character devices for this group:
+character devices for this group::
 
-$ lspci -n -s 0000:06:0d.0
-06:0d.0 0401: 1102:0002 (rev 08)
-# echo 0000:06:0d.0 > /sys/bus/pci/devices/0000:06:0d.0/driver/unbind
-# echo 1102 0002 > /sys/bus/pci/drivers/vfio-pci/new_id
+	$ lspci -n -s 0000:06:0d.0
+	06:0d.0 0401: 1102:0002 (rev 08)
+	# echo 0000:06:0d.0 > /sys/bus/pci/devices/0000:06:0d.0/driver/unbind
+	# echo 1102 0002 > /sys/bus/pci/drivers/vfio-pci/new_id
 
 Now we need to look at what other devices are in the group to free
-it for use by VFIO:
+it for use by VFIO::
 
-$ ls -l /sys/bus/pci/devices/0000:06:0d.0/iommu_group/devices
-total 0
-lrwxrwxrwx. 1 root root 0 Apr 23 16:13 0000:00:1e.0 ->
-	../../../../devices/pci0000:00/0000:00:1e.0
-lrwxrwxrwx. 1 root root 0 Apr 23 16:13 0000:06:0d.0 ->
-	../../../../devices/pci0000:00/0000:00:1e.0/0000:06:0d.0
-lrwxrwxrwx. 1 root root 0 Apr 23 16:13 0000:06:0d.1 ->
-	../../../../devices/pci0000:00/0000:00:1e.0/0000:06:0d.1
+	$ ls -l /sys/bus/pci/devices/0000:06:0d.0/iommu_group/devices
+	total 0
+	lrwxrwxrwx. 1 root root 0 Apr 23 16:13 0000:00:1e.0 ->
+		../../../../devices/pci0000:00/0000:00:1e.0
+	lrwxrwxrwx. 1 root root 0 Apr 23 16:13 0000:06:0d.0 ->
+		../../../../devices/pci0000:00/0000:00:1e.0/0000:06:0d.0
+	lrwxrwxrwx. 1 root root 0 Apr 23 16:13 0000:06:0d.1 ->
+		../../../../devices/pci0000:00/0000:00:1e.0/0000:06:0d.1
 
-This device is behind a PCIe-to-PCI bridge[4], therefore we also
+This device is behind a PCIe-to-PCI bridge [4]_, therefore we also
 need to add device 0000:06:0d.1 to the group following the same
 procedure as above.  Device 0000:00:1e.0 is a bridge that does
 not currently have a host driver, therefore it's not required to
@@ -157,12 +159,12 @@ support PCI bridges).
 The final step is to provide the user with access to the group if
 unprivileged operation is desired (note that /dev/vfio/vfio provides
 no capabilities on its own and is therefore expected to be set to
-mode 0666 by the system).
+mode 0666 by the system)::
 
-# chown user:user /dev/vfio/26
+	# chown user:user /dev/vfio/26
 
 The user now has full access to all the devices and the iommu for this
-group and can access them as follows:
+group and can access them as follows::
 
 	int container, group, device, i;
 	struct vfio_group_status group_status =
@@ -248,31 +250,31 @@ VFIO bus driver API
 VFIO bus drivers, such as vfio-pci make use of only a few interfaces
 into VFIO core.  When devices are bound and unbound to the driver,
 the driver should call vfio_add_group_dev() and vfio_del_group_dev()
-respectively:
+respectively::
 
-extern int vfio_add_group_dev(struct iommu_group *iommu_group,
-                              struct device *dev,
-                              const struct vfio_device_ops *ops,
-                              void *device_data);
+	extern int vfio_add_group_dev(struct iommu_group *iommu_group,
+	                              struct device *dev,
+				      const struct vfio_device_ops *ops,
+				      void *device_data);
 
-extern void *vfio_del_group_dev(struct device *dev);
+	extern void *vfio_del_group_dev(struct device *dev);
 
 vfio_add_group_dev() indicates to the core to begin tracking the
 specified iommu_group and register the specified dev as owned by
 a VFIO bus driver.  The driver provides an ops structure for callbacks
-similar to a file operations structure:
+similar to a file operations structure::
 
-struct vfio_device_ops {
-	int	(*open)(void *device_data);
-	void	(*release)(void *device_data);
-	ssize_t	(*read)(void *device_data, char __user *buf,
-			size_t count, loff_t *ppos);
-	ssize_t	(*write)(void *device_data, const char __user *buf,
-			 size_t size, loff_t *ppos);
-	long	(*ioctl)(void *device_data, unsigned int cmd,
-			 unsigned long arg);
-	int	(*mmap)(void *device_data, struct vm_area_struct *vma);
-};
+	struct vfio_device_ops {
+		int	(*open)(void *device_data);
+		void	(*release)(void *device_data);
+		ssize_t	(*read)(void *device_data, char __user *buf,
+				size_t count, loff_t *ppos);
+		ssize_t	(*write)(void *device_data, const char __user *buf,
+				 size_t size, loff_t *ppos);
+		long	(*ioctl)(void *device_data, unsigned int cmd,
+				 unsigned long arg);
+		int	(*mmap)(void *device_data, struct vm_area_struct *vma);
+	};
 
 Each function is passed the device_data that was originally registered
 in the vfio_add_group_dev() call above.  This allows the bus driver
@@ -285,50 +287,55 @@ own VFIO_DEVICE_GET_REGION_INFO ioctl.
 
 
 PPC64 sPAPR implementation note
--------------------------------------------------------------------------------
+-------------------------------
 
 This implementation has some specifics:
 
 1) On older systems (POWER7 with P5IOC2/IODA1) only one IOMMU group per
-container is supported as an IOMMU table is allocated at the boot time,
-one table per a IOMMU group which is a Partitionable Endpoint (PE)
-(PE is often a PCI domain but not always).
-Newer systems (POWER8 with IODA2) have improved hardware design which allows
-to remove this limitation and have multiple IOMMU groups per a VFIO container.
+   container is supported as an IOMMU table is allocated at the boot time,
+   one table per a IOMMU group which is a Partitionable Endpoint (PE)
+   (PE is often a PCI domain but not always).
+
+   Newer systems (POWER8 with IODA2) have improved hardware design which allows
+   to remove this limitation and have multiple IOMMU groups per a VFIO
+   container.
 
 2) The hardware supports so called DMA windows - the PCI address range
-within which DMA transfer is allowed, any attempt to access address space
-out of the window leads to the whole PE isolation.
+   within which DMA transfer is allowed, any attempt to access address space
+   out of the window leads to the whole PE isolation.
 
 3) PPC64 guests are paravirtualized but not fully emulated. There is an API
-to map/unmap pages for DMA, and it normally maps 1..32 pages per call and
-currently there is no way to reduce the number of calls. In order to make things
-faster, the map/unmap handling has been implemented in real mode which provides
-an excellent performance which has limitations such as inability to do
-locked pages accounting in real time.
+   to map/unmap pages for DMA, and it normally maps 1..32 pages per call and
+   currently there is no way to reduce the number of calls. In order to make
+   things faster, the map/unmap handling has been implemented in real mode
+   which provides an excellent performance which has limitations such as
+   inability to do locked pages accounting in real time.
 
 4) According to sPAPR specification, A Partitionable Endpoint (PE) is an I/O
-subtree that can be treated as a unit for the purposes of partitioning and
-error recovery. A PE may be a single or multi-function IOA (IO Adapter), a
-function of a multi-function IOA, or multiple IOAs (possibly including switch
-and bridge structures above the multiple IOAs). PPC64 guests detect PCI errors
-and recover from them via EEH RTAS services, which works on the basis of
-additional ioctl commands.
+   subtree that can be treated as a unit for the purposes of partitioning and
+   error recovery. A PE may be a single or multi-function IOA (IO Adapter), a
+   function of a multi-function IOA, or multiple IOAs (possibly including
+   switch and bridge structures above the multiple IOAs). PPC64 guests detect
+   PCI errors and recover from them via EEH RTAS services, which works on the
+   basis of additional ioctl commands.
 
-So 4 additional ioctls have been added:
+   So 4 additional ioctls have been added:
 
-	VFIO_IOMMU_SPAPR_TCE_GET_INFO - returns the size and the start
-		of the DMA window on the PCI bus.
+	VFIO_IOMMU_SPAPR_TCE_GET_INFO
+		returns the size and the start of the DMA window on the PCI bus.
 
-	VFIO_IOMMU_ENABLE - enables the container. The locked pages accounting
+	VFIO_IOMMU_ENABLE
+		enables the container. The locked pages accounting
 		is done at this point. This lets user first to know what
 		the DMA window is and adjust rlimit before doing any real job.
 
-	VFIO_IOMMU_DISABLE - disables the container.
+	VFIO_IOMMU_DISABLE
+		disables the container.
 
-	VFIO_EEH_PE_OP - provides an API for EEH setup, error detection and recovery.
+	VFIO_EEH_PE_OP
+		provides an API for EEH setup, error detection and recovery.
 
-The code flow from the example above should be slightly changed:
+   The code flow from the example above should be slightly changed::
 
 	struct vfio_eeh_pe_op pe_op = { .argsz = sizeof(pe_op), .flags = 0 };
 
@@ -442,73 +449,73 @@ The code flow from the example above should be slightly changed:
 	....
 
 5) There is v2 of SPAPR TCE IOMMU. It deprecates VFIO_IOMMU_ENABLE/
-VFIO_IOMMU_DISABLE and implements 2 new ioctls:
-VFIO_IOMMU_SPAPR_REGISTER_MEMORY and VFIO_IOMMU_SPAPR_UNREGISTER_MEMORY
-(which are unsupported in v1 IOMMU).
+   VFIO_IOMMU_DISABLE and implements 2 new ioctls:
+   VFIO_IOMMU_SPAPR_REGISTER_MEMORY and VFIO_IOMMU_SPAPR_UNREGISTER_MEMORY
+   (which are unsupported in v1 IOMMU).
 
-PPC64 paravirtualized guests generate a lot of map/unmap requests,
-and the handling of those includes pinning/unpinning pages and updating
-mm::locked_vm counter to make sure we do not exceed the rlimit.
-The v2 IOMMU splits accounting and pinning into separate operations:
+   PPC64 paravirtualized guests generate a lot of map/unmap requests,
+   and the handling of those includes pinning/unpinning pages and updating
+   mm::locked_vm counter to make sure we do not exceed the rlimit.
+   The v2 IOMMU splits accounting and pinning into separate operations:
 
-- VFIO_IOMMU_SPAPR_REGISTER_MEMORY/VFIO_IOMMU_SPAPR_UNREGISTER_MEMORY ioctls
-receive a user space address and size of the block to be pinned.
-Bisecting is not supported and VFIO_IOMMU_UNREGISTER_MEMORY is expected to
-be called with the exact address and size used for registering
-the memory block. The userspace is not expected to call these often.
-The ranges are stored in a linked list in a VFIO container.
+   - VFIO_IOMMU_SPAPR_REGISTER_MEMORY/VFIO_IOMMU_SPAPR_UNREGISTER_MEMORY ioctls
+     receive a user space address and size of the block to be pinned.
+     Bisecting is not supported and VFIO_IOMMU_UNREGISTER_MEMORY is expected to
+     be called with the exact address and size used for registering
+     the memory block. The userspace is not expected to call these often.
+     The ranges are stored in a linked list in a VFIO container.
 
-- VFIO_IOMMU_MAP_DMA/VFIO_IOMMU_UNMAP_DMA ioctls only update the actual
-IOMMU table and do not do pinning; instead these check that the userspace
-address is from pre-registered range.
+   - VFIO_IOMMU_MAP_DMA/VFIO_IOMMU_UNMAP_DMA ioctls only update the actual
+     IOMMU table and do not do pinning; instead these check that the userspace
+     address is from pre-registered range.
 
-This separation helps in optimizing DMA for guests.
+   This separation helps in optimizing DMA for guests.
 
 6) sPAPR specification allows guests to have an additional DMA window(s) on
-a PCI bus with a variable page size. Two ioctls have been added to support
-this: VFIO_IOMMU_SPAPR_TCE_CREATE and VFIO_IOMMU_SPAPR_TCE_REMOVE.
-The platform has to support the functionality or error will be returned to
-the userspace. The existing hardware supports up to 2 DMA windows, one is
-2GB long, uses 4K pages and called "default 32bit window"; the other can
-be as big as entire RAM, use different page size, it is optional - guests
-create those in run-time if the guest driver supports 64bit DMA.
+   a PCI bus with a variable page size. Two ioctls have been added to support
+   this: VFIO_IOMMU_SPAPR_TCE_CREATE and VFIO_IOMMU_SPAPR_TCE_REMOVE.
+   The platform has to support the functionality or error will be returned to
+   the userspace. The existing hardware supports up to 2 DMA windows, one is
+   2GB long, uses 4K pages and called "default 32bit window"; the other can
+   be as big as entire RAM, use different page size, it is optional - guests
+   create those in run-time if the guest driver supports 64bit DMA.
 
-VFIO_IOMMU_SPAPR_TCE_CREATE receives a page shift, a DMA window size and
-a number of TCE table levels (if a TCE table is going to be big enough and
-the kernel may not be able to allocate enough of physically contiguous memory).
-It creates a new window in the available slot and returns the bus address where
-the new window starts. Due to hardware limitation, the user space cannot choose
-the location of DMA windows.
+   VFIO_IOMMU_SPAPR_TCE_CREATE receives a page shift, a DMA window size and
+   a number of TCE table levels (if a TCE table is going to be big enough and
+   the kernel may not be able to allocate enough of physically contiguous
+   memory). It creates a new window in the available slot and returns the bus
+   address where the new window starts. Due to hardware limitation, the user
+   space cannot choose the location of DMA windows.
 
-VFIO_IOMMU_SPAPR_TCE_REMOVE receives the bus start address of the window
-and removes it.
+   VFIO_IOMMU_SPAPR_TCE_REMOVE receives the bus start address of the window
+   and removes it.
 
 -------------------------------------------------------------------------------
 
-[1] VFIO was originally an acronym for "Virtual Function I/O" in its
-initial implementation by Tom Lyon while as Cisco.  We've since
-outgrown the acronym, but it's catchy.
+.. [1] VFIO was originally an acronym for "Virtual Function I/O" in its
+   initial implementation by Tom Lyon while as Cisco.  We've since
+   outgrown the acronym, but it's catchy.
 
-[2] "safe" also depends upon a device being "well behaved".  It's
-possible for multi-function devices to have backdoors between
-functions and even for single function devices to have alternative
-access to things like PCI config space through MMIO registers.  To
-guard against the former we can include additional precautions in the
-IOMMU driver to group multi-function PCI devices together
-(iommu=group_mf).  The latter we can't prevent, but the IOMMU should
-still provide isolation.  For PCI, SR-IOV Virtual Functions are the
-best indicator of "well behaved", as these are designed for
-virtualization usage models.
+.. [2] "safe" also depends upon a device being "well behaved".  It's
+   possible for multi-function devices to have backdoors between
+   functions and even for single function devices to have alternative
+   access to things like PCI config space through MMIO registers.  To
+   guard against the former we can include additional precautions in the
+   IOMMU driver to group multi-function PCI devices together
+   (iommu=group_mf).  The latter we can't prevent, but the IOMMU should
+   still provide isolation.  For PCI, SR-IOV Virtual Functions are the
+   best indicator of "well behaved", as these are designed for
+   virtualization usage models.
 
-[3] As always there are trade-offs to virtual machine device
-assignment that are beyond the scope of VFIO.  It's expected that
-future IOMMU technologies will reduce some, but maybe not all, of
-these trade-offs.
+.. [3] As always there are trade-offs to virtual machine device
+   assignment that are beyond the scope of VFIO.  It's expected that
+   future IOMMU technologies will reduce some, but maybe not all, of
+   these trade-offs.
 
-[4] In this case the device is below a PCI bridge, so transactions
-from either function of the device are indistinguishable to the iommu:
+.. [4] In this case the device is below a PCI bridge, so transactions
+   from either function of the device are indistinguishable to the iommu::
 
--[0000:00]-+-1e.0-[06]--+-0d.0
-                        \-0d.1
+	-[0000:00]-+-1e.0-[06]--+-0d.0
+				\-0d.1
 
-00:1e.0 PCI bridge: Intel Corporation 82801 PCI Bridge (rev 90)
+	00:1e.0 PCI bridge: Intel Corporation 82801 PCI Bridge (rev 90)
-- 
2.9.4
