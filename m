Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKj8B-00031i-Al
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2004 16:01:54 -0400
Message-ID: <41781683.3020602@inf.u-szeged.hu>
Date: Thu, 21 Oct 2004 22:05:23 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <41767593.9030004@inf.u-szeged.hu>
	<1098365059.13633.1257.camel@hades.cambridge.redhat.com>
In-Reply-To: <1098365059.13633.1257.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> It's looking good, but the kernel really needs to be able to write these
> summaries for _itself_ in order to give a real improvement over the long
> term. If the file system has to be read-only we might as well be using
> cramfs, and if the summary becomes obsolete over time we might as well
> not bother in a lot of cases.

Our plan for it:

We would like to store some additional information in jeb struct:
- a type information, where there this type can be INODE_ONLY and 
ANYTHING_OTHER. This information is easy to detect during mount time.
- a predicted summary size (calculated dinamically). It will be used to 
  decide when to generate the summary. Ceratinly only for INODE_ONLY 
erase blocks.

If I am right every node allocation is done by jffs2_reserve_space(). We 
would like to modify it, and introduce a new interface for it called 
jffs2_reserve_space_for_inode() function. Every inode storing function 
(there is no too much I think) should call 
jffs2_reserve_space_for_inode() with some extra information (inode 
number...).

jffs2_reserve_space() should use only ANYTHING_OTHER eraseblocks, as 
jffs2_reserve_space_for_inode() use only INODE_ONLY ones. If there is no 
free space in them it should use the usual technique to find a clean 
eraseblock and start to store the new node in it.

The generating of summary is also the task of 
jffs2_reserve_space_for_inode(), if the new inode (+summary) is not fit 
in the erase block, it will generates summary.

What do you think?

Regards,
Ferenc
