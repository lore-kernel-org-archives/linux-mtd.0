Received: from mailout02.sul.t-online.com ([194.25.134.17])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Nr4K-0003Ld-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2002 08:57:44 +0000
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paul Nash <paulnash@wildseed.com>,
	"Linux-MTD (E-mail)" <linux-mtd@lists.infradead.org>
From: Wolfgang Denk <wd@denx.de>
Subject: Re: Intel sez: Synchronous Flash and XIP is the future -- thoughts? 
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Mon, 16 Dec 2002 09:07:42 GMT."
             <1914.1040029662@passion.cambridge.redhat.com>
Date: Mon, 16 Dec 2002 10:27:56 +0100
Message-Id: <20021216092801.80539C6139@atlas.denx.de>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

In message <1914.1040029662@passion.cambridge.redhat.com> you wrote:
> 
> The power saving point is fair -- flash does take less power than RAM. But
> if you're _that_ short of power, you're likely to be using expensive (but
> low-power) SRAM, and have the rest of the system so tightly specified that
> you'll be more likely to be using something like eCos on it, not Linux.

Agreed.

> With the chips available today and in the near future, XIP, at least for a
> writable flash chip, makes virtually zero sense on Linux. Anyone who tries
> to tell you otherwise is either on crack, trying to sell you something, or
> both.

Also you might find problems running recent (and future)  kernels  in
XIP  mode  -  the kernel text segment is often not exactly read-only.
Especially when you use one f the existing real-time extensions  (but
not only then). It seems the amount of tweaking that is necessary for
XIP  is  growing  with  each new kernel release - to a level where it
becomes impractical.


Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
A list is only as strong as its weakest link.            -- Don Knuth
