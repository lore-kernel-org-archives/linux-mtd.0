Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=executor.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16nH1k-0003Yq-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Mar 2002 10:39:36 +0000
Date: Tue, 19 Mar 2002 10:51:05 +0000 (GMT)
From: David Woodhouse <dwmw2@redhat.com>
To: William Jhun <wjhun@ayrnetworks.com>
Cc: linux-mtd@lists.infradead.org, <kaos@ocs.com.au>
Subject: Re: Initialization ordering problem
In-Reply-To: <20020318221449.L6821@ayrnetworks.com>
Message-ID: <Pine.LNX.4.44.0203191048310.26226-100000@passion.cambridge.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Mon, 18 Mar 2002, William Jhun wrote:

> Hello,
> 
> Since mtd chip drivers (cfi_probe.c, etc) register their presence during
> module (or __initcall) initialization, an attempt to probe for flash
> devices before all mtd components have initialized may fail. Our
> platform-specific code (which in turn calls do_map_probe() in chipreg.c)
> just happens to get linked in before the mtd code. Resultingly, all
> probes fail as the required chip drivers are not present. Is there a
> better solution for this than changing the link order? 

Ask Keith. I objected strongly at the time to the inter_module_xxx stuff
introducing these link order constraints where previously there were none.

In 2.5, you could possibly use subsys_initcall for the chip registrations 
to ensure they happen first.

-- 
dwmw2
