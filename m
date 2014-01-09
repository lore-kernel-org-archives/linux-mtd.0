Received: from mail-qe0-x233.google.com ([2607:f8b0:400d:c02::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W1IHx-0001xG-A0
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2014 16:16:58 +0000
Received: by mail-qe0-f51.google.com with SMTP id 1so3246368qee.38
 for <linux-mtd@lists.infradead.org>; Thu, 09 Jan 2014 08:16:35 -0800 (PST)
Date: Thu, 9 Jan 2014 08:16:30 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [PATCH] fs: jffs2: Add setup code for spi nor flash.
Message-ID: <20140109161630.GB28655@norris-Latitude-E6410>
References: <1386566075-28107-1-git-send-email-sourav.poddar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1386566075-28107-1-git-send-email-sourav.poddar@ti.com>
Cc: linux-mtd@lists.infradead.org, George Cherian <george.cherian@ti.com>,
 dwmw2@infradead.org, balbi@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 09, 2013 at 10:44:35AM +0530, Sourav Poddar wrote:
> Flash need to be setup, while using it for Jffs2 filesystem.
> The setup code checks was not present for serial flash like
> m25p80. As a result of which, internal pointers/buffers are in unknown
> state. This leads to
> a. dumps like below[1] while mounting a jffs2 filesystem.
> b. Hang while doing a mount second time.
> 
> [1]:
> root@am437x-evm:~# sync
> [   84.112640] INFO: trying to register non-static key.
> [   84.117553] the code is fine but needs lockdep annotation.
> [   84.122985] turning off the locking correctness validator.
> [   84.128417] CPU: 0 PID: 1289 Comm: sync Not tainted 3.12.0-67367-g2d1978c-dirty #18
> [   84.136016] [<c001bcb8>] (unwind_backtrace+0x0/0xf0) from [<c0017dd0>] (show_stack+0x10/0x14)
> [   84.144439] [<c0017dd0>] (show_stack+0x10/0x14) from [<c05a69c8>] (dump_stack+0x78/0x94)
> [   84.152465] [<c05a69c8>] (dump_stack+0x78/0x94) from [<c009e2e0>] (__lock_acquire+0x1788/0x1b8c)
> [   84.161132] [<c009e2e0>] (__lock_acquire+0x1788/0x1b8c) from [<c009ec30>] (lock_acquire+0x9c/0x104)
> [   84.170104] [<c009ec30>] (lock_acquire+0x9c/0x104) from [<c005ede8>] (flush_work+0x38/0x78)
> [   84.178375] [<c005ede8>] (flush_work+0x38/0x78) from [<c005eef0>] (__cancel_work_timer+0x84/0x124)
> [   84.187225] [<c005eef0>] (__cancel_work_timer+0x84/0x124) from [<c024c1d4>] (jffs2_sync_fs+0x14/0x38)
> [   84.196380] [<c024c1d4>] (jffs2_sync_fs+0x14/0x38) from [<c013c138>] (sync_fs_one_sb+0x28/0x2c)
> [   84.204986] [<c013c138>] (sync_fs_one_sb+0x28/0x2c) from [<c0115360>] (iterate_supers+0xb0/0xd8)
> [   84.213684] [<c0115360>] (iterate_supers+0xb0/0xd8) from [<c013c228>] (sys_sync+0x3c/0x98)
> [   84.221862] [<c013c228>] (sys_sync+0x3c/0x98) from [<c0013dc0>] (ret_fast_syscall+0x0/0x48)
> 
> The patch fixes the above two issue.

Are you sure this symptom is caused by the cause you note? It doesn't
quite seem obvious to me, but I suppose uninitialized buffers/pointers
can cause a wide range of issues.

> Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
> Signed-off-by: George Cherian <george.cherian@ti.com>
> ---
>  fs/jffs2/fs.c       |    7 +++++++
>  fs/jffs2/os-linux.h |    2 ++
>  2 files changed, 9 insertions(+), 0 deletions(-)
> 
> diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
> index fe3c052..02003f0 100644
> --- a/fs/jffs2/fs.c
> +++ b/fs/jffs2/fs.c
> @@ -725,6 +725,13 @@ static int jffs2_flash_setup(struct jffs2_sb_info *c) {
>  			return ret;
>  	}
>  
> +	/* m25p80 spi flash */
> +	if (jffs2_nor_spi_wbuf_flash(c)) {
> +		ret = jffs2_nor_wbuf_flash_setup(c);

If you add this, you need to add the corresponding cleanup
(jffs2_nor_wbuf_flash_cleanup()) in jffs2_flash_cleanup().

> +		if (ret)
> +			return ret;
> +	}
> +
>  	/* and an UBI volume */
>  	if (jffs2_ubivol(c)) {
>  		ret = jffs2_ubivol_setup(c);
> diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
> index d200a9b..09ba999 100644
> --- a/fs/jffs2/os-linux.h
> +++ b/fs/jffs2/os-linux.h
> @@ -134,6 +134,8 @@ int jffs2_ubivol_setup(struct jffs2_sb_info *c);
>  void jffs2_ubivol_cleanup(struct jffs2_sb_info *c);
>  
>  #define jffs2_nor_wbuf_flash(c) (c->mtd->type == MTD_NORFLASH && ! (c->mtd->flags & MTD_BIT_WRITEABLE))
> +#define jffs2_nor_spi_wbuf_flash(c) \
> +	(c->mtd->type == MTD_NORFLASH && (c->mtd->flags & MTD_CAP_NORFLASH))

How is this check distinct from the existing jffs2_nor_wbuf_flash()
check? Is m25p80 bit-writeable? IOW, are you sure that the following
code doesn't alread cover m25p80?

	/* and Intel "Sibley" flash */
		if (jffs2_nor_wbuf_flash(c)) {
		...

>  int jffs2_nor_wbuf_flash_setup(struct jffs2_sb_info *c);
>  void jffs2_nor_wbuf_flash_cleanup(struct jffs2_sb_info *c);
>  void jffs2_dirty_trigger(struct jffs2_sb_info *c);

Brian
