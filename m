Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19XeJR-0002Rf-Ag
	for <linux-mtd@lists.infradead.org>; Wed, 02 Jul 2003 10:54:05 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Stephen Brown <sbrown@stirling-dynamics.com>
In-Reply-To: <000701c3407f$9b34aa10$11c8a8c0@stevejunior>
References: <bdsdl7$gvb$1@main.gmane.org>
	 <000701c3407f$9b34aa10$11c8a8c0@stevejunior>
Message-Id: <1057139662.12384.143.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 02 Jul 2003 10:54:23 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Diskonchip MD2200-D16 redhat installation
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-07-02 at 10:52, Stephen Brown wrote:
> i think the best way tho is to prepare the DOC with jffs then i assume you
> can build your root fs and kernel on it and not worry too much about power
> down etc?

That is probably the best way forward, yes. Especially with a 16MiB unit
where you really do want the compression.

I committed code to CVS yesterday to make JFFS2 work out of the box on
the DiskOnChip 2000 and Millennium (not Millennium Plus). I haven't
tested it hard yet, though.


-- 
dwmw2
