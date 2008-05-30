Received: from el-out-1112.google.com ([209.85.162.179])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K2AD0-0006Se-0k
	for linux-mtd@lists.infradead.org; Fri, 30 May 2008 19:24:14 +0000
Received: by el-out-1112.google.com with SMTP id j27so171137elf.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 30 May 2008 12:24:12 -0700 (PDT)
Message-ID: <6934efce0805301224t5e5d7a01n3b652c4df5324d58@mail.gmail.com>
Date: Fri, 30 May 2008 12:24:11 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Alexey Korolev" <akorolev@infradead.org>
Subject: Re: [BUG] JFFS2 power loss recovery issues in 2.6.25, 2.6.26-rc
In-Reply-To: <alpine.LFD.1.10.0805291205480.22130@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <alpine.LFD.1.10.0805291205480.22130@pentafluge.infradead.org>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> We made some investigations for this issue and found commit number which
> breaks JFFS2 power loss recoverability.
> It is:  [JFFS2] Improve getdents vs. f_pos handling on NOR flash.
>        http://git.infradead.org/mtd-2.6.git?a=commitdiff;h=15953580e79b58caefb107e77f218e009b9992e6
>
> Currently we don't know why it breaks JFFS2 and how it could be fixed
> except roll back.

Does everything work when you unmerge this one commit?
