Received: from thorgal.et.tudelft.nl ([130.161.40.91])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19sjvT-0001lP-U7
	for <linux-mtd@lists.infradead.org>; Fri, 29 Aug 2003 15:08:31 +0100
Mime-Version: 1.0
Message-Id: <a05200f19bb750ddd2b65@[130.161.115.44]>
In-Reply-To: <024b01c36e35$62241600$a970a8c0@topo>
References: <023501c36e31$81a4a610$a970a8c0@topo>
 <a05200f17bb750899ef6e@[130.161.115.44]>
 <024b01c36e35$62241600$a970a8c0@topo>
Date: Fri, 29 Aug 2003 16:07:51 +0200
To: "Luca Contini" <luca.contini@mediaenabling.com>
From: "J.D. Bakker" <bakker@thorgal.et.tudelft.nl>
Content-Type: text/plain; charset="us-ascii" ; format="flowed"
cc: "linux-mtd-request@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: latest MTD snapshot
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

At 15:56 +0200 29-08-2003, Luca Contini wrote:
>  > At 15:28 +0200 29-08-2003, Luca Contini wrote:
>  > >What Am I missing?
>>
>>  1) Which kernel version ?
>
>2.4.18-rmk6-swl6

That's a pretty ancient kernel (almost 18 months old). You may want 
to retry with 2.4.21-rmk1 (works fine on the LART, which is also 
arm-based).

>  > 3) Any particular reason why you don't use the patchin.sh script ? I
>>  know, you 'only' need mtdblock, but partial installs tend to create
>>  no end of trouble.
>
>I just thought it was easiest to do it manually just for mtdblock device.
>I've copied the snapshot to ../linux/drivers/mtd/util/snapshot and tried the
>patchin.sh:
>[root@Lab patches]# patchin.sh
>Directory  does not exist or is not a kernel source directory

You must give it the path to your kernel tree as an argument (as 
documented on http://www.linux-mtd.infradead.org/).

HTH,

JDB.
-- 
LART. 250 MIPS under one Watt. Free hardware design files.
http://www.lart.tudelft.nl/
