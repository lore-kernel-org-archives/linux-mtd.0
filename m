Received: from dsl-210-15-250-78.nsw.netspace.net.au ([210.15.250.78]
	helo=mail.magtech.com.au)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CSOCi-0007bN-I1
	for linux-mtd@lists.infradead.org; Thu, 11 Nov 2004 18:18:13 -0500
Received: from mail.magtech.com.au (localhost [127.0.0.1])
	by localhost.magtech.com.au (Postfix) with ESMTP id 1D96E894009
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 Nov 2004 10:18:04 +1100 (EST)
Received: from [192.168.65.196] (unknown [192.168.65.196])
	by mail.magtech.com.au (Postfix) with ESMTP id 09ED7894003
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 Nov 2004 10:18:04 +1100 (EST)
Message-ID: <4193F32B.3080308@magellan-technology.com>
Date: Fri, 12 Nov 2004 10:18:03 +1100
From: Aras Vaichas <arasv@magellan-technology.com>
MIME-Version: 1.0
Cc: linux-mtd@lists.infradead.org
References: <20041111220146.GA1898@buici.com>
In-Reply-To: <20041111220146.GA1898@buici.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: cmdlineparts and chip initialization order
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Marc Singer wrote:
> With a command line like this:
> 
>   console=ttyAM0 root=/dev/hda1 mtdparts=norflash:2m(boot),-(root);nandflash:32k(apex)ro,-(root)
> 
> I am able to initialization partitions for the NOR flash, but not the
> NAND flash.  It look like the problem is that the NOR flash driver is
> initializing before the mtdparts command line parsed, but the NAND
> flash isn't.
 > <SNIP>
> BTW, it looks like none of the other NAND drivers expect a command
> line partition setup.  Has anyone else tried?

I recently had to do this and had the same problem. I took a look at the low 
level driver code for my particular processor and noted that not all MTD 
drivers had partition parsing code.

e.g  in at91_dataflash.c there is parser related code:

int parse_cmdline_partitions(struct mtd_info *master,
                 struct mtd_partition **pparts, const char *mtd_id);
and ...

#ifdef CONFIG_MTD_CMDLINE_PARTS
         char mtdID[14];
#endif

and ...

#ifdef CONFIG_MTD_CMDLINE_PARTS
         sprintf(mtdID, "dataflash%i", nr_devices-1);
         mtd_parts_nr = parse_cmdline_partitions(device, &mtd_parts, mtdID);
#endif

This parsing code is missing from at91_nand.c, and that's why I wasn't able to 
setup my NAND partitions from the command line (previous posting).


regards,

Aras
