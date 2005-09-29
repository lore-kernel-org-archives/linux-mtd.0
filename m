Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKuys-00034O-7u
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 05:45:45 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <20050929093433.GB18741@wohnheim.fh-wedel.de>
References: <433A640D.6030200@cetrtapot.si> <433BA402.3040703@inf.u-szeged.hu>
	<20050929093433.GB18741@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Thu, 29 Sep 2005 13:44:57 +0400
Message-Id: <1127987098.5380.12.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "hinko.kocevar@cetrtapot.si" <hinko.kocevar@cetrtapot.si>,
	Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Great jffs2 speedup
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-09-29 at 11:34 +0200, Jörn Engel wrote:
> On Thu, 29 September 2005 10:21:22 +0200, Ferenc Havasi wrote:
> > At this moment: yes, that is the only way. If more people need it we can
> > implement a special extension for EBS. (but it takes time) This
> > extension would make possible if user set a special mount option the
> > system will convert all the non-summarizied erase blocks to summarized.
> > It would take a lot of time (and need some percent free space), but only
> > at that mount.
> 
> Just fyi - such a patch should not get merged into cvs.  Long-term,
> the demand for it will approximate zero, so there is no good
> justification for extra code.
IMO, an external tool would be a good compromise.

> 
> > Or you may try our other technique: CS (Centralized Summary). That
> > technique does not requie user space tool, and cause very fast mount
> > after any clean umount. (if the umount was not clean the speed will be
> > same as before). It is not the part of the official JFFS2 now, we would
> > like to little bit rewrite before bringing on it. But it works already -
> > use the variant which stores the reference in the first erase block. You
> > can download it from our webpage ( http://www.inf.u-szeged.hu/jffs2/ ).
> 
> How is the CS information found during mount?  Special location?
You may try the approach that is described in the JFFS3 design. That
would be cute if one implement it and check how it works :-))

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
