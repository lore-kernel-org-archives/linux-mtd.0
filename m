Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D155k-0003aK-R9
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 10:58:26 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: "Steven J. Magnani" <steve@digidescorp.com>
In-Reply-To: <005101c51372$659fd420$6ffea8c0@banana>
References: <005101c51372$659fd420$6ffea8c0@banana>
Content-Type: text/plain
Date: Tue, 15 Feb 2005 18:57:52 +0300
Message-Id: <1108483073.26412.31.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: RE: Bug in jffs2/scan.c re: incorrect assumption of "allclean"block
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-02-15 at 09:24 -0600, Steven J. Magnani wrote:
> > Well, I've looked trough your debug output and the code and think the
> following patch should fix the bug.
> 
> That also seems to work. I assume that the test for "jeb->used_size ==
> PAD(c->cleanmarker_size)" assures that jeb->first_node is non-NULL, so
> dereferencing it won't ever cause an oops.
Yes

> 
> Should the code at line 631 be changed to look more like your patched
> code? (Why the difference?)
I believe the same should be done there too.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
