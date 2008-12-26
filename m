Received: from yw-out-1718.google.com ([74.125.46.153])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LGDKs-0003Y2-G8
	for linux-mtd@lists.infradead.org; Fri, 26 Dec 2008 14:06:42 +0000
Received: by yw-out-1718.google.com with SMTP id 5so1374191ywm.72
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Dec 2008 06:06:41 -0800 (PST)
Date: Fri, 26 Dec 2008 09:06:31 -0500
From: Josh Boyer <jwboyer@gmail.com>
To: ARXX Dev Team <arxxdev@gmail.com>
Subject: Re: jffs2 32-bit access issue
Message-ID: <20081226140631.GB10864@zod.rchland.ibm.com>
References: <910818750812260536ke7d67e5l587c7c18a2064bd@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <910818750812260536ke7d67e5l587c7c18a2064bd@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 26, 2008 at 08:36:45AM -0500, ARXX Dev Team wrote:
>Our board has a PowerPC core inside Xilinx Virtex II Pro FPGA. We have
>a Intel Strataflash attached to the FPGA accessed via a 16-bit
>interface. Since our interface to the flash part is 16-bit wide and we
>do not have any chip selects or other mechanisms to prevent 32-bit
>accesses to the part, some of the jffs2 scanning/erasing code fails.
>Hence we had to create the patch below to use MTD layer functions (or
>simple 8/16 bit access code) to correctly access the part instead of
>original jffs2 code that was accessing the flash directly 32-bit wide.
>We are would like your opinion as well as find out if this fix (in
>some form) needs to go back into jffs2 code for parts that cannot be
>accessed 32-bit wide (or need to prevent 32-bit accesses).
>we sincerely appreciate your help,

Why don't you write a custom mapping driver that prevents the 32-bit
accesses at the MTD level?  That seems like a more appropriate place
than sticking it in JFFS2 code, which is supposed to be fairly
hardware independent (with the obvious exception of major flash class
types like NOR, NAND, etc).

josh
