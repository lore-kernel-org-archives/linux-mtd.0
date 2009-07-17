Received: from e39.co.us.ibm.com ([32.97.110.160])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRnhq-0007VO-IS
	for linux-mtd@lists.infradead.org; Fri, 17 Jul 2009 13:42:38 +0000
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e39.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id n6HDc0Bj000487
	for <linux-mtd@lists.infradead.org>; Fri, 17 Jul 2009 07:38:00 -0600
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id
	n6HDgXOE121518
	for <linux-mtd@lists.infradead.org>; Fri, 17 Jul 2009 07:42:33 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n6HDgWIm021861
	for <linux-mtd@lists.infradead.org>; Fri, 17 Jul 2009 07:42:33 -0600
Subject: Re: [PATCH] Clean up some extra unused arguments in fs/ubifs/
From: Subrata Modak <subrata@linux.vnet.ibm.com>
To: dedekind@infradead.org
In-Reply-To: <1247838011.11353.184.camel@localhost.localdomain>
References: <20090717062101.11440.49299.sendpatchset@subratamodak.linux.ibm.com>
	<1247815718.11353.177.camel@localhost.localdomain>
	<1247837392.5690.3.camel@subratamodak.linux.ibm.com>
	<4A607D9D.6090301@gmail.com>
	<1247838011.11353.184.camel@localhost.localdomain>
Content-Type: text/plain
Date: Fri, 17 Jul 2009 19:12:14 +0530
Message-Id: <1247838137.5690.5.camel@subratamodak.linux.ibm.com>
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

On Fri, 2009-07-17 at 16:40 +0300, Artem Bityutskiy wrote:
> On Fri, 2009-07-17 at 16:33 +0300, Artem Bityutskiy wrote:
> > > Ok then, do you want me to
> > > send a separate patch for 2) & 3), or, you will automatically isolate
> > > them from the sent one.
> > 
> > I can isolate them myself, thanks for the patch.
> 
> Is this OK?
> http://git.infradead.org/ubifs-2.6.git?a=commit;h=d71df6df5752abe700d547016baea801ce868844

Yes. Thanks.

Regards--
Subrata

> 
