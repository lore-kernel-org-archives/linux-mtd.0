Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z25xD-00006F-6X
 for linux-mtd@lists.infradead.org; Mon, 08 Jun 2015 22:55:39 +0000
Message-ID: <55761D51.7000005@nod.at>
Date: Tue, 09 Jun 2015 00:55:13 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 linux-mtd@lists.infradead.org, adrian.hunter@intel.com,
 dedekind1@gmail.com
Subject: Re: [PATCH RESEND] ubifs: Introduce a mount option of force_atime.
References: <1433758060-18614-1-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1433758060-18614-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
Cc: linux-fsdevel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 08.06.2015 um 12:07 schrieb Dongsheng Yang:
> -	ubifs_assert(mutex_is_locked(&ui->ui_mutex));
>  	if (!ui->dirty) {
> +		if (!locked) {
> +			/*
> +			 * It's a little tricky here, there is only one
> +			 * possible user of ubifs_dirty_inode did not do
> +			 * a budget for this inode. At the same time, this
> +			 * user is not holding the ui->ui_mutex. Then if
> +			 * we found ui->ui_mutex is not locked, we can say:
> +			 * we need to do a budget in ubifs_dirty_inode here.
> +			 */
> +			struct ubifs_budget_req req = { .dirtied_ino = 1,
> +					.dirtied_ino_d = ALIGN(ui->data_len, 8) };
> +
> +			ret = ubifs_budget_space(c, &req);
> +			if (ret)
> +				goto out;
> +		}

So, this is the new case when ->dirty_inode() is called via generic_update_time()?
Did you research whether you can detect that case also by looking at the flags parameter?
I'd give I_DIRTY_TIME a try. This way you could get at least rid of the mutex_is_locked()
usage.

Thanks,
//richard
