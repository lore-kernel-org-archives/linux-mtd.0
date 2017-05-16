Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbl1-0002q3-Nm
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:39:22 +0000
From: David Howells <dhowells@redhat.com>
In-Reply-To: <d651983dde41a854e25664d98cbfc999d55785a8.1494935649.git.mchehab@s-opensource.com>
References: <d651983dde41a854e25664d98cbfc999d55785a8.1494935649.git.mchehab@s-opensource.com>
 <cover.1494935649.git.mchehab@s-opensource.com>
 <cover.1494935649.git.mchehab@s-opensource.com>
To: Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc: dhowells@redhat.com, Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Hannes Frederic Sowa <hannes@stressinduktion.org>,
 Alexander Duyck <alexander.h.duyck@intel.com>,
 Ding Tianhong <dingtianhong@huawei.com>,
 Soheil Hassas Yeganeh <soheil@google.com>,
 Ursula Braun <ubraun@linux.vnet.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sridhar Samudrala <sridhar.samudrala@intel.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Josh Hunt <johunt@akamai.com>,
 netdev@vger.kernel.org
Subject: Re: [PATCH v2 30/53] net: fix some identation issues at kernel-doc
 markups
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <15465.1494938297.1@warthog.procyon.org.uk>
Date: Tue, 16 May 2017 13:38:17 +0100
Message-ID: <15466.1494938297@warthog.procyon.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mauro Carvalho Chehab <mchehab@s-opensource.com> wrote:

> - *	calling skb_free_datagram). Returns NULL with *err set to
> + *	calling skb_free_datagram). Returns NULL with @err set to

I think this should be *@err or @*err.  err is not itself changed.

David
