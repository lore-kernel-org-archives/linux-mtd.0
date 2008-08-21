Received: from yx-out-1718.google.com ([74.125.44.158])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWBue-0001IU-9g
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 15:17:24 +0000
Received: by yx-out-1718.google.com with SMTP id 3so16760yxi.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Aug 2008 08:17:23 -0700 (PDT)
Message-ID: <6934efce0808210817h489bbeafyaf27217ca68bd31e@mail.gmail.com>
Date: Thu, 21 Aug 2008 08:17:21 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH 05/10] AXFS: axfs_profiling.c
In-Reply-To: <200808211706.37761.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD00F8.1030004@gmail.com> <200808211339.37187.arnd@arndb.de>
	<6934efce0808210755n1977e085o63b8b91e84575dc9@mail.gmail.com>
	<200808211706.37761.arnd@arndb.de>
Cc: linux-embedded@vger.kernel.org, carsteno@de.ibm.com,
	=?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> /proc has the same ABI restrictions as sysfs. We more or less stopped
> allowing new files in /proc some 5 years ago for this reason. I didn't
> even read beyond the word /proc to know that what you do here is wrong.
> debugfs is normally easier to use than procfs as well, you just
> define some file_operations with read/write callbacks and call
> debugfs_create_file with the path name below /sys/kernel/debug.

no /proc.
thanks for the explanation.

So /sys/kernel/debug/axfs/volume0 would work?

> 4) no profiling at all
> The profiling code has certainly been useful to you during development,
> and you should keep that code around for your own work on it,
> but maybe you should not push that upstream, because regular users
> are not going to need it.

Nope.  Profiling is absolutely fundamental to how AXFS works.  Read
the [PATCH 00/10] thread again.
