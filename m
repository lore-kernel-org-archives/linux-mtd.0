Received: from wf-out-1314.google.com ([209.85.200.169])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KqdEc-0003ML-6v
	for linux-mtd@lists.infradead.org; Fri, 17 Oct 2008 00:30:30 +0000
Received: by wf-out-1314.google.com with SMTP id 28so304451wfc.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Oct 2008 17:30:28 -0700 (PDT)
Message-ID: <6934efce0810161730l2aa66f30v83c6ed644e0d6707@mail.gmail.com>
Date: Thu, 16 Oct 2008 17:30:27 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [RFC/PATCH 8/8] LPDDR extended physmap driver to support LPDDR
	flash.
In-Reply-To: <1223979634.6770.767.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <alpine.LFD.1.10.0810082237210.13328@casper.infradead.org>
	<1223979634.6770.767.camel@macbook.infradead.org>
Cc: linux-mtd@lists.infradead.org, nico@cam.org,
	Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I'd rather not extend the MTD_PHYSMAP_xxx options; in fact I'd prefer to
> phase them out completely. The platform device and the device tree
> should be perfectly sufficient.

Can you explain your plan here?  I like physmap.  The more powerful it
is the fewer devices need to be described.
