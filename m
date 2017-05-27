Date: Sat, 27 May 2017 01:23:38 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Hyunchul Lee <hyc.lee@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, kernel-team@lge.com
Subject: Re: [PATCH] ubifs: Add freeze support
Message-ID: <20170527082338.GC32125@infradead.org>
References: <1495755004-17036-1-git-send-email-hyc.lee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1495755004-17036-1-git-send-email-hyc.lee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> +static int ubifs_freeze_super(struct super_block *sb)
> +{
> +	struct ubifs_info *c = sb->s_fs_info;
> +	int err;
> +
> +	dbg_gen("starting");
> +	/* freeze_super always succeeds if file system is in read-only.
> +	 * however if there are errors, UBIFS is switched to read-only mode.
> +	 * so @ro_error should be checked.
> +	 */
> +	err = freeze_super(sb);
> +	if (!err && c->ro_error) {
> +		thaw_super(sb);
> +		return -EIO;
> +	}
> +	return err;

This is just broken.  First ubifs should still properly propagate
the errors, and second freezing/unfreezing read only file systems is
perfectly valid, and third the freeze_super method is a special
hack for gfs2 that should not gain additional users.
