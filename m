Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rz7H6-0003nO-0c
 for linux-mtd@lists.infradead.org; Sun, 19 Feb 2012 13:58:01 +0000
Received: by wera10 with SMTP id a10so3364569wer.36
 for <linux-mtd@lists.infradead.org>; Sun, 19 Feb 2012 05:57:57 -0800 (PST)
Date: Sun, 19 Feb 2012 15:57:41 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Richard Weinberger <rw@linutronix.de>
Subject: Re: [RFC][PATCH 7/7] MTD: UBI: wire up checkpointing
Message-ID: <20120219155741.4c2f0a02@pixies.home.jungo.com>
In-Reply-To: <1329250006-22944-8-git-send-email-rw@linutronix.de>
References: <1329250006-22944-1-git-send-email-rw@linutronix.de>
 <1329250006-22944-8-git-send-email-rw@linutronix.de>
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

On Tue, 14 Feb 2012 21:06:46 +0100 Richard Weinberger <rw@linutronix.de> wrote:
> +#ifdef CONFIG_MTD_UBI_CHECKPOINT
> +static int attach_by_checkpointing(struct ubi_device *ubi)
> +{
> +	int cp_start, err;
> +	struct ubi_scan_info *si;
> +
> +	cp_start = ubi_find_checkpoint(ubi);
> +	if (cp_start < 0)
> +		return -ENOENT;
> +
> +	si = ubi_read_checkpoint(ubi, cp_start);
> +	if (IS_ERR(si))
> +		return PTR_ERR(si);
> +
> +	ubi->bad_peb_count = 0;
> +	ubi->good_peb_count = ubi->peb_count;

Zero reported bad PEBs when checkpointing.
Seems that checkpointing does not remember number/location of bad PEBs.
Are we fine with that?

> +#ifdef CONFIG_MTD_UBI_CHECKPOINT
> +	err = attach_by_checkpointing(ubi);
> +
> +	if (err) {
> +		if (err != -ENOENT)
> +			ubi_msg("falling back to attach by scanning mode!\n");
> +
> +		err = attach_by_scanning(ubi);
> +	}

Code does not fit error message.
Message states "falling back to scanning" only if "err != -ENOENT".
However code calls 'attach_by_scanning' regardless 'err'.
Was it your intention?

Regards,
Shmulik
