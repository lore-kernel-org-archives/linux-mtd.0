Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CoM1O-0000Wq-0i
	for linux-mtd@lists.infradead.org; Tue, 11 Jan 2005 08:25:19 -0500
Message-ID: <41E3D3E2.3090806@inf.u-szeged.hu>
Date: Tue, 11 Jan 2005 14:25:54 +0100
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
References: <Pine.LNX.4.61.0501101246150.20261@localhost.localdomain>	<1105380565.17584.4.camel@weaponx.rchland.ibm.com>
	<Pine.LNX.4.58.0501111231430.19297@phoenix.infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501111231430.19297@phoenix.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>,
	"Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: how to loopback mount a JFFS2 filesystem on my linux box?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityuckiy wrote:
>>You can't do that AFAIK because JFFS2 needs an MTD device.  Instead, use
>>mtdram to create a fake MTD device, dd the image to it, and do:
>>
>># mount -t jffs2 /dev/mtdblock0 <mnt/point>
> 
> mtdblock is hardcoded to 4BM. So if you need larger, use nand/nandsim.c. 
> This is NAND flash simulation driver and it is configurable, so you may 
> configure it to have larger size. 

The size of this device is depends on the size of the mtdram (not 
related to mtdblock, I think). It can be configured easily by kconfig: 
you can specify the size of it and its erase block size.

Nandsim is also configurable but unfortunatelly not from kconfig. If I 
am right you have to edit sources by hand. Firstly in the source of 
nandsim you have to specify a chip ID. You have to look up this ID from 
  nand_ids.c (if you found an appropriate NAND chip) or you have to 
define an own one.

Bye,
Ferenc
