Received: from ernst.netinsight.se ([212.247.11.2])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EIpq4-0006f5-A0
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2005 11:52:00 -0400
Message-ID: <43341DCD.6090002@users.sourceforge.net>
Date: Fri, 23 Sep 2005 17:22:53 +0200
From: Anders Grafstrom <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: dedekind@infradead.org
References: <E1EHjUk-0001IT-Dn@phoenix.infradead.org>	<43303409.5030406@users.sourceforge.net>
	<43303D59.1040805@yandex.ru>	<433067BF.6080909@users.sourceforge.net>
	<1127399674.28625.18.camel@sauron.oktetlabs.ru>
In-Reply-To: <1127399674.28625.18.camel@sauron.oktetlabs.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/fs/jffs2 erase.c,1.84,1.85 roll back
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityutskiy wrote:
> On Tue, 2005-09-20 at 21:49 +0200, Anders Grafstrom wrote:
> 
>>So if we return -EIO, then we go to jffs2_erase_failed(). For NAND, if 
>>the MTD driver reported erase failure (bad_offset != 0xffffffff), a 
>>retry is made before giving up on the block and marking it bad. Also the 
>>read operation may have failed, erase may have failed and MTD missed it, 
>>write of clean marker may have failed. As it is these cases will put the 
>>block on the bad_list. In the case of NOR it will also be put on the 
>>bad_list at once.
>>But how about retrying for all of these cases?
> 
> 
> Sorry, no more today. What does your patch do? Adds the second try? What
> for?
> 

jffs2 makes a second try if a failed erase is reported by the mtd 
driver. But only for NAND (in jffs2_write_nand_badblock()). What I'm 
after is a retry for NOR as well. But I wrote the patch so it would 
retry for other cases of failure too.

Regards,
  Anders
