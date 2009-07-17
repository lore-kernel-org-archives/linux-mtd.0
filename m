Received: from e31.co.us.ibm.com ([32.97.110.149])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRnW2-0007eX-HT
	for linux-mtd@lists.infradead.org; Fri, 17 Jul 2009 13:30:30 +0000
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e31.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id n6HDPK6D031649
	for <linux-mtd@lists.infradead.org>; Fri, 17 Jul 2009 07:25:20 -0600
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id
	n6HDU9FN174940
	for <linux-mtd@lists.infradead.org>; Fri, 17 Jul 2009 07:30:09 -0600
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n6HDU8gN005344
	for <linux-mtd@lists.infradead.org>; Fri, 17 Jul 2009 07:30:09 -0600
Subject: Re: [PATCH] Clean up some extra unused arguments in fs/ubifs/
From: Subrata Modak <subrata@linux.vnet.ibm.com>
To: dedekind@infradead.org
In-Reply-To: <1247815718.11353.177.camel@localhost.localdomain>
References: <20090717062101.11440.49299.sendpatchset@subratamodak.linux.ibm.com>
	<1247815718.11353.177.camel@localhost.localdomain>
Content-Type: text/plain
Date: Fri, 17 Jul 2009 18:59:49 +0530
Message-Id: <1247837392.5690.3.camel@subratamodak.linux.ibm.com>
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

On Fri, 2009-07-17 at 10:28 +0300, Artem Bityutskiy wrote:
> On Fri, 2009-07-17 at 11:51 +0530, Subrata Modak wrote:
> > Hi,
> > 
> > "const struct ubifs_info *c" exists as an extra argument for major
> > function definitions under the "fs/ubifs/*" code. The reason why
> > this extra argument exists is based on assumtion that there
> > will be several key schemes. It is possible to add more than one,
> > but we use only one. When there is practically no usage of them
> > presently, they can be removed, and if needed can be added later.
> > 
> > The following patch does that by removing:
> > 1) "const struct ubifs_info *c" where it is not used/necessary,
> > 2) remove xent_key_init_hash() function, as it is also not used,
> > 3) remove data_key_init_flash() function, as it is also not used anywhere,
> 
> Fine with 2 and 3. Not fine with 1, unless it makes the code smaller
> or more optimal.

Hmmm. I see. But, it took 95% of my effort. Ok then, do you want me to
send a separate patch for 2) & 3), or, you will automatically isolate
them from the sent one.

Regards--
Subrata

> 
