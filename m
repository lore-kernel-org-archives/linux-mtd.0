Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbQc-0008VU-Mk
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:18:17 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH v2 25/53] libata.rst: add c function and struct
 cross-references
Date: Tue, 16 May 2017 09:16:17 -0300
Message-Id: <6b46c2b156d052172d73b0ac486898bf993ab70c.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Instead of just using text for functions and structs, use
the C domain tags, in order to allow cross-referencing with
the kernel-doc markups.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/driver-api/libata.rst | 244 ++++++++++++++++++------------------
 1 file changed, 124 insertions(+), 120 deletions(-)

diff --git a/Documentation/driver-api/libata.rst b/Documentation/driver-api/libata.rst
index 774bf238ff79..4adc056f7635 100644
--- a/Documentation/driver-api/libata.rst
+++ b/Documentation/driver-api/libata.rst
@@ -18,18 +18,19 @@ internals, and a couple sample ATA low-level drivers.
 libata Driver API
 =================
 
-struct ata_port_operations is defined for every low-level libata
+:c:type:`struct ata_port_operations <ata_port_operations>`
+is defined for every low-level libata
 hardware driver, and it controls how the low-level driver interfaces
 with the ATA and SCSI layers.
 
-FIS-based drivers will hook into the system with ->qc_prep() and
-->qc_issue() high-level hooks. Hardware which behaves in a manner
+FIS-based drivers will hook into the system with ``->qc_prep()`` and
+``->qc_issue()`` high-level hooks. Hardware which behaves in a manner
 similar to PCI IDE hardware may utilize several generic helpers,
 defining at a bare minimum the bus I/O addresses of the ATA shadow
 register blocks.
 
-struct ata_port_operations
-----------------------------
+:c:type:`struct ata_port_operations <ata_port_operations>`
+----------------------------------------------------------
 
 Disable ATA port
 ~~~~~~~~~~~~~~~~
@@ -39,13 +40,13 @@ Disable ATA port
     void (*port_disable) (struct ata_port *);
 
 
-Called from ata_bus_probe() error path, as well as when unregistering
+Called from :c:func:`ata_bus_probe` error path, as well as when unregistering
 from the SCSI module (rmmod, hot unplug). This function should do
 whatever needs to be done to take the port out of use. In most cases,
-ata_port_disable() can be used as this hook.
+:c:func:`ata_port_disable` can be used as this hook.
 
-Called from ata_bus_probe() on a failed probe. Called from
-ata_scsi_release().
+Called from :c:func:`ata_bus_probe` on a failed probe. Called from
+:c:func:`ata_scsi_release`.
 
 Post-IDENTIFY device configuration
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -73,22 +74,22 @@ Set PIO/DMA mode
 
 
 Hooks called prior to the issue of SET FEATURES - XFER MODE command. The
-optional ->mode_filter() hook is called when libata has built a mask of
-the possible modes. This is passed to the ->mode_filter() function
+optional ``->mode_filter()`` hook is called when libata has built a mask of
+the possible modes. This is passed to the ``->mode_filter()`` function
 which should return a mask of valid modes after filtering those
 unsuitable due to hardware limits. It is not valid to use this interface
 to add modes.
 
-dev->pio_mode and dev->dma_mode are guaranteed to be valid when
-->set_piomode() and when ->set_dmamode() is called. The timings for
+``dev->pio_mode`` and ``dev->dma_mode`` are guaranteed to be valid when
+``->set_piomode()`` and when ``->set_dmamode()`` is called. The timings for
 any other drive sharing the cable will also be valid at this point. That
 is the library records the decisions for the modes of each drive on a
 channel before it attempts to set any of them.
 
-->post_set_mode() is called unconditionally, after the SET FEATURES -
+``->post_set_mode()`` is called unconditionally, after the SET FEATURES -
 XFER MODE command completes successfully.
 
-->set_piomode() is always called (if present), but ->set_dma_mode()
+``->set_piomode()`` is always called (if present), but ``->set_dma_mode()``
 is only called if DMA is possible.
 
 Taskfile read/write
@@ -100,11 +101,11 @@ Taskfile read/write
     void (*sff_tf_read) (struct ata_port *ap, struct ata_taskfile *tf);
 
 
-->tf_load() is called to load the given taskfile into hardware
-registers / DMA buffers. ->tf_read() is called to read the hardware
+``->tf_load()`` is called to load the given taskfile into hardware
+registers / DMA buffers. ``->tf_read()`` is called to read the hardware
 registers / DMA buffers, to obtain the current set of taskfile register
 values. Most drivers for taskfile-based hardware (PIO or MMIO) use
-ata_sff_tf_load() and ata_sff_tf_read() for these hooks.
+:c:func:`ata_sff_tf_load` and :c:func:`ata_sff_tf_read` for these hooks.
 
 PIO data read/write
 ~~~~~~~~~~~~~~~~~~~
@@ -117,8 +118,8 @@ PIO data read/write
 All bmdma-style drivers must implement this hook. This is the low-level
 operation that actually copies the data bytes during a PIO data
 transfer. Typically the driver will choose one of
-ata_sff_data_xfer_noirq(), ata_sff_data_xfer(), or
-ata_sff_data_xfer32().
+:c:func:`ata_sff_data_xfer_noirq`, :c:func:`ata_sff_data_xfer`, or
+:c:func:`ata_sff_data_xfer32`.
 
 ATA command execute
 ~~~~~~~~~~~~~~~~~~~
@@ -128,9 +129,9 @@ ATA command execute
     void (*sff_exec_command)(struct ata_port *ap, struct ata_taskfile *tf);
 
 
-causes an ATA command, previously loaded with ->tf_load(), to be
+causes an ATA command, previously loaded with ``->tf_load()``, to be
 initiated in hardware. Most drivers for taskfile-based hardware use
-ata_sff_exec_command() for this hook.
+:c:func:`ata_sff_exec_command` for this hook.
 
 Per-cmd ATAPI DMA capabilities filter
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -159,7 +160,7 @@ Read specific ATA shadow registers
 Reads the Status/AltStatus ATA shadow register from hardware. On some
 hardware, reading the Status register has the side effect of clearing
 the interrupt condition. Most drivers for taskfile-based hardware use
-ata_sff_check_status() for this hook.
+:c:func:`ata_sff_check_status` for this hook.
 
 Write specific ATA shadow register
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -184,7 +185,7 @@ Issues the low-level hardware command(s) that causes one of N hardware
 devices to be considered 'selected' (active and available for use) on
 the ATA bus. This generally has no meaning on FIS-based devices.
 
-Most drivers for taskfile-based hardware use ata_sff_dev_select() for
+Most drivers for taskfile-based hardware use :c:func:`ata_sff_dev_select` for
 this hook.
 
 Private tuning method
@@ -222,28 +223,28 @@ Control PCI IDE BMDMA engine
 
 
 When setting up an IDE BMDMA transaction, these hooks arm
-(->bmdma_setup), fire (->bmdma_start), and halt (->bmdma_stop) the
-hardware's DMA engine. ->bmdma_status is used to read the standard PCI
+(``->bmdma_setup``), fire (``->bmdma_start``), and halt (``->bmdma_stop``) the
+hardware's DMA engine. ``->bmdma_status`` is used to read the standard PCI
 IDE DMA Status register.
 
 These hooks are typically either no-ops, or simply not implemented, in
 FIS-based drivers.
 
-Most legacy IDE drivers use ata_bmdma_setup() for the bmdma_setup()
-hook. ata_bmdma_setup() will write the pointer to the PRD table to the
-IDE PRD Table Address register, enable DMA in the DMA Command register,
-and call exec_command() to begin the transfer.
+Most legacy IDE drivers use :c:func:`ata_bmdma_setup` for the
+:c:func:`bmdma_setup` hook. :c:func:`ata_bmdma_setup` will write the pointer
+to the PRD table to the IDE PRD Table Address register, enable DMA in the DMA
+Command register, and call :c:func:`exec_command` to begin the transfer.
 
-Most legacy IDE drivers use ata_bmdma_start() for the bmdma_start()
-hook. ata_bmdma_start() will write the ATA_DMA_START flag to the DMA
-Command register.
+Most legacy IDE drivers use :c:func:`ata_bmdma_start` for the
+:c:func:`bmdma_start` hook. :c:func:`ata_bmdma_start` will write the
+ATA_DMA_START flag to the DMA Command register.
 
-Many legacy IDE drivers use ata_bmdma_stop() for the bmdma_stop()
-hook. ata_bmdma_stop() clears the ATA_DMA_START flag in the DMA
-command register.
+Many legacy IDE drivers use :c:func:`ata_bmdma_stop` for the
+:c:func:`bmdma_stop` hook. :c:func:`ata_bmdma_stop` clears the ATA_DMA_START
+flag in the DMA command register.
 
-Many legacy IDE drivers use ata_bmdma_status() as the bmdma_status()
-hook.
+Many legacy IDE drivers use :c:func:`ata_bmdma_status` as the
+:c:func:`bmdma_status` hook.
 
 High-level taskfile hooks
 ~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -255,19 +256,19 @@ High-level taskfile hooks
 
 
 Higher-level hooks, these two hooks can potentially supercede several of
-the above taskfile/DMA engine hooks. ->qc_prep is called after the
+the above taskfile/DMA engine hooks. ``->qc_prep`` is called after the
 buffers have been DMA-mapped, and is typically used to populate the
 hardware's DMA scatter-gather table. Most drivers use the standard
-ata_qc_prep() helper function, but more advanced drivers roll their
+:c:func:`ata_qc_prep` helper function, but more advanced drivers roll their
 own.
 
-->qc_issue is used to make a command active, once the hardware and S/G
+``->qc_issue`` is used to make a command active, once the hardware and S/G
 tables have been prepared. IDE BMDMA drivers use the helper function
-ata_qc_issue_prot() for taskfile protocol-based dispatch. More
-advanced drivers implement their own ->qc_issue.
+:c:func:`ata_qc_issue_prot` for taskfile protocol-based dispatch. More
+advanced drivers implement their own ``->qc_issue``.
 
-ata_qc_issue_prot() calls ->tf_load(), ->bmdma_setup(), and
-->bmdma_start() as necessary to initiate a transfer.
+:c:func:`ata_qc_issue_prot` calls ``->tf_load()``, ``->bmdma_setup()``, and
+``->bmdma_start()`` as necessary to initiate a transfer.
 
 Exception and probe handling (EH)
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -278,7 +279,7 @@ Exception and probe handling (EH)
     void (*phy_reset) (struct ata_port *ap);
 
 
-Deprecated. Use ->error_handler() instead.
+Deprecated. Use ``->error_handler()`` instead.
 
 ::
 
@@ -286,18 +287,18 @@ Deprecated. Use ->error_handler() instead.
     void (*thaw) (struct ata_port *ap);
 
 
-ata_port_freeze() is called when HSM violations or some other
+:c:func:`ata_port_freeze` is called when HSM violations or some other
 condition disrupts normal operation of the port. A frozen port is not
 allowed to perform any operation until the port is thawed, which usually
 follows a successful reset.
 
-The optional ->freeze() callback can be used for freezing the port
+The optional ``->freeze()`` callback can be used for freezing the port
 hardware-wise (e.g. mask interrupt and stop DMA engine). If a port
 cannot be frozen hardware-wise, the interrupt handler must ack and clear
 interrupts unconditionally while the port is frozen.
 
-The optional ->thaw() callback is called to perform the opposite of
-->freeze(): prepare the port for normal operation once again. Unmask
+The optional ``->thaw()`` callback is called to perform the opposite of
+``->freeze()``: prepare the port for normal operation once again. Unmask
 interrupts, start DMA engine, etc.
 
 ::
@@ -305,10 +306,10 @@ interrupts, start DMA engine, etc.
     void (*error_handler) (struct ata_port *ap);
 
 
-->error_handler() is a driver's hook into probe, hotplug, and recovery
+``->error_handler()`` is a driver's hook into probe, hotplug, and recovery
 and other exceptional conditions. The primary responsibility of an
-implementation is to call ata_do_eh() or ata_bmdma_drive_eh() with
-a set of EH hooks as arguments:
+implementation is to call :c:func:`ata_do_eh` or :c:func:`ata_bmdma_drive_eh`
+with a set of EH hooks as arguments:
 
 'prereset' hook (may be NULL) is called during an EH reset, before any
 other actions are taken.
@@ -327,7 +328,7 @@ called to perform the low-level EH reset.
 
 Perform any hardware-specific actions necessary to finish processing
 after executing a probe-time or EH-time command via
-ata_exec_internal().
+:c:func:`ata_exec_internal`.
 
 Hardware interrupt handling
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -338,20 +339,20 @@ Hardware interrupt handling
     void (*irq_clear) (struct ata_port *);
 
 
-->irq_handler is the interrupt handling routine registered with the
-system, by libata. ->irq_clear is called during probe just before the
+``->irq_handler`` is the interrupt handling routine registered with the
+system, by libata. ``->irq_clear`` is called during probe just before the
 interrupt handler is registered, to be sure hardware is quiet.
 
 The second argument, dev_instance, should be cast to a pointer to
-struct ata_host_set.
+:c:type:`struct ata_host_set <ata_host_set>`.
 
-Most legacy IDE drivers use ata_sff_interrupt() for the irq_handler
+Most legacy IDE drivers use :c:func:`ata_sff_interrupt` for the irq_handler
 hook, which scans all ports in the host_set, determines which queued
 command was active (if any), and calls ata_sff_host_intr(ap,qc).
 
-Most legacy IDE drivers use ata_sff_irq_clear() for the irq_clear()
-hook, which simply clears the interrupt and error flags in the DMA
-status register.
+Most legacy IDE drivers use :c:func:`ata_sff_irq_clear` for the
+:c:func:`irq_clear` hook, which simply clears the interrupt and error flags
+in the DMA status register.
 
 SATA phy read/write
 ~~~~~~~~~~~~~~~~~~~
@@ -365,8 +366,8 @@ SATA phy read/write
 
 
 Read and write standard SATA phy registers. Currently only used if
-->phy_reset hook called the sata_phy_reset() helper function. sc_reg
-is one of SCR_STATUS, SCR_CONTROL, SCR_ERROR, or SCR_ACTIVE.
+``->phy_reset`` hook called the :c:func:`sata_phy_reset` helper function.
+sc_reg is one of SCR_STATUS, SCR_CONTROL, SCR_ERROR, or SCR_ACTIVE.
 
 Init and shutdown
 ~~~~~~~~~~~~~~~~~
@@ -378,21 +379,21 @@ Init and shutdown
     void (*host_stop) (struct ata_host_set *host_set);
 
 
-->port_start() is called just after the data structures for each port
+``->port_start()`` is called just after the data structures for each port
 are initialized. Typically this is used to alloc per-port DMA buffers /
 tables / rings, enable DMA engines, and similar tasks. Some drivers also
 use this entry point as a chance to allocate driver-private memory for
-ap->private_data.
+``ap->private_data``.
 
-Many drivers use ata_port_start() as this hook or call it from their
-own port_start() hooks. ata_port_start() allocates space for a legacy
-IDE PRD table and returns.
+Many drivers use :c:func:`ata_port_start` as this hook or call it from their
+own :c:func:`port_start` hooks. :c:func:`ata_port_start` allocates space for
+a legacy IDE PRD table and returns.
 
-->port_stop() is called after ->host_stop(). Its sole function is to
+``->port_stop()`` is called after ``->host_stop()``. Its sole function is to
 release DMA/memory resources, now that they are no longer actively being
 used. Many drivers also free driver-private data from port at this time.
 
-->host_stop() is called after all ->port_stop() calls have completed.
+``->host_stop()`` is called after all ``->port_stop()`` calls have completed.
 The hook must finalize hardware shutdown, release DMA and other
 resources, etc. This hook may be specified as NULL, in which case it is
 not called.
@@ -407,7 +408,8 @@ exceptions doc first.
 Origins of commands
 -------------------
 
-In libata, a command is represented with struct ata_queued_cmd or qc.
+In libata, a command is represented with
+:c:type:`struct ata_queued_cmd <ata_queued_cmd>` or qc.
 qc's are preallocated during port initialization and repetitively used
 for command executions. Currently only one qc is allocated per port but
 yet-to-be-merged NCQ branch allocates one for each tag and maps each qc
@@ -423,17 +425,17 @@ How commands are issued
 -----------------------
 
 Internal commands
-    First, qc is allocated and initialized using ata_qc_new_init().
-    Although ata_qc_new_init() doesn't implement any wait or retry
+    First, qc is allocated and initialized using :c:func:`ata_qc_new_init`.
+    Although :c:func:`ata_qc_new_init` doesn't implement any wait or retry
     mechanism when qc is not available, internal commands are currently
     issued only during initialization and error recovery, so no other
     command is active and allocation is guaranteed to succeed.
 
     Once allocated qc's taskfile is initialized for the command to be
     executed. qc currently has two mechanisms to notify completion. One
-    is via qc->complete_fn() callback and the other is completion
-    qc->waiting. qc->complete_fn() callback is the asynchronous path
-    used by normal SCSI translated commands and qc->waiting is the
+    is via ``qc->complete_fn()`` callback and the other is completion
+    ``qc->waiting``. ``qc->complete_fn()`` callback is the asynchronous path
+    used by normal SCSI translated commands and ``qc->waiting`` is the
     synchronous (issuer sleeps in process context) path used by internal
     commands.
 
@@ -441,21 +443,21 @@ Internal commands
     qc is issued.
 
 SCSI commands
-    All libata drivers use ata_scsi_queuecmd() as hostt->queuecommand
-    callback. scmds can either be simulated or translated. No qc is
-    involved in processing a simulated scmd. The result is computed
-    right away and the scmd is completed.
+    All libata drivers use :c:func:`ata_scsi_queuecmd` as
+    ``hostt->queuecommand`` callback. scmds can either be simulated or
+    translated. No qc is involved in processing a simulated scmd. The
+    result is computed right away and the scmd is completed.
 
-    For a translated scmd, ata_qc_new_init() is invoked to allocate a
+    For a translated scmd, :c:func:`ata_qc_new_init` is invoked to allocate a
     qc and the scmd is translated into the qc. SCSI midlayer's
     completion notification function pointer is stored into
-    qc->scsidone.
+    ``qc->scsidone``.
 
-    qc->complete_fn() callback is used for completion notification. ATA
-    commands use ata_scsi_qc_complete() while ATAPI commands use
-    atapi_qc_complete(). Both functions end up calling qc->scsidone to
-    notify upper layer when the qc is finished. After translation is
-    completed, the qc is issued with ata_qc_issue().
+    ``qc->complete_fn()`` callback is used for completion notification. ATA
+    commands use :c:func:`ata_scsi_qc_complete` while ATAPI commands use
+    :c:func:`atapi_qc_complete`. Both functions end up calling ``qc->scsidone``
+    to notify upper layer when the qc is finished. After translation is
+    completed, the qc is issued with :c:func:`ata_qc_issue`.
 
     Note that SCSI midlayer invokes hostt->queuecommand while holding
     host_set lock, so all above occur while holding host_set lock.
@@ -495,34 +497,34 @@ ATAPI PIO
 How commands are completed
 --------------------------
 
-Once issued, all qc's are either completed with ata_qc_complete() or
+Once issued, all qc's are either completed with :c:func:`ata_qc_complete` or
 time out. For commands which are handled by interrupts,
-ata_host_intr() invokes ata_qc_complete(), and, for PIO tasks,
-pio_task invokes ata_qc_complete(). In error cases, packet_task may
+:c:func:`ata_host_intr` invokes :c:func:`ata_qc_complete`, and, for PIO tasks,
+pio_task invokes :c:func:`ata_qc_complete`. In error cases, packet_task may
 also complete commands.
 
-ata_qc_complete() does the following.
+:c:func:`ata_qc_complete` does the following.
 
 1. DMA memory is unmapped.
 
 2. ATA_QCFLAG_ACTIVE is cleared from qc->flags.
 
-3. qc->complete_fn() callback is invoked. If the return value of the
+3. :c:func:`qc->complete_fn` callback is invoked. If the return value of the
    callback is not zero. Completion is short circuited and
-   ata_qc_complete() returns.
+   :c:func:`ata_qc_complete` returns.
 
-4. __ata_qc_complete() is called, which does
+4. :c:func:`__ata_qc_complete` is called, which does
 
-   1. qc->flags is cleared to zero.
+   1. ``qc->flags`` is cleared to zero.
 
-   2. ap->active_tag and qc->tag are poisoned.
+   2. ``ap->active_tag`` and ``qc->tag`` are poisoned.
 
-   3. qc->waiting is cleared & completed (in that order).
+   3. ``qc->waiting`` is cleared & completed (in that order).
 
-   4. qc is deallocated by clearing appropriate bit in ap->qactive.
+   4. qc is deallocated by clearing appropriate bit in ``ap->qactive``.
 
 So, it basically notifies upper layer and deallocates qc. One exception
-is short-circuit path in #3 which is used by atapi_qc_complete().
+is short-circuit path in #3 which is used by :c:func:`atapi_qc_complete`.
 
 For all non-ATAPI commands, whether it fails or not, almost the same
 code path is taken and very little error handling takes place. A qc is
@@ -531,33 +533,33 @@ otherwise.
 
 However, failed ATAPI commands require more handling as REQUEST SENSE is
 needed to acquire sense data. If an ATAPI command fails,
-ata_qc_complete() is invoked with error status, which in turn invokes
-atapi_qc_complete() via qc->complete_fn() callback.
+:c:func:`ata_qc_complete` is invoked with error status, which in turn invokes
+:c:func:`atapi_qc_complete` via ``qc->complete_fn()`` callback.
 
-This makes atapi_qc_complete() set scmd->result to
+This makes :c:func:`atapi_qc_complete` set ``scmd->result`` to
 SAM_STAT_CHECK_CONDITION, complete the scmd and return 1. As the
-sense data is empty but scmd->result is CHECK CONDITION, SCSI midlayer
-will invoke EH for the scmd, and returning 1 makes ata_qc_complete()
+sense data is empty but ``scmd->result`` is CHECK CONDITION, SCSI midlayer
+will invoke EH for the scmd, and returning 1 makes :c:func:`ata_qc_complete`
 to return without deallocating the qc. This leads us to
-ata_scsi_error() with partially completed qc.
+:c:func:`ata_scsi_error` with partially completed qc.
 
-ata_scsi_error()
-------------------
+:c:func:`ata_scsi_error`
+------------------------
 
-ata_scsi_error() is the current transportt->eh_strategy_handler()
+:c:func:`ata_scsi_error` is the current ``transportt->eh_strategy_handler()``
 for libata. As discussed above, this will be entered in two cases -
 timeout and ATAPI error completion. This function calls low level libata
-driver's eng_timeout() callback, the standard callback for which is
-ata_eng_timeout(). It checks if a qc is active and calls
-ata_qc_timeout() on the qc if so. Actual error handling occurs in
-ata_qc_timeout().
+driver's :c:func:`eng_timeout` callback, the standard callback for which is
+:c:func:`ata_eng_timeout`. It checks if a qc is active and calls
+:c:func:`ata_qc_timeout` on the qc if so. Actual error handling occurs in
+:c:func:`ata_qc_timeout`.
 
-If EH is invoked for timeout, ata_qc_timeout() stops BMDMA and
+If EH is invoked for timeout, :c:func:`ata_qc_timeout` stops BMDMA and
 completes the qc. Note that as we're currently in EH, we cannot call
 scsi_done. As described in SCSI EH doc, a recovered scmd should be
-either retried with scsi_queue_insert() or finished with
-scsi_finish_command(). Here, we override qc->scsidone with
-scsi_finish_command() and calls ata_qc_complete().
+either retried with :c:func:`scsi_queue_insert` or finished with
+:c:func:`scsi_finish_command`. Here, we override ``qc->scsidone`` with
+:c:func:`scsi_finish_command` and calls :c:func:`ata_qc_complete`.
 
 If EH is invoked due to a failed ATAPI qc, the qc here is completed but
 not deallocated. The purpose of this half-completion is to use the qc as
@@ -565,11 +567,11 @@ place holder to make EH code reach this place. This is a bit hackish,
 but it works.
 
 Once control reaches here, the qc is deallocated by invoking
-__ata_qc_complete() explicitly. Then, internal qc for REQUEST SENSE
+:c:func:`__ata_qc_complete` explicitly. Then, internal qc for REQUEST SENSE
 is issued. Once sense data is acquired, scmd is finished by directly
-invoking scsi_finish_command() on the scmd. Note that as we already
+invoking :c:func:`scsi_finish_command` on the scmd. Note that as we already
 have completed and deallocated the qc which was associated with the
-scmd, we don't need to/cannot call ata_qc_complete() again.
+scmd, we don't need to/cannot call :c:func:`ata_qc_complete` again.
 
 Problems with the current EH
 ----------------------------
@@ -583,7 +585,7 @@ Problems with the current EH
 -  When handling timeouts, no action is taken to make device forget
    about the timed out command and ready for new commands.
 
--  EH handling via ata_scsi_error() is not properly protected from
+-  EH handling via :c:func:`ata_scsi_error` is not properly protected from
    usual command processing. On EH entrance, the device is not in
    quiescent state. Timed out commands may succeed or fail any time.
    pio_task and atapi_task may still be running.
@@ -622,6 +624,8 @@ libata Core Internals
 .. kernel-doc:: drivers/ata/libata-core.c
    :internal:
 
+.. kernel-doc:: drivers/ata/libata-eh.c
+
 libata SCSI translation/emulation
 =================================
 
-- 
2.9.3
