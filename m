Received: from wproxy.gmail.com ([64.233.184.205])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CuKoc-0005iy-MH
	for linux-mtd@lists.infradead.org; Thu, 27 Jan 2005 20:20:51 -0500
Received: by wproxy.gmail.com with SMTP id 68so333305wra
	for <linux-mtd@lists.infradead.org>;
	Thu, 27 Jan 2005 17:20:49 -0800 (PST)
Message-ID: <6934efce05012717207271fb10@mail.gmail.com>
Date: Thu, 27 Jan 2005 17:20:49 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: MTD List <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Unit test for cfi_cmdset_0001.c
Reply-To: Jared Hulbert <jaredeh@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I plan on creating a unit test based on cutest.sourceforge.net for
cfi_cmdset_0001.c.
In order to stub out the various functions inside I will have to:

1. Manually strip out functions for each version.
2. Add #if''s
3. fork this file into 2-3 files.

I prefer option 3.  As it seems cleaner to me and more maintainable. 
But I want to know which option is more "commitable."   Of course the
test be made availiable, I would hope we can get the tests commited
too.  CuTest is zlib licenced.  Is that a problem?

The reason for the unit tests is to help us find bugs in the code
paths not easily tested and to enable more rapid updates for new flash
or features mtd doesn't currently support.

Thoughts, flames, jokes?

,Jared
