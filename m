From: dwmw2@infradead.org (David Woodhouse)
Date: 17 Feb 2003 21:43:10 +0000
Subject: Change in RedBoot partition scanning
In-Reply-To: <1045517920.18487.822.camel@hermes.chez-thomas.org>
References: <1045517920.18487.822.camel@hermes.chez-thomas.org>
Message-ID: <1045518190.17498.32.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, 2003-02-17 at 21:38, Gary Thomas wrote:
> David,
> 
> What about my changes to the RedBoot partitioning code (see
> attached patch)?  I'd like to see these go in, so the support
> can be merged into the Linux/PPC trees.

Sorry, I thought you'd committed them -- please do. I might be inclined
to make the extra argument an 'unsigned long' since we're going to cast
it to that anyway.

-- 
dwmw2
