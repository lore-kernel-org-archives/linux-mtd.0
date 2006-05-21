Received: from www346.sakura.ne.jp ([202.181.99.66])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fhm3G-0007hK-1A
	for linux-mtd@lists.infradead.org; Sun, 21 May 2006 07:24:59 -0400
Message-ID: <44704DEE.9030107@ak.jp.nec.com>
Date: Sun, 21 May 2006 20:24:30 +0900
From: KaiGai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <1148150486.3875.251.camel@pmac.infradead.org>
	<1148181725.3284.4.camel@shinybook.infradead.org>
In-Reply-To: <1148181725.3284.4.camel@shinybook.infradead.org>
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2/xattr problems.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> Upon removing a file which presumably has an xattr:
> 
> jffs2_flush_wbuf() called with alloc_sem not locked!

I confirmed it.
If the previous fix is enabled, this problem will be resolved at same time,
because jffs2_reserve_space() is always called to write a delete marker
when xdatum/xref is removed.

Would you wait for a while?

Thanks,

> ------------[ cut here ]------------
> kernel BUG at /root/jffs2/wbuf.c:424!
> invalid opcode: 0000 [#1]
> last sysfs file: /class/mtd/mtd0ro/dev
> Modules linked in: jffs2(U) mtdchar zlib_deflate cs553x_nand(U) nand(U) mtdpart nand_ids mtdcore nand_ecc msr ipv6 ppdev autofs4 hidp rfcomm l2cap bluetooth sunrpc dm_mirror dm_mod video button battery ac lp parport_pc parport nvram sg usbatm atm rtl8150 snd_ac97_codec snd_seq_dummy snd_seq_oss snd_seq_midi_event snd_seq snd_seq_device snd_pcm_oss snd_mixer_oss snd_pcm snd_timer snd soundcore snd_ac97_bus snd_page_alloc ext3 jbd usb_storage sd_mod scsi_mod ohci_hcd ehci_hcd
> CPU:    0
> EIP:    0060:[<c822dc4e>]    Not tainted VLI
> EFLAGS: 00010282   (2.6.16-1.2111_FC5 #1)
> EIP is at __jffs2_flush_wbuf+0x3a/0x7b9 [jffs2]
> eax: 00000038   ebx: 00020000   ecx: c62bcdc0   edx: c82364f1
> esi: 00000001   edi: 004ca028   ebp: c08bc400   esp: c62bcdbc
> ds: 007b   es: 007b   ss: 0068
> Process rm (pid: 4149, threadinfo=c62bc000 task=c09da550)
> Stack: <0>c82364f1 00000994 00000800 00000100 00000000 00000000 0000000c 00000000
>        00000000 c0c5d000 c0c5d800 00000002 c824f628 0000003f 00000003 00000001
>        00020000 00000018 004ca028 c08bc400 c822e545 ffffffff ffffffff ffffffff
> Call Trace:
>  [<c822e545>] jffs2_flash_writev+0x178/0x6ac [jffs2]     [<c824aadb>] nand_read_ecc+0x29/0x2f [nand]
>  [<c822d9aa>] jffs2_flash_read+0x8a/0x22b [jffs2]     [<c822eac1>] jffs2_flash_write+0x48/0x51 [jffs2]
>  [<c822f441>] delete_xattr_ref_node+0x9d/0x115 [jffs2]     [<c822fe00>] delete_xattr_ref+0x1d/0x3b [jffs2]
>  [<c8230560>] jffs2_xattr_delete_inode+0x4d/0x6f [jffs2]     [<c822c5a4>] jffs2_clear_inode+0x1b/0x26 [jffs2]
>  [<c016859d>] clear_inode+0xd5/0x102     [<c0168689>] generic_delete_inode+0xbf/0x113
>  [<c01680d0>] iput+0x64/0x66     [<c0161018>] do_unlinkat+0xa7/0x10e
>  [<c02de11a>] do_page_fault+0x189/0x51d     [<c0102be9>] syscall_call+0x7/0xb
> Code: 00 00 00 0f 84 8d 07 00 00 ff 48 4c 0f 88 b0 13 00 00 31 c0 85 c0 75 1c ff 45 4c 0f 8e ae 13 00 00 68 f1 64 23 c8 e8 57 e0 ee f7 <0f> 0b a8 01 de 64 23 c8 59 8b 85 90 01 00 00 85 c0 0f 84 54 07
> 
-- 
KaiGai Kohei <kaigai@kaigai.gr.jp>
