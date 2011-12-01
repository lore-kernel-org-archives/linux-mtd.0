Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RW1bg-0005wP-Qa
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2011 08:03:01 +0000
Received: by lagu2 with SMTP id u2so769103lag.36
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2011 00:02:59 -0800 (PST)
Subject: Re: [patch v2] mtd/docg3: dereferencing an ERR_PTR() in docg3_probe()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 01 Dec 2011 10:02:56 +0200
In-Reply-To: <20111128134947.GK21128@mwanda>
References: <20111124072117.GC14122@elgon.mountain> <87pqghygbv.fsf@free.fr>
 <20111124103147.GF3195@mwanda> <87r50vi20u.fsf@free.fr>
 <20111128134947.GK21128@mwanda>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1322726578.2332.7.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Robert Jarzmik <robert.jarzmik@free.fr>, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-11-28 at 16:53 +0300, Dan Carpenter wrote:
> If doc_probe_device() returned an ERR_PTR, then we accidentally saved
> that to docg3_floors[floor] = mtd; which gets derefenced in the error
> handling when we call doc_release_device().
> 
> I've reworked the error handling to take care of that and hopefully
> make it a little simpler.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to l2-mtd-2.6.git, thanks!

Artem.
