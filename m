Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MRQUP-0003Rt-Nc
	for linux-mtd@lists.infradead.org; Thu, 16 Jul 2009 12:55:14 +0000
Subject: Re: [PATCH 02/06] Fix compilation warning for fs/ubifs/commit.c
From: Artem Bityutskiy <dedekind@infradead.org>
To: Subrata Modak <subrata@linux.vnet.ibm.com>
In-Reply-To: <20090716124133.25463.33849.sendpatchset@subratamodak.linux.ibm.com>
References: <20090716124133.25463.33849.sendpatchset@subratamodak.linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 16 Jul 2009 15:54:45 +0300
Message-Id: <1247748885.11353.156.camel@localhost.localdomain>
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

On Thu, 2009-07-16 at 18:11 +0530, Subrata Modak wrote:
> does not use:
> 	"const struct ubifs_info *c"
> inside the inline function. I do not see any practical usage of
> "const struct ubifs_info *c" in the functions key_read() and key_write().
> Is there something which i am missing to understand ?
> 
> When i applied the following patch, still the "fs/ubifs/" code compiled fine.
> If the below fix is correct, i can try fixing some other functions i saw
> having similar defects.

Yeah, I think the reason why we have this extra argument there is that
we assumed there will be several key schemes. It is possible to add more
than one, but we use only one.

Since you have already spent your time for this, could you please check
if removing this 'c' makes the code smaller? If not, I'd prefer not to
remove it.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
