Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189hsA-0004yC-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2002 08:18:42 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLOELLFHAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLOELLFHAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: linux-mtd@lists.infradead.org
Subject: Re: seeking help on JFFS2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 07 Nov 2002 08:49:02 +0000
Message-ID: <7618.1036658942@passion.cambridge.redhat.com>
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

joakim.tjernlund@lumentis.se said:
> Why does JEDEC end up in cfi_cmdset_0001.c? 

CFI only defines how you _probe_ chips. The actual Intel command set is the
same as it's always been, likewise the AMD one. This is why jedec_probe
passes control to the CFI drivers and all the other chip drivers are
deprecated.

> If it should end up in cfi_cmdset_0001.c, why does it not set cmdset_priv? 

IIRC because cmdset_priv is just a copy of the extended CFI table from the 
chip, which we don't have in the case of a non-CFI chip. It's that which 
holds the details of whether we can do erase suspend, etc.

Perhaps the table in jedec_probe should also contain a 'fake' extended CFI 
table. More sensibly, perhaps we should have a structure in the cmdset_priv 
with just the flags we care about, and at probe time either parse the 
extended CFI table or copy those flags from the jedec_probe table.

For now, we just assume jedec-probed chips have none of the extended 
features.

--
dwmw2
