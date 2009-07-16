Received: from einhorn.in-berlin.de ([192.109.42.8])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRPaz-0007Ls-3X
	for linux-mtd@lists.infradead.org; Thu, 16 Jul 2009 11:57:57 +0000
Message-ID: <4A5F15B0.9030100@s5r6.in-berlin.de>
Date: Thu, 16 Jul 2009 13:57:36 +0200
From: Stefan Richter <stefanr@s5r6.in-berlin.de>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: [PATCH 02/06] Fix compilation warning for fs/ubifs/commit.c
References: <20090715021901.4112.45973.sendpatchset@subratamodak.linux.ibm.com>	
	<1247640750.11353.6.camel@localhost.localdomain>	
	<4A5E1D1A.3090705@s5r6.in-berlin.de>
	<1247738232.11353.90.camel@localhost.localdomain>
	<4A5F0F03.5080507@s5r6.in-berlin.de>
In-Reply-To: <4A5F0F03.5080507@s5r6.in-berlin.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Sachin P Sant <sachinp@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>,
	Subrata Modak <subrata@linux.vnet.ibm.com>,
	Balbir Singh <balbir@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Stefan Richter wrote:
> So, is uninitialized_var() a good fix here?  I'd say it's not a 
> particular good one.  Count the lines of code of dbg_check_old_index() 
> and the maximum indentation level of it.  Then remember the teachings of 
> CodingStyle. :-)  See?  dbg_check_old_index() clearly isn't a prime 
> example of best kernel coding practice.  /Perhaps/ a little bit of 
> refactoring would make it easier to read, and as a bonus side effect, 
> make it unnecessary to use the slightly dangerous and 
> uninitialized_var() macro here.

PS:
On the other hand, it is debug code.  Is it bound to stay in there 
forever?  If not, then it's surely not worth the developer time to 
beautify it.
-- 
Stefan Richter
-=====-==--= -=== =----
http://arcgraph.de/sr/
