Received: from wx-out-0506.google.com ([66.249.82.226])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWBkR-0001N3-6k
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 15:06:51 +0000
Received: by wx-out-0506.google.com with SMTP id h28so17583wxd.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Aug 2008 08:06:50 -0700 (PDT)
Message-ID: <6934efce0808210806r701f2e3bo677d2bd2da78faec@mail.gmail.com>
Date: Thu, 21 Aug 2008 08:06:50 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH 04/10] AXFS: axfs_inode.c
In-Reply-To: <200808211417.14425.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD00F0.5030403@gmail.com> <200808211417.14425.arnd@arndb.de>
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

> Have you seen any benefit of the rwsem over a simple mutex? I would guess
> that you can never even get into the situation where you get concurrent
> readers since I haven't found a single down_read() in your code, only
> downgrade_write()

We implemented a rwsem here because you can get concurrent readers.
My understanding is that downgrade_write() puts the rewem into the
same state as down_read().  Am I mistaken?
