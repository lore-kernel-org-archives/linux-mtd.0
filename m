Received: from az33egw01.freescale.net ([192.88.158.102])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JEvVB-00073m-Gc
	for linux-mtd@lists.infradead.org; Tue, 15 Jan 2008 23:47:29 +0000
Message-ID: <478D450A.8060802@freescale.com>
Date: Tue, 15 Jan 2008 17:43:06 -0600
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH 2/3] mtd: Factor out OF partition support from the NOR
	driver.
References: <20080114172116.a2e5aa18.sfr@canb.auug.org.au>
In-Reply-To: <20080114172116.a2e5aa18.sfr@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, dwmw2@infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Stephen Rothwell wrote:
>> +	nr_parts = 0;
>> +	for (pp = node->child; pp; pp = pp->sibling)
> 
> 	for_each_child_of_node(node, pp)

"for_each_child_of_node" is only in Paul's tree, but this has to go via mtd.

Plus, I'm just moving the code; it's not new.

-Scott
