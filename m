Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Te98k-0007bj-LE
 for linux-mtd@lists.infradead.org; Thu, 29 Nov 2012 18:47:19 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch] mtg: docg3: potential divide by zero in doc_write_oob()
References: <20121129141651.GA12199@elgon.mountain>
Date: Thu, 29 Nov 2012 19:46:54 +0100
In-Reply-To: <20121129141651.GA12199@elgon.mountain> (Dan Carpenter's message
 of "Thu, 29 Nov 2012 17:16:51 +0300")
Message-ID: <87zk201c2p.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Mike Dunn <mikedunn@newsguy.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 Ivan Djelic <ivan.djelic@parrot.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dan Carpenter <dan.carpenter@oracle.com> writes:

> If we set oobdelta to zero then we will either return -EINVAL or hit
> a divide (modulus) by zero on the next line when we check
> "(ooblen % oobdelta)".  It's better to just return -EINVAL here instead.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static analysis.  I don't know if it's actually possible to hit this
> condition.
I don't know any possibility to reach that condition, nonetheless the patch
makes the code more robust, therefore :

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

--
Robert
