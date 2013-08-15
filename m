Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9xfO-0006GK-Db
 for linux-mtd@lists.infradead.org; Thu, 15 Aug 2013 13:32:43 +0000
Received: from DeadDuck (unknown [172.20.177.82])
 by nsa.nbspaymentsolutions.com (Postfix) with ESMTP id D9E683FC47D
 for <linux-mtd@lists.infradead.org>; Thu, 15 Aug 2013 09:34:06 -0400 (EDT)
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: linux-mtd@lists.infradead.org
Subject: Fail to mount cloned disk image with fastmap.
Date: Thu, 15 Aug 2013 09:29:54 -0400
Message-ID: <87a9kjt73h.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I have back-ported the fastmap code from the 3.0 series to a 2.6.36
kernel on an ARM cpu.  It has been running for some time without issue
and the boot time is reduced by 1/2 second.  I just ran a test over
night with 'pppd' capturing packets and likely filled up the disk.

It appears that my kernel does not boot, so I made a clone of the disk
and then attempt to mount it on my Ubuntu machine with the following,

  modprobe nandsim first_id_byte=0x2c second_id_byte=0xda \
    third_id_byte=0x90 fourth_id_byte=0x95 parts=2,64,64
  flash_erase /dev/mtd3 0 0
  ubiformat /dev/mtd3 -f rootfs.ubi
  modprobe ubi mtd=3 fm_autoconvert=0

Actually at first, I did not specify the 'fm_autoconvert'.  In both
case, the 'modprobe' of the UBI fails with the 3.8 Ubuntu kernel.  I
though that if I specify 'fm_autoconvert=0', none of the 'fastmap' code
should be active?  Should I re-compile without MTD_UBI_FASTMAP to see if
I can mount the file system?  I would like to be able to look at the
file system, even in read-only mode.  The kernel logs are below from the
'ubi' modprobe.  Is there actually an issue here with UBI?  When I try
to mount the 'ubi' partition with,

 mount -t ubifs -o ro /dev/ubi0_3 /mnt/ubifs

additional issues are encountered.  But I think that some of the UBI
issues might be a problem?  Can I use some other flash with a bigger
size so that 'PEBs' can be reserved?

Of course, I have the disk image and can send additional information.

Thanks,
Bill Pringlemeir.

[1232060.158586] ubi: `0' invalid for parameter `ubi.fm_autoconvert'
[1232069.536856] ubi: `0' invalid for parameter `fm_autoconvert_bla'
[1232073.333755] UBI: default fastmap pool size: 95
[1232073.333761] UBI: default fastmap WL pool size: 25
[1232073.333765] UBI: attaching mtd3 to ubi0
[1232073.339804] ------------[ cut here ]------------
[1232073.339814] WARNING: at /build/buildd/linux-3.8.0/drivers/mtd/ubi/fastmap.c:827 ubi_attach_fastmap+0x9b9/0xb50 [ubi]()
[1232073.339815] Hardware name: 421511U
[1232073.339816] Modules linked in: ubi(+) deflate(F) zlib_deflate(F) mtdchar nandsim nand nand_ecc nand_bch bch(F) nand_ids mtd romfs nfnetlink(F) arc4(F) md4(F) nls_utf8 cif
s(F) fscache(F) parport_pc(F) ppdev(F) rfcomm bnep bluetooth binfmt_misc(F) dm_crypt(F) coretemp kvm cdc_subset cdc_eem usbnet snd_hda_codec_realtek snd_hda_intel snd_hda_code
c snd_hwdep(F) snd_pcm(F) snd_page_alloc(F) snd_seq_midi(F) snd_seq_midi_event(F) snd_rawmidi(F) snd_seq(F) gpio_ich snd_seq_device(F) snd_timer(F) mac_hid snd(F) nvidia(POF) wmi soundcore(F) psmouse(F) lpc_ich mei serio_raw(F) lp(F) microcode(F) parport(F) hid_generic ghash_clmulni_intel(F) aesni_intel(F) aes_x86_64(F) xts(F) lrw(F) gf128mul(F) ablk_helper(F) cryptd(F) usbhid hid firewire_ohci 3c59x firewire_core crc_itu_t(F) e1000e(F) [last unloaded: ubi]
[1232073.339854] Pid: 9420, comm: modprobe Tainted: PF       W  O 3.8.0-27-generic #40-Ubuntu
[1232073.339855] Call Trace:
[1232073.339860]  [<ffffffff810587ef>] warn_slowpath_common+0x7f/0xc0
[1232073.339862]  [<ffffffff8105884a>] warn_slowpath_null+0x1a/0x20
[1232073.339866]  [<ffffffffa0f271e9>] ubi_attach_fastmap+0x9b9/0xb50 [ubi]
[1232073.339870]  [<ffffffffa0f27801>] ubi_scan_fastmap+0x441/0x7b0 [ubi]
[1232073.339874]  [<ffffffffa0f24102>] scan_fast+0x192/0x1b0 [ubi]
[1232073.339878]  [<ffffffffa0f248b0>] ubi_attach+0x120/0x240 [ubi]
[1232073.339882]  [<ffffffffa0f17886>] ubi_attach_mtd_dev+0x766/0xe90 [ubi]
[1232073.339886]  [<ffffffffa0e386cd>] ? __get_mtd_device+0x1d/0x80 [mtd]
[1232073.339889]  [<ffffffffa0f3744c>] ubi_init+0x226/0xdda [ubi]
[1232073.339893]  [<ffffffffa0f37226>] ? ubi_mtd_param_parse+0x226/0x226 [ubi]
[1232073.339896]  [<ffffffff8100215a>] do_one_initcall+0x12a/0x180
[1232073.339900]  [<ffffffff810c0127>] load_module+0x10c7/0x1520
[1232073.339902]  [<ffffffff810bba20>] ? unset_module_init_ro_nx+0x80/0x80
[1232073.339904]  [<ffffffff810c0645>] sys_init_module+0xc5/0xf0
[1232073.339907]  [<ffffffff816d521d>] system_call_fastpath+0x1a/0x1f
[1232073.339908] ---[ end trace f20e309ad7ab2d28 ]---
[1232073.339909] UBI error: ubi_scan_fastmap: Attach by fastmap failed, doing a full scan!
[1232073.344416] UBI: scanning is finished
[1232073.344751] UBI assert failed in ubi_wl_init at 1968 (pid 9420)
[1232073.344753] Pid: 9420, comm: modprobe Tainted: PF       W  O 3.8.0-27-generic #40-Ubuntu
[1232073.344754] Call Trace:
[1232073.344764]  [<ffffffffa0f2231e>] ubi_wl_init+0x62e/0x660 [ubi]
[1232073.344768]  [<ffffffffa0f2490b>] ubi_attach+0x17b/0x240 [ubi]
[1232073.344772]  [<ffffffffa0f17886>] ubi_attach_mtd_dev+0x766/0xe90 [ubi]
[1232073.344777]  [<ffffffffa0e386cd>] ? __get_mtd_device+0x1d/0x80 [mtd]
[1232073.344780]  [<ffffffffa0f3744c>] ubi_init+0x226/0xdda [ubi]
[1232073.344783]  [<ffffffffa0f37226>] ? ubi_mtd_param_parse+0x226/0x226 [ubi]
[1232073.344787]  [<ffffffff8100215a>] do_one_initcall+0x12a/0x180
[1232073.344792]  [<ffffffff810c0127>] load_module+0x10c7/0x1520
[1232073.344794]  [<ffffffff810bba20>] ? unset_module_init_ro_nx+0x80/0x80
[1232073.344796]  [<ffffffff810c0645>] sys_init_module+0xc5/0xf0
[1232073.344799]  [<ffffffff816d521d>] system_call_fastpath+0x1a/0x1f
[1232073.344818] UBI warning: print_rsvd_warning: cannot reserve enough PEBs for bad PEB handling, reserved 21, need 40
[1232073.345224] UBI: attached mtd3 (name "NAND simulator partition 3", size 239 MiB) to ubi0
[1232073.345228] UBI: PEB size: 131072 bytes (128 KiB), LEB size: 129024 bytes
[1232073.345231] UBI: min./max. I/O unit sizes: 2048/2048, sub-page size 512
