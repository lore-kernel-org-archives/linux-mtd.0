Received: from mailout03.sul.t-online.com ([194.25.134.81])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18NyoC-0004If-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2002 17:13:36 +0000
To: Nicolas Pitre <nico@cam.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Paul Nash <paulnash@wildseed.com>,
	"Linux-MTD (E-mail)" <linux-mtd@lists.infradead.org>
From: Wolfgang Denk <wd@denx.de>
Subject: Re: Intel sez: Synchronous Flash and XIP is the future -- thoughts? 
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Mon, 16 Dec 2002 12:21:50 EST."
             <Pine.LNX.4.44.0212161215550.25780-100000@xanadu.home>
Date: Mon, 16 Dec 2002 18:43:52 +0100
Message-Id: <20021216174357.5DF01C6139@atlas.denx.de>
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

In message <Pine.LNX.4.44.0212161215550.25780-100000@xanadu.home> you wrote:
> 
> Fortunately on ARM the kernel seems to be sane with .text and .rodata 
> actually being read-only.

Well, on PowerPC the .text and .rodata is read-only, too (normally) -
but only after the patching took place :-(


Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
Computers are not intelligent.  They only think they are.
