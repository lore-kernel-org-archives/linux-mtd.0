Received: from mail-pg0-x232.google.com ([2607:f8b0:400e:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAtRq-0007W2-Nw
 for linux-mtd@lists.infradead.org; Sun, 27 Nov 2016 07:00:27 +0000
Received: by mail-pg0-x232.google.com with SMTP id x23so44661880pgx.1
 for <linux-mtd@lists.infradead.org>; Sat, 26 Nov 2016 23:00:05 -0800 (PST)
Date: Sat, 26 Nov 2016 23:00:01 -0800
From: Eric Biggers <ebiggers@google.com>
To: David Gstir <david@sigma-star.at>
Cc: Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, dedekind1@gmail.com,
 adrian.hunter@intel.com, jaegeuk@kernel.org, wd@denx.de,
 sbabic@denx.de, dengler@linutronix.de, mhalcrow@google.com,
 hch@infradead.org
Subject: Re: [PATCH 05/29] fscrypt: Let fs select encryption index/tweak
Message-ID: <20161127070001.GD34163@google.com>
References: <1479072072-6844-1-git-send-email-richard@nod.at>
 <1479072072-6844-6-git-send-email-richard@nod.at>
 <20161115184354.GD127180@google.com>
 <98AAB80A-A0BE-4408-A514-DC3B8D19C5F7@sigma-star.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98AAB80A-A0BE-4408-A514-DC3B8D19C5F7@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 24, 2016 at 04:57:51PM +0100, David Gstir wrote:
> 
> > Also, if the intent is just that the 'index' represent the data's offset in
> > filesystem blocks rather than in pages, then perhaps it should be documented as
> > such.  (This would be correct for ext4 and f2fs; they just happen to only
> > support encryption with block_size = PAGE_SIZE currently.)
> 
> Yes, in case of UBIFS it is exactly that.
> 
> However, I'm actually not really happy with the name 'index'. I'd rather call it 'iv' (or 'tweak') directly. In the context of encryption its purpose will be more obvious, especially in regard to the "IV _must_ not be reused" constraint you mentioned above.
> 

Well, the way I'd prefer to think about it is that the filesystem does not
provide an IV directly (it doesn't anyway, since the actual IV is a u8[16]), but
rather the number of the logical block of the file, like 'u64 lblk_num'.  And
that is sufficient to avoid IV reuse.

Eric
