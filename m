From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <41596DDC.3000506@yandex.ru>
References: <41595913.4040007@yandex.ru>
	<1096375038.30942.30.camel@hades.cambridge.redhat.com>
	<41596471.5020108@yandex.ru>
	<1096377761.30942.58.camel@hades.cambridge.redhat.com>
	<41596913.6080207@yandex.ru>
	<1096379132.30942.66.camel@hades.cambridge.redhat.com>
	<41596DDC.3000506@yandex.ru>
Content-Type: text/plain
Message-Id: <1096380254.30942.77.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 28 Sep 2004 15:04:14 +0100
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

On Tue, 2004-09-28 at 17:57 +0400, Artem B. Bityuckiy wrote:
> Sorry, I don't understand. Suppose, after unclean reboot the bad last 
> node appears. Before any write, this last node will be detected *before 
> write* since the iget() will be called before it. Is it?

True, but it won't necessarily be _deleted_ so it could still be there
on the _next_ boot.

> Ok, anyway, there are possibilities to improve the iget().
> 
> What do you think the best way to do such change (no check on iget())
> ?

You have to make the read/write code capable of dealing with the fact
that the full rbtree hasn't been built. Possibly you sort through the
raw nodes and put them into _pools_, each covering something like a
256KiB of the file. Then when you get a read or write of any such range,
you check the CRCs for the nodes in that _range_ and build the full map
only for that range of the file. It sounds painful, to be honest -- I'd
rather just tell people not to use such large files on JFFS2 -- split it
up into multiple files instead.

-- 
dwmw2
