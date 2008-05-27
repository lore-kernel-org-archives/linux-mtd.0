Received: from ti-out-0910.google.com ([209.85.142.185])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K0tp8-0004eJ-9f
	for linux-mtd@lists.infradead.org; Tue, 27 May 2008 07:42:22 +0000
Received: by ti-out-0910.google.com with SMTP id a21so1675193tia.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 May 2008 00:42:20 -0700 (PDT)
Message-ID: <80b317760805270042w39c409d4j230c1a2967bf0242@mail.gmail.com>
Date: Tue, 27 May 2008 09:42:18 +0200
From: "Richard Genoud" <richard.genoud@gmail.com>
To: James <jamessteward@optusnet.com.au>
Subject: Re: Help needed with MTD on AT91SAM9263-EK please.
In-Reply-To: <1211755845.6724.29.camel@Ubuntu-Desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1211437223.6129.82.camel@Ubuntu-Desktop>
	<80b317760805222326j57e6bc11sfe0beef9ab68267b@mail.gmail.com>
	<1211524684.6203.13.camel@torchwood>
	<80b317760805222352v3701dcc5p7aa0108fb72b2192@mail.gmail.com>
	<1211526311.6203.27.camel@torchwood>
	<80b317760805230027n7cbf6ccbpc8289b4b3ad80714@mail.gmail.com>
	<1211755845.6724.29.camel@Ubuntu-Desktop>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Alessandro Rubini <rubini-list@gnudd.com>,
	michael <trimarchi@gandalf.sssup.it>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

well, I would say hardware failure, as far as we all used this board
without any problem.
Maybe a last test to be sure :
flash_eraseall /dev/mtd0
dd if=/dev/zero bs=2K count=1 of=/dev/mtd0
nanddump -p -l2048 /dev/mtd0

(try to write a page and read it back).

if you can post this dump, I'm curious...

richard.
