Received: from kynes.gatewest.net ([198.163.227.7]
	helo=10-10-1-6.gatewest.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AEzFy-00080p-S6
	for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2003 22:57:39 +0000
From: Cam Mayor <cmayor@iders.ca>
To: Jun Sun <jsun@mvista.com>, David Woodhouse <dwmw2@infradead.org>
Date: Wed, 29 Oct 2003 16:57:27 -0600
References: <20031022182558.U19834@mvista.com>
	<1067426006.15551.1546.camel@hades.cambridge.redhat.com>
	<20031029104546.K30683@mvista.com>
In-Reply-To: <20031029104546.K30683@mvista.com>
MIME-Version: 1.0
Message-Id: <03102916572705.02584@kilauea.iders.ca>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] extend physmap.c to support run-time adding partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 29 October 2003 12:45, Jun Sun wrote:
> On Wed, Oct 29, 2003 at 11:13:26AM +0000, David Woodhouse wrote:
> >
> > That's nicer. Why multiple physmap_add_partition() calls rather than
> > just a single array passed to physmap_set_map() though?
>
> Hmm, currently partition only matters when CONFIG_MTD_PARTITIONS
> is enabled.  I assume this mean sometimes people want to use
> physmap without partitions.  True?

Yes.  We have a product that partitions physmap (from the kernel command 
line), but also uses the unpartitioned physmap base device. 

ie. physmap on /dev/mtd0
    physmap partitions on /dev/mtd1, /dev/mtd2, etc.   sometimes none.

cam

-- 
Cameron Mayor
Iders Incorporated
