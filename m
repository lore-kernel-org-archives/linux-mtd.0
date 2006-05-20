Received: from mail-in-09.arcor-online.net ([151.189.21.49])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FhOmI-0007ik-7e
	for linux-mtd@lists.infradead.org; Sat, 20 May 2006 06:33:53 -0400
In-Reply-To: <1148034391.3875.109.camel@pmac.infradead.org>
References: <20060518160940.GS7570@earth.li>
	<20060518165728.GA26113@wohnheim.fh-wedel.de>
	<20060519090142.GB7570@earth.li>
	<20060519100303.GB17270@wohnheim.fh-wedel.de>
	<1148034391.3875.109.camel@pmac.infradead.org>
Mime-Version: 1.0 (Apple Message framework v749.3)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-Id: <1C9E7AB3-2DD3-40EA-B0F1-E0713A58E490@kernel.crashing.org>
Content-Transfer-Encoding: 7bit
From: Segher Boessenkool <segher@kernel.crashing.org>
Date: Sat, 20 May 2006 02:10:57 +0200
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, Jonathan McDowell <noodles@earth.li>,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Add Amstrad Delta NAND support.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>> And please create a structure containing both struct mtd_info and
>>>> struct nand_chip.  Then use sizeof(that structure)...

> It's fine as-is. The claim that it's nicer to introduce an extra
> datatype just for the allocation is subjective, at best.

Not just for the allocation, but also for getting the address of
the second struct, after that allocation.

If the second struct has bigger alignment required than the first,
the current code gets the second struct misaligned.  Putting both
into one bigger struct would add the required padding.

(Say: sizes 4 and 8, alignment requirements 4 and 8 resp.)


Segher
