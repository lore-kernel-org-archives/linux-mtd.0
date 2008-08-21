Received: from wx-out-0506.google.com ([66.249.82.232])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWBI1-0008W0-1D
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 14:37:29 +0000
Received: by wx-out-0506.google.com with SMTP id h28so10424wxd.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Aug 2008 07:37:28 -0700 (PDT)
Message-ID: <6934efce0808210737w16b5f8dcr1657ea46099e4901@mail.gmail.com>
Date: Thu, 21 Aug 2008 07:37:27 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Sven Wegener" <sven.wegener@stealer.net>
Subject: Re: [PATCH 10/10] AXFS: axfs_uncompress.c
In-Reply-To: <alpine.LNX.1.10.0808211028150.12259@titan.stealer.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD0126.1050609@gmail.com>
	<alpine.LNX.1.10.0808211028150.12259@titan.stealer.net>
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

> Use DEFINE_MUTEX and drop the mutex_init() down in the init function.

okay.  by drop you mean delete?

> axfs_uncompress_init() and axfs_uncompress_exit() are only called during
> init and exit of the module, no need for the initialized variable and the
> functions can be annotated with __init and __exit.

can be annotated or should be?
