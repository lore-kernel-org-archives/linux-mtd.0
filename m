Received: from mail-qc0-f177.google.com ([209.85.216.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SBLJ8-0004H9-Nm
 for linux-mtd@lists.infradead.org; Sat, 24 Mar 2012 07:22:40 +0000
Received: by qcsu28 with SMTP id u28so2760670qcs.36
 for <linux-mtd@lists.infradead.org>; Sat, 24 Mar 2012 00:22:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHMF36Ews_JmsOptgeo1mWJ-yb0tKtaCtBjozbCqa74ck=FLgQ@mail.gmail.com>
References: <CAHMF36G-dXbjZfBMnzEuqK_bkNM81+aCZW5gDHSAKEeyE8VKTg@mail.gmail.com>
 <1331559644.12037.33.camel@sauron.fi.intel.com>
 <CAHMF36ExY=Q2CFgF_V2dVZTsC_znNLGx6wk8GAh5SRKwjJXi3Q@mail.gmail.com>
 <CAHMF36EA-99oYmoBPuOjrohYefTMtoUQ6KLMrMw=XxGmWm3ehQ@mail.gmail.com>
 <1331619893.2443.10.camel@koala>
 <CAHMF36EpG5T2L3GDfgqPKA2XBqw2SipzX1OxXP0SDh==djgcsQ@mail.gmail.com>
 <1331628462.12037.56.camel@sauron.fi.intel.com>
 <CAHMF36G_iE3pEVh1WEVgm5H0p3wsePUxwu9-MCVB+v7vxFf4RQ@mail.gmail.com>
 <1331727617.3730.5.camel@sauron.fi.intel.com>
 <CAHMF36H_+ohHph_mn+iaVnH9Z_WQR0bkQT8Fv8s8cTHE5vV+fg@mail.gmail.com>
 <1331731119.3730.17.camel@sauron.fi.intel.com>
 <CAHMF36Fyb+X_tZjgs1Siu2p1Zbrmu-7TBL73Zf3Rjx3SiyeBjA@mail.gmail.com>
 <1332421678.18717.25.camel@sauron.fi.intel.com>
 <CAHMF36Ews_JmsOptgeo1mWJ-yb0tKtaCtBjozbCqa74ck=FLgQ@mail.gmail.com>
Date: Sat, 24 Mar 2012 08:22:34 +0100
Message-ID: <CAHMF36FjJcd3au5GWFzy-=vfmM1HViLnZJN-HDeDTLyu9R1fSw@mail.gmail.com>
Subject: Re: UBIFS crash (was Re: Problems with mtd_oobtest)
From: Matej Kupljen <matej.kupljen@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

To all,

after reading the posts on the mailing list, with similar problems,  I
believe that
Artem was right already in the beginning where he suggested that I am
experiencing
"unstable bit" issue.

If you look at the kernel log, the dump of the empty space, clearly
shows one bit-flip,
where the first word is read as 0xfffffffd, instead of 0xffffffff.

So, at the moment no solution?

Thanks and best regards,
Matej


>>> # ./integck /mnt/card/
>>> integck: error!: cannot find file-system info
>>> integck: error!: condition '0' failed in get_tested_fs_info() at integc=
k.c:2942
>>> integck: error 0 (Success)
>>>
>>> Any known error?
>>
>> Well, you can always use gdb and look what's going on. I do not think
>> you'll get _that_ level of support on this forum. But most probably this
>> is because /mnt/card is not a ubifs file-system.
>
> Yes, sorry for that to bother you with such question, but I just though m=
aybe
> it has a simple answer.
> However, I managed to run the test now over the night and throughout the
> day I got the following error:
>
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-------------------
> integck: write 3581 bytes, offset 7209, file 984122 (line 903)
> integck: write 9 bytes, offset 94835, file 815280 (line 903)
> integck: creating dir
> /media/card/integck_test_dir_3350/ruhftdazbgbtlgruqmabfpgyfakxrpffgpsirpo=
qihsvcghbylinte)
> integck: write 42 bytes, offset 3, file 114936 (line 903)
> integck: creating file /media/card/integck_test_dir_3350/922415/757218
> (line 640)
> integck: write 963 bytes, offset 2631628, fileintegck: creating file
> /media/card/integck_test_dir_3350/936581 )
> integck: write 92490 bytes, offset 15525383, file 766624 (line 903)
> [22575.864000] UBIFS error (pid 3350): ubifs_scan: corrupt empty space
> at LEB 277:128602
> [22575.868000] UBIFS error (pid 3350): ubifs_scanned_corruption:
> corruption at LEB 277:128602
> [22575.872000] UBIFS error (pid 3350): ubifs_scanned_corruption:
> fir[22575.904000] UBIFS warning (pid 3350): u7
> [22575.908000] [<c002ba14>] (unwind_backtrace+0x0/0xe0) from
> [<c011e2b4>] (ubifs_garbage_collect+0x31c/0x378)
> [22575.912000] [<c011e2b4>] (ubifs_garbage_col9578>] (vfs_write+0xb0/0x15=
c)
> [22575.944000] [<c0089578>] (vfs_write+0xb0/0x15c) from [<c0089a54>]
> (sys_write+0x3c/0x68)
> [22575.948000] [<c0089a54>] (sys_write+0x3c/0x68) from [<c0025e20>]
> (ret_fast_syscall+0x0/0x28)
> [22575.952000] UBIFS error (pid 3721): make_reser[22576.008000] UBIFS
> error (pid 3721): make_reservation: cann0
> [22576.012000] UBIFS error (pid 3721): do_writepage: cannot write page
> 0 of inode 16664, error -30
> [22576.024000] UBIFS error (pid 3721): make_res UBIFS error (pid
> 3721): do_writepage: cannot write page 1259 o0
> [22576.076000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 160 bytes in jhead 1, error -30
> [22576.084000] UBIFS error (pid 3721): ubifs_write_inode: can't write
> inode page 164 of inode 17964, error -30
> [22576.136000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 160 bytes in jhead 1, error -30
> [22576.140000] UBIFS error (pid 3721): ubifs_write_inode: can't write
> inode 17989, error -30
> [22576.152000] UBIFS error (pid 3_write_inode: can't write inode
> 17388, error -30
> [22576.188000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 160 bytes in jhead 1, error -30
> [22576.192000] UBIFS error (pid 3721): ubifs_write_inode: can't write
> inode 18070, error -30
> [22576.204000] UBIFS[22576.240000] UBIFS error (pid 3721):
> make_reservation: cannot reserve 4144 bytes in jhea0
> [22576.244000] UBIFS error (pid 3721): do_writepage: cannot write page
> 3007 of inode 17993, error -30
> [22576.256000] UBIFS error (pid 3721): make_re9, error -30
> integck: failed to write 32768 bytes to offset 15544320 of file 766624
> (line 927, error 30 (Read-only file sys)
> [22576.304000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 4144 bytes in jhead 2, error -30
> [22576.308000] UBIFS error (pi[22576.428000] UBIFS: un-mount UBI
> device 0, volume 0
> [22576.592000] UBIFS: recovery needed
> [22577.772000] UBIFS error (pid 3350): ubifs_scan: corrupt empty space
> at LEB 277:128602
> [22577.776000] UBIFS error (pid 3350): ubifs_scanned_corruption:
> corruption at LEB 277:128602
> [22577.780000] UBIFS error (pid 3350): ubifs_scanned_corruption: first 42=
2:3200
> integck: error 117 (Structure needs cleaning)
> ./integck[0x9adc]
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-------------------
>
> Here is the kernel log:
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-------------------
> [20914.720000] device: 'ubifs_0_0': device_create_release
> [20914.728000] device: 'ubifs_0_0': device_add
> [20914.728000] PM: Adding info for No Bus:ubifs_0_0
> [20914.920000] UBIFS: mounted UBI device 0, volume 0, name "ubi_rootfs"
> [20914.924000] UBIFS: file system size: =A0 107218944 bytes (104706 KiB,
> 102 MiB, 831 LEBs)
> [20914.928000] UBIFS: journal size: =A0 =A0 =A0 9033728 bytes (8822 KiB, =
8
> MiB, 71 LEBs)
> [20914.932000] UBIFS: media format: =A0 =A0 =A0 w4/r0 (latest is w4/r0)
> [20914.936000] UBIFS: default compressor: lzo
> [20914.940000] UBIFS: reserved for root: =A00 bytes (0 KiB)
> [21043.920000] UBIFS: un-mount UBI device 0, volume 0
> [21043.964000] device: 'ubifs_0_0': device_unregister
> [21043.964000] PM: Removing info for No Bus:ubifs_0_0
> [21043.964000] device: 'ubifs_0_0': device_create_release
> [21043.972000] device: 'ubifs_0_0': device_add
> [21043.972000] PM: Adding info for No Bus:ubifs_0_0
> [21044.184000] UBIFS: mounted UBI device 0, volume 0, name "ubi_rootfs"
> [21044.188000] UBIFS: mounted read-only
> [21044.192000] UBIFS: file system size: =A0 107218944 bytes (104706 KiB,
> 102 MiB, 831 LEBs)
> [21044.196000] UBIFS: journal size: =A0 =A0 =A0 9033728 bytes (8822 KiB, =
8
> MiB, 71 LEBs)
> [21044.200000] UBIFS: media format: =A0 =A0 =A0 w4/r0 (latest is w4/r0)
> [21044.204000] UBIFS: default compressor: lzo
> [21044.208000] UBIFS: reserved for root: =A00 bytes (0 KiB)
> [21346.300000] UBIFS: un-mount UBI device 0, volume 0
> [21346.340000] device: 'ubifs_0_0': device_unregister
> [21346.340000] PM: Removing info for No Bus:ubifs_0_0
> [21346.340000] device: 'ubifs_0_0': device_create_release
> [21346.348000] device: 'ubifs_0_0': device_add
> [21346.348000] PM: Adding info for No Bus:ubifs_0_0
> [21346.572000] UBIFS: mounted UBI device 0, volume 0, name "ubi_rootfs"
> [21346.576000] UBIFS: file system size: =A0 107218944 bytes (104706 KiB,
> 102 MiB, 831 LEBs)
> [21346.580000] UBIFS: journal size: =A0 =A0 =A0 9033728 bytes (8822 KiB, =
8
> MiB, 71 LEBs)
> [21346.584000] UBIFS: media format: =A0 =A0 =A0 w4/r0 (latest is w4/r0)
> [21346.592000] UBIFS: default compressor: lzo
> [21346.596000] UBIFS: reserved for root: =A00 bytes (0 KiB)
> [21580.356000] UBI: scrubbed PEB 8 (LEB 0:755), data moved to PEB 243
> [21833.916000] UBIFS: un-mount UBI device 0, volume 0
> [21833.960000] device: 'ubifs_0_0': device_unregister
> [21833.960000] PM: Removing info for No Bus:ubifs_0_0
> [21833.964000] device: 'ubifs_0_0': device_create_release
> [21833.972000] device: 'ubifs_0_0': device_add
> [21833.972000] PM: Adding info for No Bus:ubifs_0_0
> [21834.192000] UBIFS: mounted UBI device 0, volume 0, name "ubi_rootfs"
> [21834.196000] UBIFS: mounted read-only
> [21834.200000] UBIFS: file system size: =A0 107218944 bytes (104706 KiB,
> 102 MiB, 831 LEBs)
> [21834.204000] UBIFS: journal size: =A0 =A0 =A0 9033728 bytes (8822 KiB, =
8
> MiB, 71 LEBs)
> [21834.208000] UBIFS: media format: =A0 =A0 =A0 w4/r0 (latest is w4/r0)
> [21834.212000] UBIFS: default compressor: lzo
> [21834.216000] UBIFS: reserved for root: =A00 bytes (0 KiB)
> [22037.008000] UBIFS: un-mount UBI device 0, volume 0
> [22037.060000] device: 'ubifs_0_0': device_unregister
> [22037.060000] PM: Removing info for No Bus:ubifs_0_0
> [22037.060000] device: 'ubifs_0_0': device_create_release
> [22037.068000] device: 'ubifs_0_0': device_add
> [22037.068000] PM: Adding info for No Bus:ubifs_0_0
> [22037.240000] UBIFS: mounted UBI device 0, volume 0, name "ubi_rootfs"
> [22037.244000] UBIFS: mounted read-only
> [22037.248000] UBIFS: file system size: =A0 107218944 bytes (104706 KiB,
> 102 MiB, 831 LEBs)
> [22037.252000] UBIFS: journal size: =A0 =A0 =A0 9033728 bytes (8822 KiB, =
8
> MiB, 71 LEBs)
> [22037.256000] UBIFS: media format: =A0 =A0 =A0 w4/r0 (latest is w4/r0)
> [22037.260000] UBIFS: default compressor: lzo
> [22037.264000] UBIFS: reserved for root: =A00 bytes (0 KiB)
> [22163.020000] UBIFS: un-mount UBI device 0, volume 0
> [22163.064000] device: 'ubifs_0_0': device_unregister
> [22163.064000] PM: Removing info for No Bus:ubifs_0_0
> [22163.064000] device: 'ubifs_0_0': device_create_release
> [22163.072000] device: 'ubifs_0_0': device_add
> [22163.072000] PM: Adding info for No Bus:ubifs_0_0
> [22163.264000] UBIFS: mounted UBI device 0, volume 0, name "ubi_rootfs"
> [22163.268000] UBIFS: mounted read-only
> [22163.272000] UBIFS: file system size: =A0 107218944 bytes (104706 KiB,
> 102 MiB, 831 LEBs)
> [22163.276000] UBIFS: journal size: =A0 =A0 =A0 9033728 bytes (8822 KiB, =
8
> MiB, 71 LEBs)
> [22163.280000] UBIFS: media format: =A0 =A0 =A0 w4/r0 (latest is w4/r0)
> [22163.284000] UBIFS: default compressor: lzo
> [22163.288000] UBIFS: reserved for root: =A00 bytes (0 KiB)
> [22371.004000] UBI: scrubbed PEB 662 (LEB 0:482), data moved to PEB 634
> [22573.076000] UBI: scrubbed PEB 416 (LEB 0:518), data moved to PEB 634
> [22575.864000] UBIFS error (pid 3350): ubifs_scan: corrupt empty space
> at LEB 277:128602
> [22575.868000] UBIFS error (pid 3350): ubifs_scanned_corruption:
> corruption at LEB 277:128602
> [22575.872000] UBIFS error (pid 3350): ubifs_scanned_corruption: first
> 422 bytes from LEB 277:128602
> [22575.876000] 00000000: fffffffd ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22575.876000] 00000020: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22575.876000] 00000040: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22575.876000] 00000060: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22575.876000] 00000080: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22575.876000] 000000a0: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22575.876000] 000000c0: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22575.876000] 000000e0: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22575.876000] 00000100: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22575.876000] 00000120: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22575.880000] 00000140: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22575.880000] 00000160: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22575.880000] 00000180: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22575.880000] 000001a0: ff ff ff ff ff ff
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 .
> [22575.880000] UBIFS error (pid 3350): ubifs_scan: LEB 277 scanning faile=
d
> [22575.904000] UBIFS warning (pid 3350): ubifs_ro_mode: switched to
> read-only mode, error -117
> [22575.908000] [<c002ba14>] (unwind_backtrace+0x0/0xe0) from
> [<c011e2b4>] (ubifs_garbage_collect+0x31c/0x378)
> [22575.912000] [<c011e2b4>] (ubifs_garbage_collect+0x31c/0x378) from
> [<c0120614>] (ubifs_budget_space+0x45c/0x)
> [22575.916000] [<c0120614>] (ubifs_budget_space+0x45c/0x594) from
> [<c010a818>] (ubifs_write_begin+0x394/0x524)
> [22575.920000] [<c010a818>] (ubifs_write_begin+0x394/0x524) from
> [<c006769c>] (generic_file_buffered_write+0xd)
> [22575.924000] [<c006769c>] (generic_file_buffered_write+0xdc/0x21c)
> from [<c0068b3c>] (__generic_file_aio_wri)
> [22575.928000] [<c0068b3c>] (__generic_file_aio_write+0x404/0x450)
> from [<c0068bec>] (generic_file_aio_write+0)
> [22575.932000] [<c0068bec>] (generic_file_aio_write+0x64/0xc4) from
> [<c0108f44>] (ubifs_aio_write+0x180/0x198)
> [22575.936000] [<c0108f44>] (ubifs_aio_write+0x180/0x198) from
> [<c0088d04>] (do_sync_write+0x98/0xe4)
> [22575.940000] [<c0088d04>] (do_sync_write+0x98/0xe4) from
> [<c0089578>] (vfs_write+0xb0/0x15c)
> [22575.944000] [<c0089578>] (vfs_write+0xb0/0x15c) from [<c0089a54>]
> (sys_write+0x3c/0x68)
> [22575.948000] [<c0089a54>] (sys_write+0x3c/0x68) from [<c0025e20>]
> (ret_fast_syscall+0x0/0x28)
> [22575.952000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 4144 bytes in jhead 2, error -30
> [22575.956000] UBIFS error (pid 3721): do_writepage: cannot write page
> 3006 of inode 17993, error -30
> [22575.964000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 160 bytes in jhead 1, error -30
> [22575.968000] UBIFS error (pid 3721): ubifs_write_inode: can't write
> inode 17993, error -30
> [22575.980000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 160 bytes in jhead 1, error -30
> [22575.984000] UBIFS error (pid 3721): ubifs_write_inode: can't write
> inode 18348, error -30
> [22576.008000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 4144 bytes in jhead 2, error -30
> [22576.012000] UBIFS error (pid 3721): do_writepage: cannot write page
> 0 of inode 16664, error -30
> [22576.024000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 160 bytes in jhead 1, error -30
> [22576.028000] UBIFS error (pid 3721): ubifs_write_inode: can't write
> inode 16664, error -30
> [22576.040000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 160 bytes in jhead 1, error -30
> [22576.044000] UBIFS error (pid 3721): ubifs_write_inode: can't write
> inode 12822, error -30
> [22576.052000] UBIFS error (pid 3350): ubifs_budget_space: cannot
> budget space, error -117
> [22576.064000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 146 bytes in jhead 2, error -30
> [22576.068000] UBIFS error (pid 3721): do_writepage: cannot write page
> 1259 of inode 17504, error -30
> [22576.076000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 160 bytes in jhead 1, error -30
> [22576.084000] UBIFS error (pid 3721): ubifs_write_inode: can't write
> inode 17504, error -30
> [22576.092000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 4144 bytes in jhead 2, error -30
> [22576.096000] UBIFS error (pid 3721): do_writepage: cannot write page
> 411 of inode 17239, error -30
> [22576.104000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 160 bytes in jhead 1, error -30
> [22576.108000] UBIFS error (pid 3721): ubifs_write_inode: can't write
> inode 17239, error -30
> [22576.120000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 4144 bytes in jhead 2, error -30
> [22576.124000] UBIFS error (pid 3721): do_writepage: cannot write page
> 164 of inode 17964, error -30
> [22576.136000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 160 bytes in jhead 1, error -30
> [22576.140000] UBIFS error (pid 3721): ubifs_write_inode: can't write
> inode 17989, error -30
> [22576.152000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 4144 bytes in jhead 2, error -30
> [22576.156000] UBIFS error (pid 3721): do_writepage: cannot write page
> 213 of inode 18394, error -30
> [22576.168000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 160 bytes in jhead 1, error -30
> [22576.172000] UBIFS error (pid 3721): ubifs_write_inode: can't write
> inode 18394, error -30
> [22576.176000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 160 bytes in jhead 1, error -30
> [22576.180000] UBIFS error (pid 3721): ubifs_write_inode: can't write
> inode 17388, error -30
> [22576.188000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 160 bytes in jhead 1, error -30
> [22576.192000] UBIFS error (pid 3721): ubifs_write_inode: can't write
> inode 18070, error -30
> [22576.204000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 4144 bytes in jhead 2, error -30
> [22576.208000] UBIFS error (pid 3721): do_writepage: cannot write page
> 28 of inode 17755, error -30
> [22576.212000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 160 bytes in jhead 1, error -30
> [22576.216000] UBIFS error (pid 3721): ubifs_write_inode: can't write
> inode 17755, error -30
> [22576.224000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 160 bytes in jhead 1, error -30
> [22576.228000] UBIFS error (pid 3721): ubifs_write_inode: can't write
> inode 18088, error -30
> [22576.240000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 4144 bytes in jhead 2, error -30
> [22576.244000] UBIFS error (pid 3721): do_writepage: cannot write page
> 3007 of inode 17993, error -30
> [22576.256000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 4144 bytes in jhead 2, error -30
> [22576.260000] UBIFS error (pid 3721): do_writepage: cannot write page
> 10 of inode 18348, error -30
> [22576.268000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 4144 bytes in jhead 2, error -30
> [22576.272000] UBIFS error (pid 3721): do_writepage: cannot write page
> 2325 of inode 17504, error -30
> [22576.284000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 4144 bytes in jhead 2, error -30
> [22576.288000] UBIFS error (pid 3721): do_writepage: cannot write page
> 412 of inode 17239, error -30
> [22576.304000] UBIFS error (pid 3721): make_reservation: cannot
> reserve 4144 bytes in jhead 2, error -30
> [22576.308000] UBIFS error (pid 3721): do_writepage: cannot write page
> 165 of inode 17964, error -30
> [22576.428000] UBIFS: un-mount UBI device 0, volume 0
> [22576.476000] device: 'ubifs_0_0': device_unregister
> [22576.476000] PM: Removing info for No Bus:ubifs_0_0
> [22576.476000] device: 'ubifs_0_0': device_create_release
> [22576.484000] device: 'ubifs_0_0': device_add
> [22576.484000] PM: Adding info for No Bus:ubifs_0_0
> [22576.592000] UBIFS: recovery needed
> [22577.772000] UBIFS error (pid 3350): ubifs_scan: corrupt empty space
> at LEB 277:128602
> [22577.776000] UBIFS error (pid 3350): ubifs_scanned_corruption:
> corruption at LEB 277:128602
> [22577.780000] UBIFS error (pid 3350): ubifs_scanned_corruption: first
> 422 bytes from LEB 277:128602
> [22577.784000] 00000000: fffffffd ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22577.784000] 00000020: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22577.784000] 00000040: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22577.784000] 00000060: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22577.784000] 00000080: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22577.784000] 000000a0: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22577.784000] 000000c0: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22577.784000] 000000e0: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22577.784000] 00000100: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22577.784000] 00000120: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22577.788000] 00000140: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22577.788000] 00000160: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22577.788000] 00000180: ffffffff ffffffff ffffffff ffffffff ffffffff
> ffffffff ffffffff ffffffff =A0.............
> [22577.788000] 000001a0: ff ff ff ff ff ff
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 .
> [22577.788000] UBIFS error (pid 3350): ubifs_scan: LEB 277 scanning faile=
d
> [22577.792000] UBIFS error (pid 3350): ubifs_rcvry_gc_commit: GC
> failed, error -117
> [22577.832000] device: 'ubifs_0_0': device_unregister
> [22577.832000] PM: Removing info for No Bus:ubifs_0_0
> [22577.832000] device: 'ubifs_0_0': device_create_release
> root@obu4g:~/mtd-utils/tests/fs-tests/integrity#
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-------------------
>
> Is this log of any help for you?
> Should I send anything else?
>
> Thank you and Best Regards,
> Matej
