Received: from softsteprubberfloors.com ([192.220.111.56] helo=rcmenter.iserver.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18WLbj-0002Cf-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 Jan 2003 19:11:19 +0000
Subject: Re: CRAMFS on MTD/NAND Issue
From: Russ Dill <Russ.Dill@asu.edu>
To: Srinivasu.Vaduguri@nokia.com
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <F252EE46074AB645B4F44947EEAD5727C83809@mvebe001.americas.nokia.com>
References: 
	 <F252EE46074AB645B4F44947EEAD5727C83809@mvebe001.americas.nokia.com>
Content-Type: text/plain
Message-Id: <1042054935.10724.10.camel@timmy>
Mime-Version: 1.0
Date: 08 Jan 2003 12:42:15 -0700
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wed, 2003-01-08 at 05:40, Srinivasu.Vaduguri@nokia.com wrote:
> Hi all,
> 
> I am trying to mount CRAMFS using MTD driver on a NAND flash. 
> If there is a BAD block in the CRAMFS area of the NAND flash then i get the following error during mount. 
> 
> Error -3 while decompressing!
> 802c3674(666163445)->83d7d000(4096)
> 
> Then the applications on the mounted cramfs are not running properly.

NAND *will* have bad blocks, cramfs does not handle bad blocks. There
isn't an elegant solution for this right now, but here are some options:

cramfs on top of nftl: This works resonably well, but seems like
overkill to me, and it puts you in questionable legal status if you
aren't using an m-systems product afaik (this is what I use)

yaffs: desgined for NAND, but has no compression

jffs2: The NAND code is pretty new, and the journalling is probably
overkill for your application, but it will work, and should be able to
adapt to bad blocks.

roll your own: Please, make a static compressed filesystem (like cramfs)
that incorporates extra blocks, so that when the checksum is bad while
initially writing the filesystem, or reading the file system (in the
case where ecc can save the data), it rewrites this block to a free
sector). It would seem like a simple modification to cramfs to me.
