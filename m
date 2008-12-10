Received: from wf-out-1314.google.com ([209.85.200.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LAW2K-0006L5-8Q
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 20:52:00 +0000
Received: by wf-out-1314.google.com with SMTP id 28so306063wfc.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 Dec 2008 12:51:59 -0800 (PST)
Message-ID: <ecdd5ced0812101251v58e5cc9dw99b56163df3928f2@mail.gmail.com>
Date: Wed, 10 Dec 2008 15:51:59 -0500
From: "Andrew Xiang" <andrewxiang@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: power failure file corruption.
In-Reply-To: <ecdd5ced0812101227y635dc3ddke3f5435a74787de0@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <ecdd5ced0812101227y635dc3ddke3f5435a74787de0@mail.gmail.com>
Cc: anemo@mba.ocn.ne.jp, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I jffs2dumped the whole jffs2 partition and here the grep of the
corrupted inode,

ze     4096, dsize     4096, offset  6881280
         Inode      node at 0x01ae1fc0, totlen 0x00001044, #ino
460, version  1748, isize  6889472, csize     4096, dsize     4096,
offset  6885376
         Inode      node at 0x01ae3004, totlen 0x00001044, #ino
460, version  1749, isize  6893568, csize     4096, dsize     4096,
offset  6889472
         Inode      node at 0x01ae4048, totlen 0x00001044, #ino
460, version  1750, isize  6897664, csize     4096, dsize     4096,
offset  6893568
         Inode      node at 0x01ae508c, totlen 0x00001044, #ino
460, version  1751, isize  6901760, csize     4096, dsize     4096,
offset  6897664
Wrong data_crc at  0x01ae508c, 0x9b86b503 instead of 0xf30eb2c4
Empty space found from 0x01ae60d0 to 0x01b00000
         Unknown    node at 0x01b00000, totlen 0x00000018
         Inode      node at 0x01b00018, totlen 0x00000a9c, #ino
475, version   885, isize  3493888, csize     2648, dsize     2648,
offset  3491240
         Inode      node at 0x01b00ab4, totlen 0x00001044, #ino
475, version   886, isize  3497984, csize     4096, dsize     4096,
offset  3493888
         Inode      node at 0x01b01af8, totlen 0x00001044, #ino
475, version   887, isize  3502080, csize     4096, dsize     4096,
offset  3497984
         Inode      node at 0x01b02b3c, totlen 0x00001044, #ino
475, version   888, isize  3506176, csize     4096, dsize     4096,
offset  3502080
         Inode      node at 0x01b03b80, totlen 0x00001044, #ino
475, version   889, isize  3510272, csize     4096, dsize     4096,
offset  3506176
         Inode      node at 0x01b04bc4, totlen 0x00001044, #ino    475, ver

On Wed, Dec 10, 2008 at 3:27 PM, Andrew Xiang <andrewxiang@gmail.com> wrote:
> While I am reading a file(mounted as squahsfs) and writing a new file
> in a jffs2 partition, power failure happened, the funny thing is that
> the file I am only reading got corrupted. I don't care if the new file
> is corrupt because power failure happened in the middle.
>
> Below is a dump using jffs2dump, Is there a better utility that can
> tell me more about the corruption?
>
>
> # /mnt/nfs/builds/mtd-utils-1.0.1/jffs2dump -vc /mnt/ffs/opt-images/opt2
> [15782.659000] Data CRC 9b86b503 != calculated CRC f30eb2c4 for node at 01ae508c
> Wrong bitmask  at  0x00000000, 0x7368
> Wrong hdr_crc  at  0x000149f8, 0xb097541a instead of 0x59298659
> Wrong bitmask  at  0x000149fc, 0xdd24
> Wrong hdr_crc  at  0x0003b378, 0x5815167f instead of 0x69e99abd
> Wrong bitmask  at  0x0003b37c, 0x0470
> Wrong hdr_crc  at  0x0003fa54, 0x9824d6ff instead of 0x84fd7390
> Wrong bitmask  at  0x0003fa58, 0x1f77
> Wrong hdr_crc  at  0x000ea838, 0xd385f17d instead of 0x30147257
> Wrong bitmask  at  0x000ea83c, 0x5da7
> Wrong hdr_crc  at  0x00140d6c, 0x7e6e5333 instead of 0x7a4b9e57
> Wrong bitmask  at  0x00140d70, 0xd6e6
> Wrong hdr_crc  at  0x00159ba8, 0xc0d1a9b2 instead of 0x038d2e30
> Wrong bitmask  at  0x00159bac, 0x718b
> Wrong hdr_crc  at  0x001782d0, 0x8fca9394 instead of 0xfcd64501
> Wrong bitmask  at  0x001782d4, 0x6b8d
> Wrong hdr_crc  at  0x0019e0c8, 0xe19f7086 instead of 0x8b833bc9
> Wrong bitmask  at  0x0019e0cc, 0x31dc
> Wrong hdr_crc  at  0x00204090, 0x7688ff48 instead of 0xd7d76241
> Wrong bitmask  at  0x00204094, 0xd076
> Wrong hdr_crc  at  0x00210610, 0x1845eb0a instead of 0x0e391d66
> Wrong bitmask  at  0x00210614, 0x7ac0
> Wrong hdr_crc  at  0x002de420, 0x1f126541 instead of 0x154607a6
> Wrong bitmask  at  0x002de424, 0xb685
> Wrong hdr_crc  at  0x00301fac, 0xd9a556c4 instead of 0x236e4537
> Wrong bitmask  at  0x00301fb0, 0xc975
> Wrong hdr_crc  at  0x0034775c, 0x129e9c23 instead of 0x61af2646
> Wrong bitmask  at  0x00347760, 0x96ea
> Wrong hdr_crc  at  0x0037743c, 0x2b1acec7 instead of 0xc4d9ade4
> Wrong bitmask  at  0x00377440, 0xb672
> Wrong hdr_crc  at  0x00394160, 0x48b0afbb instead of 0x23a395bc
> Wrong bitmask  at  0x00394164, 0xd6b0
> Wrong hdr_crc  at  0x003a9084, 0x56784033 instead of 0x23a737de
> Wrong bitmask  at  0x003a9088, 0xdf0b
> Wrong hdr_crc  at  0x003b132c, 0x6ccf713c instead of 0x41ebba64
> Wrong bitmask  at  0x003b1330, 0xeac2
> Wrong hdr_crc  at  0x004cfaa4, 0x117aa44d instead of 0x2a0582c9
> Wrong bitmask  at  0x004cfaa8, 0x4577
> Wrong hdr_crc  at  0x00592ad8, 0x2456bca9 instead of 0x0f2def7f
> Wrong bitmask  at  0x00592adc, 0x39d9
> Wrong hdr_crc  at  0x005d54f0, 0xbe5f2551 instead of 0x3cacbae3
> Wrong bitmask  at  0x005d54f4, 0xfcfe
> Empty space: 0, dirty space: 12984320
>
