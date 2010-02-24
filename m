Received: from mail-bw0-f218.google.com ([209.85.218.218])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NkEee-0002d4-79
	for linux-mtd@lists.infradead.org; Wed, 24 Feb 2010 10:39:49 +0000
Received: by bwz10 with SMTP id 10so3403209bwz.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Feb 2010 02:39:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1002241000170.29303@lnxricardw.se.axis.com>
References: <aecf5e531002221936q70f06a23j62046b180f490d60@mail.gmail.com>
	<0554BEF07D437848AF01B9C9B5F0BC5D9BB7DEBC@dlee01.ent.ti.com>
	<aecf5e531002222042g2eb3ee79g53d05261054e07ee@mail.gmail.com>
	<0554BEF07D437848AF01B9C9B5F0BC5D9BC47920@dlee01.ent.ti.com>
	<Pine.LNX.4.64.1002241000170.29303@lnxricardw.se.axis.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Wed, 24 Feb 2010 16:09:15 +0530
Message-ID: <ce9ab5791002240239o36795009p6bcccc8884c05d21@mail.gmail.com>
Subject: Re: MLC nand driver for linux
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Sasa Sasa <sasak.1983@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Paulraj, Sandeep" <s-paulraj@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 24, 2010 at 2:31 PM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>
> On Tue, 23 Feb 2010, Paulraj, Sandeep wrote:
>
>>>
>>> I am also using micron mlc nand device.(4k page size)
>>>
>>> Just for ref, could I refer your driver from mainline linux kernel if
>>> available, i think it would be same for SLC and MLC.
>>
>> Drivers/mtd/nand/davinci_nand.c
>
> Note that this driver is dependent on hardware ECC generation of TI DaVinci
> microcontrollers. The equivalent hardware may exist on other systems, but as
> far as I can tell there is no built in software ECC algorithm apart from the
> standard 1 bit / 256 bytes algorithm in mtd.
>

Linux kernel supports Reed-Solomon library. You can use that if more
number of bit correction is required.
One can take help from 'nand/diskonchip.c' driver about uses of this library.


-- 
Regards,
Vimal Singh
