Received: from eagle.ericsson.se ([193.180.251.53])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AgRKA-0007bH-Ae
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2004 16:23:26 +0000
From: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1074007799.17620.60.camel@hades.cambridge.redhat.com>
References: <20040113125031.GA5146@angel.research.nokia.com>
	 <1074001140.17620.3.camel@hades.cambridge.redhat.com>
	 <1074007527.9219.11.camel@spawn.uab.ericsson.se>
	 <1074007799.17620.60.camel@hades.cambridge.redhat.com>
Content-Type: text/plain
Message-Id: <1074010874.9216.28.camel@spawn.uab.ericsson.se>
Mime-Version: 1.0
Date: Tue, 13 Jan 2004 17:21:15 +0100
Content-Transfer-Encoding: 7bit
cc: "Jarkko Lavinen \(NMP/Helsinki\)" <jarkko.lavinen@nokia.com>
cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-01-13 at 16:30, David Woodhouse wrote:

> > When I tried to be smart and skip the copy and only read in what needed
> > to be read that was significantly slower.
> 
> Bear in mind that the question was about NAND flash though -- it's not
> directly deferenceable, and you're not going to get the same results.

hmm I reread the firt post why is read so slow?? When I thought about
using nand I read that reading a byte took something like 50 ns. That is
like 20MB per second for an 8 bit device. This is in the region where it
did not pay to be smart,the accesses overhead to do read only what's
needed is greater than the time wasted reading uneccessary data. 
