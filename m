Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19UlFH-0007ci-2N
	for <linux-mtd@lists.infradead.org>; Tue, 24 Jun 2003 11:41:51 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Alexander Viro <aviro@redhat.com>
In-Reply-To: <20030624063507.E9043@devserv.devel.redhat.com>
References: <5.2.1.1.0.20030622225659.00a46a30@192.168.1.10>
	 <1056446261.29264.393.camel@passion.cambridge.redhat.com>
	 <20030624063507.E9043@devserv.devel.redhat.com>
Message-Id: <1056451330.29264.409.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 24 Jun 2003 11:42:11 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: Allen Curtis <acurtis@onz.com>
cc: Infradead Org <linux-mtd@lists.infradead.org>
cc: jffs-dev@axis.com
Subject: Re: JFFS patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-06-24 at 11:35, Alexander Viro wrote:
> It would be nice.  There are several ugly craps in there and I'd
> rather see it gone than try and fix them...

Me too -- I started cleaning up at one point and the result was JFFS2 :)

So unless I hear anguished screams from a huge user base who are using
it and not JFFS2 for reasons which they haven't yet reported as JFFS2
bugs, and someone also steps forward to clean it up for 2.6, I'll submit
a patch to Linus to remove it in a couple of weeks time.

-- 
dwmw2
