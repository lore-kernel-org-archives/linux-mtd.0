Received: from e7.ny.us.ibm.com ([32.97.182.137])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRQk3-0006J4-GT
	for linux-mtd@lists.infradead.org; Thu, 16 Jul 2009 13:11:23 +0000
Received: from d01relay07.pok.ibm.com (d01relay07.pok.ibm.com [9.56.227.147])
	by e7.ny.us.ibm.com (8.13.1/8.13.1) with ESMTP id n6GCw0OC011398
	for <linux-mtd@lists.infradead.org>; Thu, 16 Jul 2009 08:58:00 -0400
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d01relay07.pok.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id
	n6GDApOT2580492
	for <linux-mtd@lists.infradead.org>; Thu, 16 Jul 2009 09:10:52 -0400
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n6GDAcQ4007361
	for <linux-mtd@lists.infradead.org>; Thu, 16 Jul 2009 07:10:38 -0600
Subject: Re: [PATCH 02/06] Fix compilation warning for fs/ubifs/commit.c
From: Subrata Modak <subrata@linux.vnet.ibm.com>
To: dedekind@infradead.org
In-Reply-To: <1247748885.11353.156.camel@localhost.localdomain>
References: <20090716124133.25463.33849.sendpatchset@subratamodak.linux.ibm.com>
	<1247748885.11353.156.camel@localhost.localdomain>
Content-Type: text/plain
Date: Thu, 16 Jul 2009 18:40:18 +0530
Message-Id: <1247749820.5572.14.camel@subratamodak.linux.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Sachin P Sant <sachinp@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>,
	Stefan Richter <stefanr@s5r6.in-berlin.de>, linux-mtd@lists.infradead.org,
	Adrian Hunter <adrian.hunter@nokia.com>,
	Balbir Singh <balbir@linux.vnet.ibm.com>
Reply-To: subrata@linux.vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-07-16 at 15:54 +0300, Artem Bityutskiy wrote:
> On Thu, 2009-07-16 at 18:11 +0530, Subrata Modak wrote:
> > does not use:
> > 	"const struct ubifs_info *c"
> > inside the inline function. I do not see any practical usage of
> > "const struct ubifs_info *c" in the functions key_read() and key_write().
> > Is there something which i am missing to understand ?
> > 
> > When i applied the following patch, still the "fs/ubifs/" code compiled fine.
> > If the below fix is correct, i can try fixing some other functions i saw
> > having similar defects.
> 
> Yeah, I think the reason why we have this extra argument there is that
> we assumed there will be several key schemes. It is possible to add more
> than one, but we use only one.
> 
> Since you have already spent your time for this, could you please check
> if removing this 'c' makes the code smaller? If not, I'd prefer not to

Ok. I would let you know soon.

Regards--
Subrata

> remove it.
> 
