Received: from mail13.syd.optusnet.com.au ([211.29.132.194])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JvKKz-0004bh-4n
	for linux-mtd@lists.infradead.org; Sun, 11 May 2008 22:48:13 +0000
Subject: Re: New thread [BUG] JFFS2 usage of write_begin and write_end
	functions causes kernel panic
From: James <jamessteward@optusnet.com.au>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1210545077.6235.10.camel@Ubuntu-Desktop>
References: <1210312276.28139.19.camel@Ubuntu-Desktop>
	<1210320731.25560.1193.camel@pmac.infradead.org>
	<1210545077.6235.10.camel@Ubuntu-Desktop>
Content-Type: text/plain
Date: Mon, 12 May 2008 08:46:56 +1000
Message-Id: <1210546016.6235.12.camel@Ubuntu-Desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-05-12 at 08:31 +1000, James wrote:
> On Fri, 2008-05-09 at 09:12 +0100, David Woodhouse wrote:
> > You possibly need the patch in commit abe2f4143?
> 
> I'd love to, but (embarrassed) how do I find it?  I was searching in
> http://git.infradead.org/mtd-2.6.git , but didn't see how to search for
> a commit number.  Also the link the the GIT HOWTO timed out on several
> attempts to view it.

I think I found what you are talking about in here:
http://www2.kernel.org/pub/linux/kernel/v2.6/ChangeLog-2.6.25

commit abe2f41430770270a1512bf78f489284bfbdbd04
Author: Alexey Korolev <akorolev@infradead.org>
Date:   Mon Apr 14 20:45:06 2008 +0100

    JFFS2 Fix of panics caused by wrong condition for hole frag creation in write_begin

Is that what you meant?

Regards,
James.
