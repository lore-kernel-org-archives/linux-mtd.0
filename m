Received: from mailout06.sul.t-online.com ([194.25.134.19])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Nslo-0003ZX-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Dec 2002 10:46:44 +0000
To: Michal Schulz <mschulz@rose.man.poznan.pl>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Paul Nash <paulnash@wildseed.com>,
	"Linux-MTD (E-mail)" <linux-mtd@lists.infradead.org>
From: Wolfgang Denk <wd@denx.de>
Subject: Re: Intel sez: Synchronous Flash and XIP is the future -- thoughts? 
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Mon, 16 Dec 2002 12:04:50 +0100."
             <Pine.GSO.4.44.0212161155540.15280-100000@rose.man.poznan.pl>
Date: Mon, 16 Dec 2002 12:16:36 +0100
Message-Id: <20021216111641.8FBABC6139@atlas.denx.de>
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

In message <Pine.GSO.4.44.0212161155540.15280-100000@rose.man.poznan.pl> you wrote:
>
> With the XIP in kernel it is relatively simple with 2.2.x serie of
> kernels. I have managed to put most of 2.2.18 kernel onto flash, where it

We also tested this with 2.4.4 on PowerPC.

> was executing from. The most problems are with .rodata section, which is
> not read-only for kernel. It is so because some structures (one passed to

With recent kernels, at least on PPC, there are also places where the
.text  segment  is  written  into.  Some  people  even  find  "binary
patching" a cool idea.

Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-4596-87  Fax: (+49)-8142-4596-88  Email: wd@denx.de
FORTRAN? The syntactically incorrect statement "DO 10 I = 1.10"  will
parse  and  generate  code  creating  a  variable, DO10I, as follows:
"DO10I = 1.10" If that doesn't terrify you, it should.
