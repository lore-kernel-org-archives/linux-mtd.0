From: David Woodhouse <dwmw2@infradead.org>
To: Sherwin Liu <sherwinliu@sbcglobal.net>
In-Reply-To: <20031119163841.9458.qmail@web80503.mail.yahoo.com>
References: <20031119163841.9458.qmail@web80503.mail.yahoo.com>
Content-Type: text/plain
Message-Id: <1069261772.31205.26.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 19 Nov 2003 17:09:35 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: REF_PRISTINE node ...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-11-19 at 08:38 -0800, Sherwin Liu wrote:
> "REF_PRISTINE node at XX had a previous non-hole frag 
> in the same page. Tell dwmw2."
> 
> Is this just a debugging message, or is it an 
> indication of something wrong?

It's basically harmless, and should be gone if you update to the current
CVS JFFS2 code. 

A while ago, I implemented a garbage-collection optimisation; if a node
is expected to be identical when we write out a replacement, we can
avoid decompressing and recompressing it if we just copy the whole thing
intact. So I start keeping track of such 'pristine' nodes which were an
optimal representation of their data... and that message warns me of one
case where such a node marked REF_PRISTINE but shouldn't have been.

-- 
dwmw2
