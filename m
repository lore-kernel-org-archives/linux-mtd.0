Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Hfft-0007Wu-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2002 08:02:41 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <000901c20f81$3f7efd40$0300a8c0@deskpro> 
References: <000901c20f81$3f7efd40$0300a8c0@deskpro> 
To: "Michael Petruzelka" <michael@root.at>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd with 2.2.18 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 11 Jun 2002 08:02:39 +0100
Message-ID: <20383.1023778959@redhat.com>
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

michael@root.at said:
> Has anybody tried and managed to get the 2.2.18 or 19  kernel running
> with mtd? The main problem seems to be the inter_module_xxx.

Did you apply the 'inter-module-2.2.17.patch' from the patches directory in 
CVS?

--
dwmw2
