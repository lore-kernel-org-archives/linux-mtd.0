Received: from rn-out-0910.google.com ([64.233.170.190])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LGGtx-0007HG-Qu
	for linux-mtd@lists.infradead.org; Fri, 26 Dec 2008 17:55:10 +0000
Received: by rn-out-0910.google.com with SMTP id k50so5845267rnd.3
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Dec 2008 09:55:08 -0800 (PST)
Message-ID: <910818750812260955p42f2de45t33107c48be7c3f95@mail.gmail.com>
Date: Fri, 26 Dec 2008 12:55:08 -0500
From: "ARXX Dev Team" <arxxdev@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: jffs2 32-bit access issue
In-Reply-To: <20081226140631.GB10864@zod.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <910818750812260536ke7d67e5l587c7c18a2064bd@mail.gmail.com>
	<20081226140631.GB10864@zod.rchland.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

That is exactly what we have done. Hence we have added calls to
jffs2_fill_scan_buf(..) in our patch instead of direct access that was
in jffs2 code. Without MTD layer function calls, jffs2 scan/erase
functions fail. As you will see in our code patch, we have accessed
flash data using MTD layer functions (or 16-bit pointers) instead of
32-bit access that exist in jffs2 code.


>
> Why don't you write a custom mapping driver that prevents the 32-bit
> accesses at the MTD level?  That seems like a more appropriate place
> than sticking it in JFFS2 code, which is supposed to be fairly
> hardware independent (with the obvious exception of major flash class
> types like NOR, NAND, etc).
>
> josh
>
