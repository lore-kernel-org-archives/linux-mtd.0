Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15AuRc-0005sS-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Jun 2001 15:19:28 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010615160805.A5977@crystal.2d3d.co.za> 
References: <20010615160805.A5977@crystal.2d3d.co.za> 
To: Abraham vd Merwe <abraham@2d3d.co.za>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: latest jffs2 troubles 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 15 Jun 2001 15:21:33 +0100
Message-ID: <32514.992614893@redhat.com>
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

abraham@2d3d.co.za said:
> jffs2_scan_dirent_node(): Name CRC failed on node at 0x001c093c: Read 0x49ccf4da, calculated 0x2
> 77fb134
> jffs2_scan_dirent_node(): Name CRC failed on node at 0x001c0ae8: Read 0x2d13ab07, calculated 0x8 
> a10a00e

Urgh. Word wrap.

Which kernel? If the alignment fixups are broken, that would explain it.

--
dwmw2
