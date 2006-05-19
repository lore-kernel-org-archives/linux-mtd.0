From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1148051254.3199.54.camel@sauron.oktetlabs.ru>
References: <1147999465.13399.33.camel@shinybook.infradead.org>
	<1148039861.3199.10.camel@sauron.oktetlabs.ru>
	<1148040313.3199.15.camel@sauron.oktetlabs.ru>
	<1148041434.3875.137.camel@pmac.infradead.org>
	<1148048246.3199.34.camel@sauron.oktetlabs.ru>
	<1148050203.3875.167.camel@pmac.infradead.org>
	<1148051254.3199.54.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Fri, 19 May 2006 16:37:56 +0100
Message-Id: <1148053076.3875.186.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Duplication of dirent names in JFFS2 summary
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-05-19 at 19:07 +0400, Artem B. Bityutskiy wrote:
> > First, there's the case where we've garbage-collected a dirent node but
> > haven't _yet_ deleted the original. But deleting the original is the
> > whole _point_ in GC, so that's not a common case.
> Sorry, -ENOPARSE on "But deleting the original is the whole _point_ in
> GC, so that's not a common case." 

Q: Why do we write new nodes out during GC?
A: So that we can delete the original.

Q: What is the point in GC?
A: The point in GC is that we can delete the original nodes. 

Better now?

My point is that when we've written out a colliding node during garbage
collection, that is because we intend to delete the original node real
soon now -- that deletion is what the GC is _for_. That's the whole
_point_ in the GC.

So we needn't worry too much about these collisions -- they'll be
short-lived and hence uncommon.

-- 
dwmw2
