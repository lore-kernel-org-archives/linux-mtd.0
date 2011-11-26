Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RUFxb-0004K8-BZ
 for linux-mtd@lists.infradead.org; Sat, 26 Nov 2011 10:58:20 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch] mtd/docg3: fix error handling in docg3_probe()
References: <20111124072117.GC14122@elgon.mountain> <87pqghygbv.fsf@free.fr>
 <20111124103147.GF3195@mwanda>
Date: Sat, 26 Nov 2011 11:58:09 +0100
In-Reply-To: <20111124103147.GF3195@mwanda> (Dan Carpenter's message of "Thu,
 24 Nov 2011 13:31:47 +0300")
Message-ID: <87r50vi20u.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dan Carpenter <dan.carpenter@oracle.com> writes:

> I'm on linux-next.  They're all going to hit linux next soon right?
> I can redo the patch later in that case.
Hi Dan,

I saw the patches reach linux-next.
Could you rework your patch on top of the current linux-next please (ie. on top
of next-20111125 or later), as hopefully the code won't evolve much now ?

Cheers.

-- 
Robert
