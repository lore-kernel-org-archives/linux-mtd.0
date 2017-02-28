Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cip5z-00031Z-9B
 for linux-mtd@lists.infradead.org; Tue, 28 Feb 2017 21:14:11 +0000
Subject: Re: FW: power cut test failed on kernel 3.0.35 with imx6
To: "Zhang, Fan (F.)" <fzhang14@yfve.com.cn>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <HE1PR0602MB2972891C2F90EBC8B4ACA52983500@HE1PR0602MB2972.eurprd06.prod.outlook.com>
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <6462fb4b-3114-f478-fcc5-33b59da33b68@nod.at>
Date: Tue, 28 Feb 2017 22:13:42 +0100
MIME-Version: 1.0
In-Reply-To: <HE1PR0602MB2972891C2F90EBC8B4ACA52983500@HE1PR0602MB2972.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Zhang, Fan,

Am 22.02.2017 um 09:44 schrieb Zhang, Fan (F.):
> Hi Richard &ubifs developers
> 　　We have some questions about ubifs, and hope can get some advises from you.
> 　　Now, we are doing the power cut test base on linux 3.0.35,below is our test environment:
> /*=============================*/
>   SOC: IMX6-SOLO
>   KERNEL:3.0.35

This kernel is very old and not supported anymore.

>   NANDFLASH:S34ML02G1 (spansion)
>   TEST CASE: create and write data into files, then remove them. power cut at an random moment.
> /*=============================*/
> 
>         we have finish two phases test, The results of the tests did not meet our expectations, and it is strange. below is our test description.
>   test description：
> /*=============PHASE I==============*/
> 　　The mostly targets failed target with below log:
> 　　
> [    0.000000] Gating GPMI Clock Source before Initialization
> [    0.924871]   [sdhci_detect_sd_present] sd card is not present 
> [    1.055691] UBI error: ubi_io_read: error -74 (ECC error) while reading 40960 bytes from PEB 1163:90112, read 40960 bytes
> [    1.066707] UBIFS error (pid 1): ubifs_recover_leb: corrupt empty space LEB 963:86016, corruption starts at 1065
> [    1.076905] UBIFS error (pid 1): ubifs_scanned_corruption: corruption at LEB 963:87081
> [    1.089718] UBIFS error (pid 1): ubifs_recover_leb: LEB 963 scanning failed
> [    1.132510] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
> [    1.140821] [<8003c834>] (unwind_backtrace+0x0/0xf8) from [<803f2f4c>] (panic+0x74/0x18c)
> [    1.149038] [<803f2f4c>] (panic+0x74/0x18c) from [<80008db4>] (mount_block_root+0x1d4/0x294)
> [    1.157508] [<80008db4>] (mount_block_root+0x1d4/0x294) from [<8000904c>] (prepare_namespace+0x8c/0x1bc)
> [    1.167013] [<8000904c>] (prepare_namespace+0x8c/0x1bc) from [<80008a80>] (kernel_init+0x138/0x190)
> 
> 　　After we analysis, we found that the root cause was because the bit-lip happen at an empty page, so we apply below patch to fix this issue.
> http://patchwork.ozlabs.org/patch/309763/,

Hmm, I don't think that this patch went mainline.
We have now some code to deal with bit flips in empty pages but it turned out to be
more complicated than expected. Please see the kernel git logs.

> /*=============PHASE II==============*/
>                 After we apply this patch, we can't observe any bit-lip @ empty page log issue, but the power cut test still failed with below log:
>   (most of them is master node recover failed)
> 
> [    0.000000] Gating GPMI Clock Source before Initialization
> [    0.924891]   [sdhci_detect_sd_present] sd card is not present 
> [    1.035109] UBI error: ubi_io_read: error -74 (ECC error) while reading 126976 bytes from PEB 1098:4096, read 126976 bytes
> [    1.089315] UBI error: ubi_io_read: error -74 (ECC error) while reading 126976 bytes from PEB 1098:4096, read 126976 bytes
> [    1.100439] UBIFS error (pid 1): ubifs_recover_master_node: failed to recover master node
> [    1.142535] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
> [    1.150847] [<8003c834>] (unwind_backtrace+0x0/0xf8) from [<803f310c>] (panic+0x74/0x18c)
> [    1.159065] [<803f310c>] (panic+0x74/0x18c) from [<80008e24>] (mount_block_root+0x244/0x294)
> [    1.167534] [<80008e24>] (mount_block_root+0x244/0x294) from [<8000904c>] (prepare_namespace+0x8c/0x1bc)
> [    1.177042] [<8000904c>] (prepare_namespace+0x8c/0x1bc) from [<80008a80>] (kernel_init+0x138/0x190)
> [    1.186122] [<80008a80>] (kernel_init+0x138/0x190) from [<80036b64>] (kernel_thread_exit+0x0/0x8)
> 
> our question:
> we observe that before the patch, the power cut failed always because the bit-lip. but after we apply the patch, the power cut failed always cause by master node recovery failed. The results of the tests did not meet our expectations, and it is strange.
> 1,whether this patch is OK or NOT, whether this patch can fix the bit-lip issue BUT cause master node issue

See above.

> 2,why the master node recovery mechanism can’t cover ECC error case from the function ubifs_get_master_node()

Both UBIFS and UBI assume that a block does not render bad all of a sudden.
If suddenly one master node shows ECC errors something really bad happened.
UBIFS *could* continue and mount at this point but then it may fail at some other location.

Thanks,
//richard
