Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 184LBC-0000fd-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2002 14:04:10 +0100
Date: Wed, 23 Oct 2002 15:33:59 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: rkaiser@sysgo.de
Cc: linux-mtd@lists.infradead.org
Subject: Re: parse_cmdline_partitions equivalent for map_info
Message-ID: <20021023133359.GA798@wohnheim.fh-wedel.de>
References: <20021022172914.GA18411@wohnheim.fh-wedel.de> <200210231319.g9NDJ9s02156@dagobert.svc.sysgo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200210231319.g9NDJ9s02156@dagobert.svc.sysgo.de>
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

On Wed, 23 October 2002 15:25:39 +0200, Robert Kaiser wrote:
> no offense, but ...

When you're right, you're...

> Am Dienstag, 22. Oktober 2002 19:29 schrieb Jörn Engel:
> > Actually, I am not very sure about cmdline.c at all. Is there a single
> > mapping driver that could not be replaced by physmap.c or mphysmap.c?
> 
> Not sure about mphysmap.c, but last time I checked, physmap.c was unable to 
> deal with configurations where:
> 
>   - a set_vpp method is required (see cstm_mips_ixx.c, dilnetpc.c,
>     sa1100-flash.c)
>   - different kinds of flash chips exist (see sc520cdp.c)
>   - bank switched flash is used (see octagon-5066.c, elan-104nc.c,
>     sbc_gxx.c,vmax301.c)
>   - offset is not a direct index into the flash (see pci.c)

Ok, you convinced me. 

> > The ones I casually looked at did nothing more than hardcoding
> > addresses and similar stuff. Basically, they condense several config
> > options into a single one, making the kernel configuration easier.
>                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> ... which isn't so bad after all ...

Absolutely not!

> Given that, I would strongly suggest to encourage the use of cmdline.c 
> wherever it makes sense rather than re-inventing that particular wheel and 
> implementing it in {m}physmap.c where it would only be available to a subset 
> of the possible configurations. Mapping devices and partitioning them are 
> independent things and thus they should stay decoupled as they are.

Ok, I should have looked at the code. What mphysmap does is creating
several devices, not partitions. Partitioning should be left out of
mapping, correct.

Thank you for the correction!

Jörn
