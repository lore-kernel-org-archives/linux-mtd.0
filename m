Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PO5up-0005ul-Sv
	for linux-mtd@lists.infradead.org; Thu, 02 Dec 2010 09:57:30 +0000
Date: Thu, 2 Dec 2010 10:57:29 +0100
From: Anatolij Gustschin <agust@denx.de>
To: dedekind1@gmail.com
Subject: Re: UBIFS partition on NOR flash not mountable after power cut test
Message-ID: <20101202105729.04c25fc1@wker>
In-Reply-To: <1291264926.14534.32.camel@koala>
References: <20101129195014.19224240@wker> <20101201130534.5b95ce83@wker>
	<20101201164447.2215bc58@wker> <1291264926.14534.32.camel@koala>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, 02 Dec 2010 06:42:06 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:
...
> Looking closer to my own code, I see that I treat PEB as
> "corrupted and should be preserved" if:
> 
> 1. EC header is OK.
> 2. VID header is corrupted.
> 3. data area is not "all 0xFFs".
> 
> And in 'nor_erase_prepare()' we first invalidate the VID header, and
> then invalidate the EC header. So there is a small window where you can
> end up with all 3 conditions to be true.
> 
> The solution is to first invalidate the EC header, and only then the VID
> header. Then in case of the race, we just lose the EC header, but VID
> header will be all-right, and UBI will handle this - it'll move the data
> from this PEB to another one, re-create EC header and use average EC
> count. But if you test this scenario, it will be great!!

I'll test this patch, and already tried to test similar change
but stumbled on another problem, please see more below.

> 
> This patch should help (compile-tested only).
> 
> 
> 
> From 7ddb9cb80ab54d118e2a055ce7a35649070578b1 Mon Sep 17 00:00:00 2001
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Date: Thu, 2 Dec 2010 06:34:01 +0200
> Subject: [PATCH] UBI: fix corrupted PEB detection for NOR flash
> 
> My new shiny code for corrupted PEB detection has NOR specific bug.
> We tread PEB as corrupted and preserve it, if
> 
> 1. EC header is OK.
> 2. VID header is corrupted.
> 3. data area is not "all 0xFFs"
> 
> In case of NOR we have 'nor_erase_prepare()' quirk, which invalidates
> the headers before erasing the PEB. And we invalidate first the VID
> header, and then the EC header. So if a power cut happens after we have
> invalidated the VID header, but before we have invalidated the EC
> header, we end up with a PEB which satisfies the above 3 conditions,
> and the scanning code will treat it as corrupted, and will print
> scary warnings, wrongly.
> 
> This patch fixes the issue by firt invalidating the EC header, then
> invalidating the VID header. In case of power cut inbetween, we still
> just lose the EC header, and UBI can deal with this situation gracefully.
> 
> This patch also adds one irrelevant comment about defining VID header
> buffer on stack.
> 
> Thanks to Anatolij Gustschin <agust@denx.de> for tracking this down.
> 
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Reported-by: Anatolij Gustschin <agust@denx.de>
> ---
>  drivers/mtd/ubi/io.c   |   37 ++++++++++++++++++++++++++++---------
>  drivers/mtd/ubi/scan.c |    4 ++++
>  2 files changed, 32 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
> index c2960ac..3839253 100644
> --- a/drivers/mtd/ubi/io.c
> +++ b/drivers/mtd/ubi/io.c
> @@ -480,12 +480,26 @@ static int nor_erase_prepare(struct ubi_device *ubi, int pnum)
>  	size_t written;
>  	loff_t addr;
>  	uint32_t data = 0;
> +	/*
> +	 * Note, we cannot generally define VID header buffers on stack,
> +	 * because of the way we deal with these buffers (see the heder
> +	 * comment). But we know this is NOR-specific piece of code, so we can
> +	 * do this. But yes, this is error-prone and we should (pre-)allocate
> +	 * VID header buffer instead.
> +	 */
>  	struct ubi_vid_hdr vid_hdr;
>  
> -	addr = (loff_t)pnum * ubi->peb_size + ubi->vid_hdr_aloffset;
> +	/*
> +	 * Note, it is important to first invalidate the EC header, and then
> +	 * VID header. Otherwise a power cut may result in valid EC header and
> +	 * invalid VID header, then UBI will treat this PEB as corrupted and
> +	 * will try to preserve it, print scary warnings. See scan.c header
> +	 * comment for more information.
> +	 */
> +	addr = (loff_t)pnum * ubi->peb_size;
>  	err = ubi->mtd->write(ubi->mtd, addr, 4, &written, (void *)&data);
>  	if (!err) {
> -		addr -= ubi->vid_hdr_aloffset;
> +		addr += ubi->vid_hdr_aloffset;
>  		err = ubi->mtd->write(ubi->mtd, addr, 4, &written,
>  				      (void *)&data);
>  		if (!err)

yesterday I inverted the sequence of magic number's erasure to
first erase EC header magic and then VID header magic as it was
before commit 5b289b56 and thus in the same way as in the hunk
above. I did it to be able to run further tests of robustness
with 8 byte write buffer. Nightly test was running then, but now
after the test cycle 1011 I see another issue while scanning a
corrupted UBIFS node:

...
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 41:252784 (9232 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 41:256928 (5088 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 41:261072 (944 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: hit empty space
UBIFS DBG (pid 1290): ubifs_end_scan: stop scanning LEB 41 at offset 261072
UBIFS DBG (pid 1290): ubifs_recover_leb: 37:0
UBIFS DBG (pid 1290): ubifs_start_scan: scan LEB 37:0
UBI DBG (pid 1290): ubi_leb_read: read 262016 bytes from LEB 0:37:0
UBI DBG (pid 1290): ubi_eba_read_leb: read 262016 bytes from offset 0 of LEB 0:37, PEB 32
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:0 (262016 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:4144 (257872 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:8288 (253728 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:12432 (249584 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:16576 (245440 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:20720 (241296 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:24864 (237152 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:29008 (233008 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:33152 (228864 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:37296 (224720 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:41440 (220576 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:45584 (216432 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:49728 (212288 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:53872 (208144 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:58016 (204000 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:62160 (199856 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:66304 (195712 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:70448 (191568 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:74592 (187424 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:78736 (183280 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:82880 (179136 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:87024 (174992 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:91168 (170848 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:95312 (166704 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:99456 (162560 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:103600 (158416 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:107744 (154272 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:111888 (150128 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:116032 (145984 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:120176 (141840 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:124320 (137696 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:128464 (133552 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:132608 (129408 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:136752 (125264 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:140896 (121120 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:145040 (116976 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:149184 (112832 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:153328 (108688 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning data node
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:157472 (104544 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning unknown node
UBIFS DBG (pid 1290): no_more_nodes: unexpected bad common header at 37:157472
UBIFS DBG (pid 1290): ubifs_recover_leb: look at LEB 37:157472 (104544 bytes left)
UBIFS DBG (pid 1290): ubifs_scan_a_node: scanning unknown node
UBIFS error (pid 1290): ubifs_check_node: bad node type 255
UBIFS error (pid 1290): ubifs_check_node: bad node at LEB 37:157472
	magic          0x6101831
	crc            0xc8580727
	node_type      255 (unknown node)
	group_type     255 (unknown)
	sqnum          1389324
	len            4294967295
node type 255 was not recognized
Call Trace:
[c601fb80] [c0007ecc] show_stack+0x4c/0x16c (unreliable)
[c601fbc0] [c013e980] ubifs_check_node+0x17c/0x308
[c601fbe0] [c0147dec] ubifs_scan_a_node+0x15c/0x2d8
[c601fc10] [c015d1c0] ubifs_recover_leb+0x3f0/0x940
[c601fc80] [c01486fc] replay_buds+0xb4/0xb4c
[c601fd20] [c0149894] ubifs_replay_journal+0x700/0xf48
[c601fda0] [c013b060] ubifs_fill_super+0xda0/0x1600
[c601fe00] [c013cbb4] ubifs_get_sb+0x10c/0x344
[c601fe80] [c007b9a4] vfs_kern_mount+0x60/0x150
[c601fea0] [c007bae4] do_kern_mount+0x40/0x100
[c601fec0] [c00926c0] do_mount+0x40c/0x718
[c601ff10] [c0092a5c] sys_mount+0x90/0xd8
[c601ff40] [c0010b44] ret_from_syscall+0x0/0x38
--- Exception: c01 at 0xfe93d18
    LR = 0x1000347c
UBIFS DBG (pid 1290): no_more_nodes: unexpected bad common header at 37:157472
UBIFS error (pid 1290): ubifs_recover_leb: bad node
UBIFS error (pid 1290): ubifs_scanned_corruption: corruption at LEB 37:157472
UBIFS error (pid 1290): ubifs_scanned_corruption: first 8192 bytes from LEB 37:157472
00000000: 31181006 270758c8 0c331500 00000000 ffffffff ffffffff ff4fffff f3428020  1...'.X..3...............O...B. 
00000020: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
00000040: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
*
00001fc0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
00001fe0: ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff  ................................
UBIFS error (pid 1290): ubifs_recover_leb: LEB 37 scanning failed
UBIFS DBG (pid 1292): ubifs_bg_thread: background thread "ubifs_bgt0_0" stops
UBI DBG (pid 1290): ubi_close_volume: close device 0, volume 0, mode 2
UBI DBG (pid 1290): ubi_close_volume: close device 0, volume 0, mode 1
mount: Structure needs cleaning

At first glance, it seems, a write was interrupted and we have a
corruption in an UBIFS data node and we can't recover.

Thanks for your help and answers so far!
Anatolij
