Received: from wall.comdev.cc ([63.150.62.162] helo=cleanup.comdev.cc)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16L4mU-00076S-00
	for <linux-mtd@lists.infradead.org>; Mon, 31 Dec 2001 15:55:18 +0000
Message-ID: <3C308BD3.C098FA49@comdev.cc>
Date: Mon, 31 Dec 2001 08:01:23 -0800
From: adam.wozniak@comdev.cc
MIME-Version: 1.0
To: acurtis@onz.com
CC: linux-mtd@lists.infradead.org
Subject: Re: patch for 64 bit wide flash
References: <NCBBIINEHIPFGJPLBEIFCEBCDDAA.acurtis@onz.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Allen Curtis wrote:

> When we did our 64 bit patch we did not use 64 bit variables. Everything
> thing was accomplished with the existing functions but making sure that the
> commands issues affected all banks. The only exception to this was
> do_writewords() (I think that was it). In that case the value to be written
> was passed as a u32 value instead of a pointer. In that case we added
> another parameter "u32 datum2" which was only used with 64 bit mode. Not
> sure if this is useful but it reduced the overall impact on the code.

I'm a big fan of orthagonality. =)

--Adam

--
Adam Wozniak (KG6GZR)   COM DEV Wireless - Digital and Software Systems
awozniak@comdev.cc      3450 Broad St. 107, San Luis Obispo, CA 93401
                        http://www.comdev.cc
                        Voice: (805) 544-1089       Fax: (805) 544-2055
