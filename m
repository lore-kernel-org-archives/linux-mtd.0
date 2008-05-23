Received: from mail10.syd.optusnet.com.au ([211.29.132.191])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JzRm6-0004Cy-N5
	for linux-mtd@lists.infradead.org; Fri, 23 May 2008 07:33:15 +0000
Subject: Re: Help needed with MTD on AT91SAM9263-EK please.
From: James <jamessteward@optusnet.com.au>
To: Richard Genoud <richard.genoud@gmail.com>
In-Reply-To: <80b317760805230027n7cbf6ccbpc8289b4b3ad80714@mail.gmail.com>
References: <1211437223.6129.82.camel@Ubuntu-Desktop>
	<80b317760805222326j57e6bc11sfe0beef9ab68267b@mail.gmail.com>
	<1211524684.6203.13.camel@torchwood>
	<80b317760805222352v3701dcc5p7aa0108fb72b2192@mail.gmail.com>
	<1211526311.6203.27.camel@torchwood>
	<80b317760805230027n7cbf6ccbpc8289b4b3ad80714@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 23 May 2008 17:32:52 +1000
Message-Id: <1211527972.6203.44.camel@torchwood>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alessandro Rubini <rubini-list@gnudd.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	michael <trimarchi@gandalf.sssup.it>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 2008-05-23 at 09:27 +0200, Richard Genoud wrote:
> I agree with Alessandro, don't rely to much on sam-ba for nand writing.
> That's why I asked you to do the test from linux (erase/mount/write/read)

Ok.  Thanks.  I'll try again on Monday, method as you suggest.  Although
this doesn't explain why the tests
(flasherase/nandtest/flasherase/nandwrite/nanddump) failed.  I'm not
very sure of the test applications use though.

Regards,
James.
