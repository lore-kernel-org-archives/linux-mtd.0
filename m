Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJ461-0003Fb-S9
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2016 19:59:43 +0000
Received: by mail-pf0-x244.google.com with SMTP id 144so7926794pfv.0
 for <linux-mtd@lists.infradead.org>; Mon, 19 Dec 2016 11:59:21 -0800 (PST)
Date: Mon, 19 Dec 2016 11:59:18 -0800
From: Eric Biggers <ebiggers3@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: fstests@vger.kernel.org, linux-mtd@lists.infradead.org,
 David Gstir <david@sigma-star.at>, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers <ebiggers@google.com>
Subject: Re: [RFC][PATCH 0/2] xfstests on ubifs
Message-ID: <20161219195918.GB37112@gmail.com>
References: <1482173132-100690-1-git-send-email-ebiggers3@gmail.com>
 <74d2781e-e1db-7aa9-26d0-f1b3d473e064@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74d2781e-e1db-7aa9-26d0-f1b3d473e064@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 19, 2016 at 08:48:52PM +0100, Richard Weinberger wrote:
> 
> BTW: Do you have a xfstests git tree with all your fscrypt related patches?
> 

No, I think you were Cc'ed on all the patches though.  My latest xfstests series
is:

	[PATCH v4 0/6] Add filesystem-level encryption tests

and it depends on the xfsprogs patch:

	[PATCH v2] xfs_io: implement 'set_encpolicy' and 'get_encpolicy' commands

Eric
