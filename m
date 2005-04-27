Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DQj0n-0000FE-2I
	for linux-mtd@lists.infradead.org; Wed, 27 Apr 2005 05:39:18 -0400
Message-ID: <426F5DD0.8050008@inf.u-szeged.hu>
Date: Wed, 27 Apr 2005 11:39:28 +0200
From: Zoltan Sogor <weth@inf.u-szeged.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <loom.20050413T142519-107@post.gmane.org>	<425E3174.4030308@inf.u-szeged.hu>	<Pine.LNX.4.58.0504141014400.3328@phoenix.infradead.org>	<loom.20050420T165531-253@post.gmane.org>	<4267B8EF.6000803@inf.u-szeged.hu>
	<1114097490.21485.1.camel@sauron.oktetlabs.ru>
	<426E439A.2050301@inf.u-szeged.hu> <426E4745.5050606@oktetlabs.ru>
In-Reply-To: <426E4745.5050606@oktetlabs.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dedekind@oktetlabs.ru
Subject: Re: mounting jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem!

Artem B. Bityuckiy wrote:

> Hello Zoltan,
>
>> Read:
>> If you want to read an inode then the kernel calls jffs2_do_read_inode()
>> to get the inode.
>
> But if I don't want? There are thousands of inodes and I don't have to 
> read them all. What then? Will GC move dirt along with valid data? 
> Will I see fewer free space then there is actually present? I suppose 
> yes and this is incorrect.
>
In this point of view I think you are right! The nocrc option is
incorrect and it will be removed from our summary patch.

But ... :)

We are developing a new technologic solution for faster mount. The name
of the solution is Centralized Summary. It stores summary information
from the whole flash in contrast to summary (Erase Block Summary). It
can cooperate with summary for fast recover after powerloss.

Zoltan
