Received: from e34.co.us.ibm.com ([32.97.110.132])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CCJ0j-0007HL-Gy
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2004 10:31:23 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1096380254.30942.77.camel@hades.cambridge.redhat.com>
References: <41595913.4040007@yandex.ru>
	<1096375038.30942.30.camel@hades.cambridge.redhat.com>
	<41596471.5020108@yandex.ru>
	<1096377761.30942.58.camel@hades.cambridge.redhat.com>
	<41596913.6080207@yandex.ru>
	<1096379132.30942.66.camel@hades.cambridge.redhat.com>
	<41596DDC.3000506@yandex.ru>
	<1096380254.30942.77.camel@hades.cambridge.redhat.com>
Content-Type: text/plain
Message-Id: <1096381863.17956.12.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Tue, 28 Sep 2004 09:31:03 -0500
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 an nodes checking
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-09-28 at 09:04, David Woodhouse wrote:
> You have to make the read/write code capable of dealing with the fact
> that the full rbtree hasn't been built. Possibly you sort through the
> raw nodes and put them into _pools_, each covering something like a
> 256KiB of the file. Then when you get a read or write of any such range,
> you check the CRCs for the nodes in that _range_ and build the full map
> only for that range of the file. It sounds painful, to be honest -- I'd
> rather just tell people not to use such large files on JFFS2 -- split it
> up into multiple files instead.

Yes, large files are bad, but aren't the only source of such a time
delay.  IIRC, the problem is really just a matter of the number of nodes
per file.  So couldn't you have a small file with a large number of
writes within that file that has the same effect?  (Until the obsoleted
nodes are actually deleted that is.)

I'm thinking of fifos here too...

josh
