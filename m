Received: from wproxy.gmail.com ([64.233.184.205])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DEGd5-0008IB-OV
	for linux-mtd@lists.infradead.org; Wed, 23 Mar 2005 19:55:20 -0500
Received: by wproxy.gmail.com with SMTP id 37so288784wra
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Mar 2005 16:55:20 -0800 (PST)
Message-ID: <6934efce05032316553410bfdd@mail.gmail.com>
Date: Wed, 23 Mar 2005 16:55:20 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1111423965.7635.4.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
References: <1110827292.7642.26.camel@windu.rchland.ibm.com>
	<1110828016.7642.29.camel@windu.rchland.ibm.com>
	<1110828565.7642.33.camel@windu.rchland.ibm.com>
	<20050317103418.GA4501@wohnheim.fh-wedel.de>
	<1111423965.7635.4.camel@windu.rchland.ibm.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: lock bit and erase errors
Reply-To: Jared Hulbert <jaredeh@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Me either.  Some kind of test suite would be nice though.  Artem has the
> NAND simulator.  Perhaps someone could make a NOR simulator as well to
> test the CFI stuff?  Any volunteers?

We've got a unit test framework in alpha that would have caught this
assuming tests were run for it.  We'll create a test for this bug to
demonstrate.  Let me get it to a halfway presentable state and get
Legal's stamp of approval to release, then I will send it out.  I'd
like to see what ya'll think about it.  There are also some issues
with the build system we could use some help with.

Can I ftp a tarball somewhere on the hallowed infradead.org or get a
directory in the CVS tree I can commit it to?
