Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T7SUk-00008u-NB
 for linux-mtd@lists.infradead.org; Fri, 31 Aug 2012 14:46:52 +0000
Received: by lbbgf7 with SMTP id gf7so1225816lbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 31 Aug 2012 07:46:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACQ1gAhs6E5jHGnTy1RhbnuzKq7uAJk0DeHfi0k73jC_8noiAg@mail.gmail.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
 <1345716615.2848.229.camel@sauron.fi.intel.com>
 <20120823133655.72157b18@pixies.home.jungo.com>
 <1345725030.2848.236.camel@sauron.fi.intel.com>
 <20120823154404.51e31873@pixies.home.jungo.com>
 <1345726686.2848.241.camel@sauron.fi.intel.com>
 <CACQ1gAhs6E5jHGnTy1RhbnuzKq7uAJk0DeHfi0k73jC_8noiAg@mail.gmail.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 31 Aug 2012 16:46:27 +0200
Message-ID: <CACQ1gAiFQfAbKVRfhjy-K31MJP9YchzxmmCo4FJECoKuudeBtw@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] UBI: add max_beb_per1024 parameter / ioctl
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/8/23 Richard Genoud <richard.genoud@gmail.com>:
> I could do some more tests with the final version.
I did some test:
- new ubiattacht/detach with old kernel
- old ubiattacht/detach/mkvol/format/ ubifs mount with new kernel
- new ubi* with new kernel.
- command line ubi.mtd=...
I ran into the case where I asked for 20 PEB reserved for bad PEB handling:
UBI warning: print_rsvd_warning: cannot reserve enough PEBs for bad
PEB handling, reserved 10, need 20
and I did a ubirmvol on a small volume:
# ubirmvol /dev/ubi0 -N toto2
UBI: reserved more 10 PEBs for bad PEB handling
=> that's great, no need to detach and then re-attach

I tested also some values at limits, it seems all right.

BUT, I ran into a bug, I don't know if it's my kernel (as I've got
quite a lot of patches ahead of 3.6 to get my board run), but it's
kind of nasty.
It's not related to this patch serie, I could trigger it with a
3.6-rc1 kernel (and my board-patches).
I get some memory crashing when I do :
flash_erase /dev/mtd2 0 160 (it's a whole mtd partition)
ubiattach -m 2
After that, I can have a OOPS right away, but sometimes not.
but if I run someting (top for exemple) I get an oops then.
So, the memory is beeing corrupted somewhere, but I couldn't find out
exactly where.
But I found that if I comment out the lines :
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -346,8 +346,8 @@ retry:
         */
        err = ubi_scan_add_used(ubi, si, new_seb->pnum, new_seb->ec,
                                vid_hdr, 0);
+//     kfree(new_seb);
+//     ubi_free_vid_hdr(ubi, vid_hdr);
        return err;

 write_error:

I can't trigger an oops any more.

As I can't test with older kernel, I reverted some commits that
touched drivers/mtd/ubi
I reverted all commits from 3.6-rc1 to
4415626732defb5a4567a0a757c7c5baae7ca846 (UBI: amend commentaries WRT
dtype)
and I still can trigger the oops.

Does someone can reproduce that ?

Best regards,
Richard
