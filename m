Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYgHf-0007oo-7i
 for linux-mtd@lists.infradead.org; Sun, 16 Dec 2018 23:57:20 +0000
Received: by mail-wr1-x444.google.com with SMTP id u4so9545821wrp.3
 for <linux-mtd@lists.infradead.org>; Sun, 16 Dec 2018 15:57:08 -0800 (PST)
MIME-Version: 1.0
References: <20181020120849.65708-1-houtao1@huawei.com>
In-Reply-To: <20181020120849.65708-1-houtao1@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 17 Dec 2018 00:56:55 +0100
Message-ID: <CAFLxGvzSiFdVmGs4StKkJDyBv698wmLePBnfZwhF0HnEDSmPKA@mail.gmail.com>
Subject: Re: [PATCH] jffs2: ensure wbuf_verify is valid before using it.
To: houtao1@huawei.com
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 boris.brezillon@bootlin.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Oct 20, 2018 at 2:06 PM Hou Tao <houtao1@huawei.com> wrote:
>
> Now MTD emulated by UBI volumn doesn't allocate wbuf_verify in
> jffs2_ubivol_setup(), because UBI can do the verifcation itself,
> so when CONFIG_JFFS2_FS_WBUF_VERIFY is enabled and a MTD device
> emulated by UBI volumn is used, a Oops will occur as show in the
> following trace:
>
>     general protection fault: 0000 [#1] SMP KASAN PTI
>     CPU: 6 PID: 404 Comm: kworker/6:1 Not tainted 4.19.0-rc8
>     Workqueue: events_long delayed_wbuf_sync
>     RIP: 0010:ubi_io_read+0x156/0x650
>     Call Trace:
>      ubi_eba_read_leb+0x57d/0xba0
>      ubi_leb_read+0xe5/0x1b0
>      gluebi_read+0x10c/0x1a0
>      mtd_read+0x112/0x340
>      jffs2_verify_write+0xef/0x440
>      __jffs2_flush_wbuf+0x3fa/0x3540
>      jffs2_flush_wbuf_gc+0x1b1/0x2e0
>      process_one_work+0x58b/0x11e0
>      worker_thread+0x8f/0xfe0
>      kthread+0x2ae/0x3a0
>      ret_from_fork+0x35/0x40
>
> Fix the problem by checking the validity of wbuf_verify before
> using it in jffs2_verify_write().
>
> Cc: stable@vger.kernel.org
> Fixes: 0029da3bf430 ("JFFS2: add UBI support")
> Signed-off-by: Hou Tao <houtao1@huawei.com>

Reviewed-by: Richard Weinberger <richard@nod.at>

BTW: Are you actually using glubi? It is on my list of things I'd like
to kill. :-)

-- 
Thanks,
//richard
