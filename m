Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157Fuh-0004f5-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2001 13:26:23 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20010605125233.A31929@crystal.2d3d.co.za> 
References: <20010605125233.A31929@crystal.2d3d.co.za> 
To: Abraham vd Merwe <abraham@2d3d.co.za>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: erasesize 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 05 Jun 2001 13:30:21 +0100
Message-ID: <12554.991744221@redhat.com>
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
>  What should I set erasesize to when the flash chips have multiple
> erase sizes (and therefor I use eraseregions to get erasesize info)?
> Is 0 acceptable or should I set it to something else - it doesn't
> really make sense to put any value in this after all...

See the other Intel driver. Set the erase size to the 'major' erase size 
for the device, then fill in the appropriate structure to represent the 
other regions.

--
dwmw2
