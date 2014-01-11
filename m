Received: from mail-pb0-x22e.google.com ([2607:f8b0:400e:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W27qQ-00037K-NT
 for linux-mtd@lists.infradead.org; Sat, 11 Jan 2014 23:19:59 +0000
Received: by mail-pb0-f46.google.com with SMTP id ma3so375755pbc.33
 for <linux-mtd@lists.infradead.org>; Sat, 11 Jan 2014 15:19:35 -0800 (PST)
Date: Sat, 11 Jan 2014 15:19:32 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Prabhakar Kushwaha <prabhakar@freescale.com>
Subject: Re: [PATCH] mtd/nand:Update mtd.name assignment type to u64 for IFC,
 eLBC
Message-ID: <20140111231932.GE1992@norris-Latitude-E6410>
References: <1388213255-30342-1-git-send-email-prabhakar@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1388213255-30342-1-git-send-email-prabhakar@freescale.com>
Cc: scottwood@freescale.com, linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Dec 28, 2013 at 12:17:35PM +0530, Prabhakar Kushwaha wrote:
> mtd.name is assigned to IFC NAND physical address. Assignment type is u32.
> It is not providing correct physical address of IFC NAND.
> 
> Update assignment type to u64.
> 
> Signed-off-by: Prabhakar Kushwaha <prabhakar@freescale.com>

Pushed to l2-mtd.git. Thanks!

Brian
