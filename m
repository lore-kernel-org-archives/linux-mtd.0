Received: from mail-pf0-x233.google.com ([2607:f8b0:400e:c00::233])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCiy3-0004sH-AA
 for linux-mtd@lists.infradead.org; Fri, 02 Dec 2016 08:13:16 +0000
Received: by mail-pf0-x233.google.com with SMTP id 189so51641564pfz.3
 for <linux-mtd@lists.infradead.org>; Fri, 02 Dec 2016 00:12:54 -0800 (PST)
Date: Fri, 2 Dec 2016 00:12:49 -0800
From: Eric Biggers <ebiggers@google.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, david@sigma-star.at, tytso@mit.edu,
 dedekind1@gmail.com, mhalcrow@google.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 dengler@linutronix.de, sbabic@denx.de, wd@denx.de
Subject: Re: [PATCH 2/6] fscrypt: Release fscrypt context on in-place
 encryption
Message-ID: <20161202081249.GB18690@google.com>
References: <1480630498-19201-1-git-send-email-richard@nod.at>
 <1480630498-19201-3-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480630498-19201-3-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 01, 2016 at 11:14:54PM +0100, Richard Weinberger wrote:
> From: David Gstir <david@sigma-star.at>
> 
> In case of in-place encryption ctx must be released right away.
> Otherwise ctx is never freed.
> 

I didn't notice this before, but the fscrypt_ctx isn't actually used at all in
the "own pages" crypto case.  So there's really no need to allocate one.  How
about we just handle the "own pages" case at the beginning of
fscrypt_encrypt_page():

	if (inode->i_sb->s_cop->flags & FS_CFLG_OWN_PAGES) {
		err = do_page_crypto(inode, FS_ENCRYPT, lblk_num, page, page,
				     len, offs, gfp_flags);
		if (err)
			return ERR_PTR(err);
		return page;
	}

	(and the rest essentially the same as it used to be)

Eric
