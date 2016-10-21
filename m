Received: from imap.thunk.org ([2600:3c02::f03c:91ff:fe96:be03])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxbII-0002de-UJ
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 14:59:40 +0000
Date: Fri, 21 Oct 2016 10:57:20 -0400
From: Theodore Ts'o <tytso@mit.edu>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dedekind1@gmail.com,
 adrian.hunter@intel.com, jaegeuk@kernel.org, david@sigma-star.at,
 wd@denx.de, sbabic@denx.de, dengler@linutronix.de
Subject: Re: [PATCH 02/26] fscrypto: Constify struct inode pointer
Message-ID: <20161021145720.raaeyivtonf2ynmb@thunk.org>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
 <1477054121-10198-3-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1477054121-10198-3-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 21, 2016 at 02:48:17PM +0200, Richard Weinberger wrote:
> Some filesystems, such as UBIFS, maintain a const pointer
> for struct inode.
> 
>  /* fname.c */
> -extern int fscrypt_setup_filename(struct inode *, const struct qstr *,
> -				int lookup, struct fscrypt_name *);
> +extern int fscrypt_setup_filename(struct inode *dir, const struct qstr *iname,
> +			   int lookup, struct fscrypt_name *fname);

Was it deliberate that you didn't add a const pointer here?

I take it that ubifs is basically using const in certain places to
essentially promise that those functions don't actually modify the
inode structure?

							- Ted
