Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Gk4Ue-0002qI-Fe
	for linux-mtd@lists.infradead.org; Tue, 14 Nov 2006 15:02:55 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Gk4UO-0001FZ-PI
	for linux-mtd@lists.infradead.org; Tue, 14 Nov 2006 21:02:36 +0100
Received: from 0x503e0864.albnxx8.adsl-dhcp.tele.dk ([80.62.8.100])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Nov 2006 21:02:36 +0100
Received: from martin by 0x503e0864.albnxx8.adsl-dhcp.tele.dk with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Nov 2006 21:02:36 +0100
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Subject: Re: Access to NOR from Linux - what is required?
Date: Tue, 14 Nov 2006 21:02:11 +0100
Message-ID: <ejd7c4$jua$1@sea.gmane.org>
References: <ejck96$7qf$1@sea.gmane.org>
	<f96d234e0611140947n36d1269ao8235f7cbec4fd920@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
In-Reply-To: <f96d234e0611140947n36d1269ao8235f7cbec4fd920@mail.gmail.com>
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Cliff Brake wrote:
>>I know this is a rather vague question, but how do I gain access to the
>>NOR flash on my board?

=== 8< 8< 8< ===

> You can often just map in your NOR device using the kernel command
> line without any kernel changes.  Something like:
> 
> CONFIG_MTD_PARTITIONS=y
> CONFIG_MTD_CMDLINE_PARTS=y
> CONFIG_CMDLINE="mtdparts=phys_mapped_flash:256k(boot)ro,0x1C0000(kernel),-(root)"
> CONFIG_MTD_PHYSMAP=y
> CONFIG_MTD_PHYSMAP_START=0x0000000
> CONFIG_MTD_PHYSMAP_LEN=0x4000000
> CONFIG_MTD_PHYSMAP_BANKWIDTH=4
> 
> There is documentation on mtdparts in:
> drivers/mtd/cmdlinepart.c

Super, I'll try this in the morning and let you know! Thanks for now...

// Martin
