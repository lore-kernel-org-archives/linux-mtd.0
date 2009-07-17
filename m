Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRnft-0003sc-2m
	for linux-mtd@lists.infradead.org; Fri, 17 Jul 2009 13:40:37 +0000
Subject: Re: [PATCH] Clean up some extra unused arguments in fs/ubifs/
From: Artem Bityutskiy <dedekind@infradead.org>
To: Subrata Modak <subrata@linux.vnet.ibm.com>
In-Reply-To: <4A607D9D.6090301@gmail.com>
References: <20090717062101.11440.49299.sendpatchset@subratamodak.linux.ibm.com>
	<1247815718.11353.177.camel@localhost.localdomain>
	<1247837392.5690.3.camel@subratamodak.linux.ibm.com>
	<4A607D9D.6090301@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 17 Jul 2009 16:40:11 +0300
Message-Id: <1247838011.11353.184.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sachin P Sant <sachinp@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>,
	Stefan Richter <stefanr@s5r6.in-berlin.de>, linux-mtd@lists.infradead.org,
	Adrian Hunter <adrian.hunter@nokia.com>,
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

On Fri, 2009-07-17 at 16:33 +0300, Artem Bityutskiy wrote:
> > Ok then, do you want me to
> > send a separate patch for 2) & 3), or, you will automatically isolate
> > them from the sent one.
> 
> I can isolate them myself, thanks for the patch.

Is this OK?
http://git.infradead.org/ubifs-2.6.git?a=commit;h=d71df6df5752abe700d547016baea801ce868844

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
