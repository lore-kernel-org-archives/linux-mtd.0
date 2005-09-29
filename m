Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EKu1m-0001WD-Rj
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 04:44:52 -0400
Message-ID: <433BA402.3040703@inf.u-szeged.hu>
Date: Thu, 29 Sep 2005 10:21:22 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>
References: <433A640D.6030200@cetrtapot.si>
In-Reply-To: <433A640D.6030200@cetrtapot.si>
Content-Type: text/plain; charset=ISO-8859-2
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

Hi Hinko,

hinko.kocevar@cetrtapot.si wrote:

> Compared to old setup this is GREAAAAAT improvment (if my mesurements
> are correct:). Great job!

Thanks. :)

> We found sumtool utility in tools dir and if my understanding is
> correct it is used to convert jffs2 image with no EBS to jffs2 image
> with EBS.
>
> Is this the only way to upgrade 'old' jffs2 partitions already in
> place (on the nand flash) to use EBS? Thing is, we have several system
> up and running in the wild and would like to upgrade jffs2 partitions
> as-painless-as-possible, preferably without complete reflash of the
> systems.

At this moment: yes, that is the only way. If more people need it we can
implement a special extension for EBS. (but it takes time) This
extension would make possible if user set a special mount option the
system will convert all the non-summarizied erase blocks to summarized.
It would take a lot of time (and need some percent free space), but only
at that mount.

Or you may try our other technique: CS (Centralized Summary). That
technique does not requie user space tool, and cause very fast mount
after any clean umount. (if the umount was not clean the speed will be
same as before). It is not the part of the official JFFS2 now, we would
like to little bit rewrite before bringing on it. But it works already -
use the variant which stores the reference in the first erase block. You
can download it from our webpage ( http://www.inf.u-szeged.hu/jffs2/ ).

Bye,
Ferenc
