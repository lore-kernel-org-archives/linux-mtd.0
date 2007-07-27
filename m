Received: from wa-out-1112.google.com ([209.85.146.183])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IETFj-0006vM-W5
	for linux-mtd@lists.infradead.org; Fri, 27 Jul 2007 13:05:24 -0400
Received: by wa-out-1112.google.com with SMTP id v33so1001298wah
	for <linux-mtd@lists.infradead.org>;
	Fri, 27 Jul 2007 10:05:22 -0700 (PDT)
Message-ID: <6934efce0707271005w2d8ba5cs4aa9ff66c69e9c2a@mail.gmail.com>
Date: Fri, 27 Jul 2007 10:05:22 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: [PATCH][MTD] mtdpart.c: allow other drivers to get physical
	address of partition
In-Reply-To: <20070727134825.GA9122@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <6934efce0707261704p5e46e238i5b7ee433fc4f5bda@mail.gmail.com>
	<20070727134825.GA9122@lazybastard.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Is there a reason you haven't used point() and unpoint()?

No.  In fact, I do use them.  They give me a virtual address and
protect the AXFS volume from the inevitable impolite rw filesystems on
the same chip.

> What is wrong with those functions?

They don't get me the physical address.
