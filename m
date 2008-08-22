Received: from wa-out-1112.google.com ([209.85.146.183])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWMyD-0003Jk-4s
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 03:05:49 +0000
Received: by wa-out-1112.google.com with SMTP id v33so80435wah.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Aug 2008 20:05:48 -0700 (PDT)
Message-ID: <6934efce0808212005h30fa16d8w48833e8a0becfd8c@mail.gmail.com>
Date: Thu, 21 Aug 2008 20:05:48 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Phillip Lougher" <phillip@lougher.demon.co.uk>
Subject: Re: [PATCH 06/10] AXFS: axfs_super.c
In-Reply-To: <48AE19AD.1020209@lougher.demon.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD0101.4020505@gmail.com> <48AE19AD.1020209@lougher.demon.co.uk>
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> From this it would appear that if the region data can't be mapped XIP (i.e.
> it is compressed or on a block device), it is cached in its entirety in RAM?

That is correct.

> This implies for block devices that the entire filesystem metadata has to be
> cached in RAM.  This severely limits the size of AXFS filesystems when using
> block devices, or the else memory usage will be excessive.

This is where 64bit squashfs could be a better fit.
