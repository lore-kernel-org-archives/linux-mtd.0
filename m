Received: from einhorn.in-berlin.de ([192.109.42.8])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRPPh-0005XH-Uw
	for linux-mtd@lists.infradead.org; Thu, 16 Jul 2009 11:46:18 +0000
Message-ID: <4A5F12FB.2050302@s5r6.in-berlin.de>
Date: Thu, 16 Jul 2009 13:46:03 +0200
From: Stefan Richter <stefanr@s5r6.in-berlin.de>
MIME-Version: 1.0
To: subrata@linux.vnet.ibm.com
Subject: Re: [PATCH 02/06] Fix compilation warning for fs/ubifs/commit.c
References: <20090715021901.4112.45973.sendpatchset@subratamodak.linux.ibm.com>	
	<1247640750.11353.6.camel@localhost.localdomain>	
	<4A5E1D1A.3090705@s5r6.in-berlin.de>	
	<1247738232.11353.90.camel@localhost.localdomain>
	<1247742274.5572.8.camel@subratamodak.linux.ibm.com>
In-Reply-To: <1247742274.5572.8.camel@subratamodak.linux.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Sachin P Sant <sachinp@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>,
	Balbir Singh <balbir@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Subrata Modak wrote:
>> Well, I just thought this type of warnings and way of fixing is very
>> standard because I saw many similar fixes all over the place.
> 
> Correct. There has been other warning fixes i have sent to LKML, where i
> have tweaked the code to fix the compilation, but, code tweaking may not
> be possible in this case.

Wrong goal.  The goal of a patch should be to improve the code.

To remove false-positive warnings from compilation can only be a 
secondary goal.

(See my other post.)

BTW, which compiler do you use?  I quickly enabled ubifs here, first 
without and then with its various sub-uptions, but didn't get a warning 
here with "gcc (Gentoo 4.3.2-r3 p1.6, pie-10.1.5) 4.3.2".
-- 
Stefan Richter
-=====-==--= -=== =----
http://arcgraph.de/sr/
