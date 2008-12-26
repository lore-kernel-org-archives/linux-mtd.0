Received: from yw-out-1718.google.com ([74.125.46.154])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LGJMy-0001Qa-8G
	for linux-mtd@lists.infradead.org; Fri, 26 Dec 2008 20:33:16 +0000
Received: by yw-out-1718.google.com with SMTP id 5so1415985ywm.72
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Dec 2008 12:33:15 -0800 (PST)
Date: Fri, 26 Dec 2008 15:33:00 -0500
From: Josh Boyer <jwboyer@gmail.com>
To: ARXX Dev Team <arxxdev@gmail.com>
Subject: Re: jffs2 32-bit access issue
Message-ID: <20081226203300.GA13434@zod.rchland.ibm.com>
References: <910818750812260536ke7d67e5l587c7c18a2064bd@mail.gmail.com>
	<20081226140631.GB10864@zod.rchland.ibm.com>
	<910818750812260955p42f2de45t33107c48be7c3f95@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <910818750812260955p42f2de45t33107c48be7c3f95@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 26, 2008 at 12:55:08PM -0500, ARXX Dev Team wrote:
>That is exactly what we have done. Hence we have added calls to

No, it isn't.  If it's what you had done, then your mapping driver
would have taken the 32-bit accesses and acted accordingly and
turned them into two 16-bit reads.

>jffs2_fill_scan_buf(..) in our patch instead of direct access that was
>in jffs2 code. Without MTD layer function calls, jffs2 scan/erase
>functions fail. As you will see in our code patch, we have accessed
>flash data using MTD layer functions (or 16-bit pointers) instead of
>32-bit access that exist in jffs2 code.

I can't exactly read your patch because it seems to be corrupted
somehow.  But I'm not sure those hacks are needed at all.

It seems you are trying to force use of the mtd->point methods
and this doesn't really seem to fit with your hardware.  The
mtd->read function should call your driver, which should be able
to determine what to do for your hardware.

josh
