Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RzW9e-0005XV-Lx
 for linux-mtd@lists.infradead.org; Mon, 20 Feb 2012 16:32:03 +0000
Received: by wera10 with SMTP id a10so4031856wer.36
 for <linux-mtd@lists.infradead.org>; Mon, 20 Feb 2012 08:31:55 -0800 (PST)
Date: Mon, 20 Feb 2012 18:31:45 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Richard Weinberger <rw@linutronix.de>
Subject: Re: [RFC][PATCH 6/7] MTD: UBI: Implement checkpointing support
Message-ID: <20120220183145.6ddbbec0@pixies.home.jungo.com>
In-Reply-To: <1329250006-22944-7-git-send-email-rw@linutronix.de>
References: <1329250006-22944-1-git-send-email-rw@linutronix.de>
 <1329250006-22944-7-git-send-email-rw@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de, tim.bird@am.sony.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 14 Feb 2012 21:06:45 +0100 Richard Weinberger <rw@linutronix.de> wrote:
> Implements UBI checkpointing support.
> It reduces the attaching time from O(N) to O(1).
> Checkpoints are written on demand and upon changes of the volume layout.
> If the recovery from a checkpoint fails we fall back to scanning mode.

Partially reviewed the feature. Great work.
There's some tiny styling/coding issues, will send references if you'd
like.

I'll comment on the feature itself later on.

Meanwhile, there's a potential memleak/crash you might wanna fix.

> +/* Reads the checkpoint data from it's PEBs */
> +struct ubi_scan_info *ubi_read_checkpoint(struct ubi_device *ubi, int cb_sb_pnum)
> +{
> +	struct ubi_cp_sb *cpsb;
> +	struct ubi_vid_hdr *vh;
> +	int ret, i, nblocks;
> +	char *cp_raw;
> +	size_t cp_size;
> +	__be32 data_crc;
> +	unsigned long long sqnum = 0;
> +	struct ubi_scan_info *si = NULL;
> +
> +	cpsb = kmalloc(sizeof(*cpsb), GFP_KERNEL);
> +	if (!cpsb) {
> +		si = ERR_PTR(-ENOMEM);
> +		goto out;
> +	}
> +
> +	ret = ubi_io_read(ubi, cpsb, cb_sb_pnum, ubi->leb_start, sizeof(*cpsb));
> +	if (ret) {
> +		ubi_err("Unable to read checkpoint super block");
> +		si = ERR_PTR(ret);
> +		goto out;

s/goto out/goto free_sb/
(otherwise 'cpsb' not freed)

> +	/* cp_raw will contain the whole checkpoint */
> +	cp_raw = vzalloc(cp_size);

  ...

> +
> +	cpsb = (struct ubi_cp_sb *)cp_raw;

'cpsb' is overwritten, but formerly kmalloced (at the beginning of
ubi_read_checkpoint).
Should free 'cpsb' prior assignment, or alternatively use different
variable then 'cpsb'.

  ...

> +
> +free_vhdr:
> +	ubi_free_vid_hdr(ubi, vh);
> +free_raw:
> +	vfree(cp_raw);
> +free_sb:
> +	kfree(cpsb);

Freeing 'cp_raw' and 'cpsb', but in the normal flow, they point to the
same thing.

Regards,
Shmulik
