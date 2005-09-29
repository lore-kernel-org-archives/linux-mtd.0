Received: from n1.cetrtapot.si ([212.30.80.17])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EKvSf-0004Ou-8x
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 06:17:37 -0400
Message-ID: <433BBED5.4040306@cetrtapot.si>
Date: Thu, 29 Sep 2005 12:15:49 +0200
From: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <433A640D.6030200@cetrtapot.si> <433BA402.3040703@inf.u-szeged.hu>
In-Reply-To: <433BA402.3040703@inf.u-szeged.hu>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ferenc Havasi wrote:
>>We found sumtool utility in tools dir and if my understanding is
>>correct it is used to convert jffs2 image with no EBS to jffs2 image
>>with EBS.
>>
>>Is this the only way to upgrade 'old' jffs2 partitions already in
>>place (on the nand flash) to use EBS? Thing is, we have several system
>>up and running in the wild and would like to upgrade jffs2 partitions
>>as-painless-as-possible, preferably without complete reflash of the
>>systems.
> 
> 
> At this moment: yes, that is the only way. 

Ok, just to be on the right track. I guess we will have to come up with 
the solution using sumtool.

> 
> Or you may try our other technique: CS (Centralized Summary). That
> technique does not requie user space tool, and cause very fast mount
> after any clean umount.

All of our umounts are unclean - or said better application is not 
taking care of umount at all. System may be powered off anytime. Which 
raises another question: Will this impact mount time in long run? Eg. 
after more and more unclean (u)mounts should we expect significant 
performance degradation?

regards,
hinko
