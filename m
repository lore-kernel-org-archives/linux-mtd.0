Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15sn5E-0003ih-00
	for <linux-mtd@lists.infradead.org>; Sun, 14 Oct 2001 16:21:44 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <7C0E66E1B97BD5119B120002A50A63D22E4191@hasmsx101.iil.intel.com> 
References: <7C0E66E1B97BD5119B120002A50A63D22E4191@hasmsx101.iil.intel.com> 
To: "Kremer, Alex" <alex.kremer@intel.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: linux/completion.h 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 14 Oct 2001 16:30:53 +0100
Message-ID: <11688.1003073453@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


alex.kremer@intel.com said:
> From about a month ago, the jffs2 code uses the "completion" interface
> that appeared only around 2.4.8. This means that jffs2 cannot be
> compiled unmodified with kernels prior to this. I'm using 2.4.1 and
> cannot currently upgrade (hw compatibility issues, that would demand
> too many changes).

> Does anyone know what would be a sufficient set of changes either to
> jffs2 or the kernel that wouldn't break anything and allow me use the
> latest jffs2 code?

The necessary magic should already be in include/linux/mtd/compatmac.h

It should just work if you include that from background.c.

--
dwmw2
