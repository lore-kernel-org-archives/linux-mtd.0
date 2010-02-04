Received: from mail-bw0-f221.google.com ([209.85.218.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nd5Nt-0004ZQ-M0
	for linux-mtd@lists.infradead.org; Thu, 04 Feb 2010 17:20:58 +0000
Received: by bwz21 with SMTP id 21so2359127bwz.4
	for <linux-mtd@lists.infradead.org>;
	Thu, 04 Feb 2010 09:20:51 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 4 Feb 2010 18:02:35 +0100
Message-ID: <a328840c1002040902ic5c17a8p5262e482b4fced01@mail.gmail.com>
Subject: Emulated write failures cause block marking as bad
From: Marek Skuczynski <mareksk7@gmail.com>
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
   Today, I was trying to use debug option MTD_UBI_DEBUG_EMULATE_WRITE_FAILURES.
   What I have found is that occasionally,  the emulated write error
happens while
   executing sync_erase() function. In result of this, the part that
is calling sync_erase()
   mark the block as bad (see log below).
   After a few minutes I had many bad blocks. Using this option to
volume update test
   makes no sense.

   I am using kernel 2.6.23 with updated UBI  from 2.6.29.
   Have you experienced this problem already ? if so, is this has been fixed ?

   Regards,
     Marek

   static int sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
                      int torture)
   {
        /* ... */
        dbg_wl("erase PEB %d, old EC %llu", e->pnum, ec);

        /* ... */

        err = ubi_io_sync_erase(ubi, e->pnum, torture);
        if (err < 0)
                goto out_free;

        /* ... */

        dbg_wl("erased PEB %d, new EC %llu", e->pnum, ec);

        /* ... */

        err = ubi_io_write_ec_hdr(ubi, e->pnum, ec_hdr);
        if (err) {
                goto out_free;
        }

        /* ... */

out_free:
        /* ... */
        return err;
}

[---CUT---]

UBI DBG (pid 1837): schedule_erase: schedule erasure of PEB 721, EC 3517, tortu0
UBI DBG (pid 458): erase_worker: erase PEB 721 EC 3517
UBI DBG (pid 458): sync_erase: erase PEB 721, old EC 3517
UBI DBG (pid 458): do_sync_erase: erase PEB 721
UBI DBG (pid 458): sync_erase: erased PEB 721, new EC 3518
UBI DBG (pid 458): ubi_io_write_ec_hdr: write EC header to PEB 721
UBI DBG (pid 458): ubi_io_write: write 512 bytes to PEB 721:0
UBI error: ubi_io_write: cannot write 512 bytes to PEB 721:0 (emulated)
Stack: (0x8ca59ec8 to 0x8ca5a000)
9ec0:                   809751ea 00000000 fffffffb 80816cd8 80975950 8ca58000
9ee0: 00000001 80816cd8 000002d1 80b37800 8cdb4600 80b37c7c 00000200 80976cac
9f00: 8ca30770 00000000 00000dbe be0d0000 00000dbd 80a0eb08 ffffff0f 8751ada0
9f20: 00000000 8ca4ca60 80b37800 000002d1 8cdb4600 80976508 00000000 00000000
9f40: 80b37800 80b37c04 80b37800 <7>UBI DBG (pid 1837): ubi_wl_get_peb: PEB 6264
8ca4ca60 8ca58000 809766f6 80b37c3c ffffff0f
9f60: 8ca58000 00000000 80b37c40 80b37c2c 8082819c 00000000 00000000 00000000
9f80: 00000000 80976618 80b37800 <7>UBI DBG (pid 1837): ubi_io_write_vid_hdr: w6
8ca58000 80803664 00000000 00000000 00000000
9fa0: 00000000 00000000 00000000 00000000 8ccbbdf0 80828168 00000000 00000000
9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 <7>UBI DBG8
8ca59fa0
9fe0: 80803660 00000000 40008000 00000000 00000000 00000000 00000000 00000160

Call trace:
[<80816cd8>] printk+0x0/0x28
[<80975950>] ubi_io_write_ec_hdr+0xe0/0x114
[<80816cd8>] printk+0x0/0x28
UBI DBG (pid 1837): ubi_io_write: write 22528 bytes to PEB 626:4096
[<80976cac>] erase_worker+0x164/0x500
[<80a0eb08>] __switch_to_begin+0x24/0x36
[<80976508>] do_work+0x9c/0xf8
[<809766f6>] ubi_thread+0xde/0x1a4
[<8082819c>] kthread+0x34/0x64
[<80976618>] ubi_thread+0x0/0x1a4
[<80803664>] kernel_thread_helper+0x4/0x10
[<80828168>] kthread+0x0/0x64
[<80803660>] kernel_thread_helper+0x0/0x10

UBI error: erase_worker: failed to erase PEB 721, error -5
UBI: reserve more 1 PEBs
UBI DBG (pid 1837): ubi_wl_put_peb: PEB 680
UBI: mark PEB 721 as bad
Bad block table written to 0x07fe0000, version 0x22
Bad block table written to 0x07fc0000, version 0x22
[---CUT---]
