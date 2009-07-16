Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRPoQ-0002B2-0g
	for linux-mtd@lists.infradead.org; Thu, 16 Jul 2009 12:11:50 +0000
Subject: Re: [PATCH 02/06] Fix compilation warning for fs/ubifs/commit.c
From: Artem Bityutskiy <dedekind@infradead.org>
To: Stefan Richter <stefanr@s5r6.in-berlin.de>
In-Reply-To: <4A5F15B0.9030100@s5r6.in-berlin.de>
References: <20090715021901.4112.45973.sendpatchset@subratamodak.linux.ibm.com>
	<1247640750.11353.6.camel@localhost.localdomain>
	<4A5E1D1A.3090705@s5r6.in-berlin.de>
	<1247738232.11353.90.camel@localhost.localdomain>
	<4A5F0F03.5080507@s5r6.in-berlin.de>
	<4A5F15B0.9030100@s5r6.in-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 16 Jul 2009 15:11:30 +0300
Message-Id: <1247746290.11353.146.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sachin P Sant <sachinp@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>,
	Subrata Modak <subrata@linux.vnet.ibm.com>,
	Balbir Singh <balbir@linux.vnet.ibm.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-07-16 at 13:57 +0200, Stefan Richter wrote:
> Stefan Richter wrote:
> > So, is uninitialized_var() a good fix here?  I'd say it's not a 
> > particular good one.  Count the lines of code of dbg_check_old_index() 
> > and the maximum indentation level of it.  Then remember the teachings of 
> > CodingStyle. :-)  See?  dbg_check_old_index() clearly isn't a prime 
> > example of best kernel coding practice.  /Perhaps/ a little bit of 
> > refactoring would make it easier to read, and as a bonus side effect, 
> > make it unnecessary to use the slightly dangerous and 
> > uninitialized_var() macro here.
> 
> PS:
> On the other hand, it is debug code.  Is it bound to stay in there 
> forever?  If not, then it's surely not worth the developer time to 
> beautify it.

Yes, it is debugging code. It is doing additional consistency/sanity
checks of the internal data structures when you compile it in and enable
it. And yes, I'd like it to stay there forever, because it is a very
nice tool to catch bugs. In fact, I am really keen of this type of
debugging when you have internal checking functions. They help a lot.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
