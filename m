Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LTv9B-00008U-Nx
	for linux-mtd@lists.infradead.org; Mon, 02 Feb 2009 09:31:20 +0000
Subject: Re: Regarding UBI scalability
From: Artem Bityutskiy <dedekind@infradead.org>
To: brij.singh@samsung.com
In-Reply-To: <31956721.196931233319535527.JavaMail.weblogic@epml10>
References: <31956721.196931233319535527.JavaMail.weblogic@epml10>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 02 Feb 2009 11:31:18 +0200
Message-Id: <1233567078.7085.62.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-01-30 at 12:45 +0000, BRIJESH SINGH wrote:
> Hi,
>     I have gone through UBI documentation which clearly mentions that
> UBI doesn't scale very well.(Boot time and Memory consumption
> increases with size of device.)This is very similar to JFFS2
> scalability issues. Log, journal(like UBIFS LPT)  combination might
> surely help on this issue.

Right.

>   I would like to work on this enhancement with the community. Before
> that I just wanted to check if any one is already working on it.

No, I do not think so.

>   As this a well known issue, I am sure somebody will have some design
> suggestions. Any design suggestions will be appreciated.

You could look at the old JFFS3 design document:

http://www.linux-mtd.infradead.org/doc/JFFS3design.pdf

at the "The superblock" section, which describes the idea of how to have
a data structure which refers everything else in the media: journal,
root nodes of the trees, etc.

An then you should think about how to store the EBA table on flash. And
how to store the erase counters on the flash. Many ideas may be borrowed
from UBIFS in this area.

I may help you in terms of design suggestions / review, and some code
review. But I do not really have time to seriously work on this.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
