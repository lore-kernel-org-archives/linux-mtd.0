Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QVMV4-00041k-5v
	for linux-mtd@lists.infradead.org; Sat, 11 Jun 2011 11:37:11 +0000
Received: by fxm14 with SMTP id 14so2903971fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 11 Jun 2011 04:37:08 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 10 Jun 2011 08:23:55 -0300
Message-ID: <BANLkTimFywX1=e+48Wb3qM9Rrvh1vaPJWA@mail.gmail.com>
Subject: [JFFS2] No space for garbage collection
From: Caio <caiortp@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

In my system I use Jffs2 in a NOR Flash (8MB), and there's a daemon
that write a configuration in a periodic time.
After few minutes the filesystem is corrupted and show a message


No space for garbage collection

MTD do_write_oneword(): WRITE 0x007fc0ac(0x00000085)
MTD do_write_oneword(): software timeout
MTD do_write_oneword(): software timeout
MTD do_write_oneword(): software timeout
MTD do_write_oneword(): software timeout
Write of 880 bytes at 0x005fc0ac failed. returned -5, retlen 0
Not marking the space at 0x005fc0ac as dirty because the flash driver returned o
MTD do_write_oneword(): WRITE 0x007fc0ac(0x00000085)
MTD do_write_oneword(): software timeout
MTD do_write_oneword(): software timeout
MTD do_write_oneword(): software timeout
MTD do_write_oneword(): software timeout
Write of 880 bytes at 0x005fc0ac failed. returned -5, retlen 0
Not marking the space at 0x005fc0ac as dirty because the flash driver returned o
Error garbage collecting node at 003112f8!
No space for garbage collection. Aborting GC thread

There's a way to call the garbage collector in my daemon?

I'm using kernel 2.6.30 but with a lot of patches


I applied all MTD/JFFS2 commits of the 2.6.30 to 2.6.31


MTD Patches

0001-mtd-nftl-write-support-is-broken.patch
0002-mtd-nftl-fix-offset-alignments.patch
1837-mtd_blkdevs-dequeue-in-flight-request.patch
2903--MTD-set-blkdev-parent-to-the-mtd-device-not-its-p.patch
2904--MTD-Restore-suspend-resume-support-for-mtd-devices.patch
2905--MTD-Remove-mtd-suspend-resume-calls-from-board.patch
2907--MTD-Remove-option-for-add_mtd_partitions-to-not.patch
3257-mtd-DIL-NetPC-broken-for-now.patch
3258-mtd-Add-armflash-support-for-multiple-blocks-of-fla.patch
3259-mtd-Fix-handling-of-mtdname-in-txx9ndfmc.c.patch
3261-mtd-add-MEMERASE64-ioctl-for-4GiB-devices.patch
3267-mtd-compat_ioctl-cleanup.patch
3268-mtd-add-OOB-ioctls-for-4GiB-devices.patch
3269-mtd-Handle-compat-ioctls-directly-remove-all-trace.patch
3270-mtd-Fix-pointer-handling-in-compat-ioctls-to-use-co.patch
3906-mtd-plat_nand-fix-section-error.patch
3909-mtd-nand-don-t-walk-past-end-of-oobfree.patch
3910-mtd-nand-minor-davinci_nand-cleanup.patch
3911-mtd-nand-davinci_nand-4-bit-ECC-for-smallpage.patch
3912-mtd-nand-fix-512-byte-software-ecc-support.patch
3913-mtd-mxc_nand-add-correct-dev_id-parameter-to-free_.patch
3914-mtd-m25p80-nand-add-m45pe10-ids.patch
3915-mtd-OneNAND-add-support-for-OneNAND-manufactured-b.patch
3916-mtd-davinci_nand-cmdlinepart-uses-MTD-IDs.patch
3917-mtd-add-SST39SF040-chip-to-jedec_probe.patch
3918-mtd-extend-plat_nand-for-read-write-_buf.patch
3919-mtd-CFI-quirk-for-PF38F4476.patch
3920-mtd-CFI-1.0-and-CFI-1.1.patch
3921-mtd-m25p80-add-support-for-Macronix-MX25L12805D.patch
3922-mtd-OneNAND-add-missing-__devexit_p.patch
3923-mtd-remove-pmcmsp-ramroot.c.patch
3924-mtd-plat_nand-add-platform-probe-remove-callbacks.patch
3925-mtd-plat_nand-allow-platform-to-set-partitions.patch
3926-mtd-MXC-NAND-support-for-2KiB-page-size-flashes.patch
3927-mtd-add-on-flash-BBT-support-for-Atmel-NAND-driver.patch
3928-mtd-blackfin-NFC-remove-pointless-return-value-in.patch
3929-mtd-blackfin-NFC-fix-hang-when-using-NAND-on-BF527.patch
3930-mtd-uclinux-allow-systems-to-override-map-addr-siz.patch
3931-mtd-uclinux-do-not-allow-to-be-built-as-a-module.patch
3932-mtd-uclinux-mark-local-stuff-static.patch
3933-mtd-maps-Blackfin-async-fix-memory-leaks-in-probe.patch
3935-mtd-nand-add-OMAP2-OMAP3-NAND-driver.patch
3936-mtd-Flex-OneNAND-support.patch
3937-mtd-onenand-add-bbt_wait-unlock_all-as-replaceab.patch
3940-mtd-nand-s3c2410_nand_setrate-use-correct-macro.patch
3941-mtd-nand-max_retries-off-by-one-in-mxc_nand.patch
3942-mtd-physmap_of-Add-multiple-regions-and-concatenat.patch
4072-mtd-nand-s3c6400-support-for-s3c2410-driver.patch
4073-mtd-orion_nand-use-burst-reads-with-double-word-ac.patch
4279-mtd-nand-Fix-memory-leak-on-txx9ndfmc-probe-failur.patch
5279-trivial-mtd-fix-Kconfig-comment-about-armflash.patch
6043-mtd-OneNAND-Allow-setting-of-boundary-information.patch
6044-sh-Add-support-mtd-mapping-for-highlander.patch
8425-mtd-maps-Remove-BUS_ID_SIZE-from-integrator_flash.patch
8471-mtd-cmdlineparts-Use-64-bit-format-when-printing-a.patch
8472-mtd-atmel_nand-Fix-typo-s-parititions-partitions.patch
8580-mtd-m25p80-timeout-too-short-for-worst-case-m25p16.patch
8603-mtd-Use-BLOCK_NIL-consistently-in-NFTL-INFTL.patch
8609-mtd-nand-fix-build-failure-and-incorrect-return-fr.patch
9940-mtd-let-include-linux-mtd-partitions.h-stand-on-its.patch
9941-mtd-fix-the-conversion-from-dev-to-mtd_info.patch
9942-mtd-blkdevs-do-not-forget-to-get-MTD-devices.patch
9943-mtd-OneNAND-fix-incorrect-bufferram-offset.patch
9944-mtd-OneNAND-OMAP2-3-free-GPMC-CS-on-module-remova.patch
9945-mtd-remove-SBC8240-Wind-River-Device-Driver-Code.patch
9946-mtd-mtdblock-introduce-mtdblks_lock.patch


JFFS2 Patches


3907-Kill-jffs2-user.h.patch
5046-jffs2-move-jffs2_write_super-to-super.c.patch
5079-jffs2-call-jffs2_write_super-from-jffs2_sync_fs.patch
5597-jffs2-leaking-jffs2_summary-in-function-jffs2_scan_.patch
8133-jffs2-fix-another-potential-leak-on-error-path-in-s.patch
8413-switch-jffs2-to-inode-i_acl.patch
9947-jffs2-Fix-return-value-from-jffs2_do_readpage_noloc.patch


My system:
Core: Nios2
NOR Flash: S29JL0674

Creating filesystem
mkfs.jffs2 -l -e64KiB -p -d romfs -D device_table.txt -o romfs.jffs2

Boot:
root=/dev/mtdblock0 rw rootfstype=jffs2


There's something I'm doing wrong? Maybe some ideia to fix this problem?

Thanks

Best Regards,

Caio Pereira


----------------------------------------------
Caio Pereira
