Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B45pT-0000VH-RC
	for linux-mtd@lists.infradead.org; Thu, 18 Mar 2004 22:17:35 +0000
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id i2IMHSO26362
	for <linux-mtd@lists.infradead.org>; Fri, 19 Mar 2004 11:17:28 +1300
Received: from sunstorm.tait.co.nz (sunstorm.tait.co.nz [172.25.40.9])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id i2IMHSF26356
	for <linux-mtd@lists.infradead.org>; Fri, 19 Mar 2004 11:17:28 +1300
Received: from tait.co.nz ([172.25.107.91])
 by sunstorm.tait.co.nz (iPlanet Messaging Server 5.1 (built May  7 2001))
 with ESMTP id <0HUS002J3LX4K0@sunstorm.tait.co.nz> for
 linux-mtd@lists.infradead.org; Fri, 19 Mar 2004 11:17:28 +1300 (NZDT)
Date: Fri, 19 Mar 2004 11:16:21 +1300
From: Robin Gilks <robin.gilks@tait.co.nz>
In-reply-to: <1079599371.16952.119.camel@hades.cambridge.redhat.com>
To: mtd list <linux-mtd@lists.infradead.org>
Message-id: <405A1FB5.2010808@tait.co.nz>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii; format=flowed
Content-transfer-encoding: 7BIT
References: <405632E3.9040509@tait.co.nz> <4058DFA1.2080707@tait.co.nz>
 <1079599371.16952.119.camel@hades.cambridge.redhat.com>
Subject: Re: mtdparts howto required!!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Thu, 2004-03-18 at 12:30 +1300, Robin Gilks wrote:

[snip]

> 
> I'm not sure I understand this. What does physmap.c need to do other
> than passing in the 'master' mtd device as the first argument to
> parse_mtd_partitions()?

The ioremap fails before it can get this far because there is no start 
address or size defined for the default device. I've patched in a 
generic map as follows and its then fine.

struct map_info physmap_map = {
	.name = "phys_mapped_flash",
	.size = CONFIG_MTD_PHYSMAP_LEN,
	.buswidth = CONFIG_MTD_PHYSMAP_BUSWIDTH,
	.phys = CONFIG_MTD_PHYSMAP_START,
};


I may have missed something here - perhaps something is supposed to set 
these values by probing but if thats the case I've missed it I'm afraid!!



-- 
Robin Gilks
Senior Design Engineer          Phone: (+64)(3) 357 1569
Tait Electronics                Fax  :  (+64)(3) 359 4632
PO Box 1645 Christchurch        Email : robin.gilks@tait.co.nz
New Zealand
