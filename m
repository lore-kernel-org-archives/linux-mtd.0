Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 184Kwj-0000cC-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2002 13:49:14 +0100
Message-Id: <200210231319.g9NDJ9s02156@dagobert.svc.sysgo.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rkaiser@sysgo.de
To: linux-mtd@lists.infradead.org
Subject: Re: parse_cmdline_partitions equivalent for map_info
Date: Wed, 23 Oct 2002 15:25:39 +0200
References: <20021022172914.GA18411@wohnheim.fh-wedel.de>
In-Reply-To: <20021022172914.GA18411@wohnheim.fh-wedel.de>
Cc: =?iso-8859-1?q?J=F6rn=20Engel?= <joern@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi Jörn,

no offense, but ...

Am Dienstag, 22. Oktober 2002 19:29 schrieb Jörn Engel:
> Actually, I am not very sure about cmdline.c at all. Is there a single
> mapping driver that could not be replaced by physmap.c or mphysmap.c?

Not sure about mphysmap.c, but last time I checked, physmap.c was unable to 
deal with configurations where:

  - a set_vpp method is required (see cstm_mips_ixx.c, dilnetpc.c,
    sa1100-flash.c)
  - different kinds of flash chips exist (see sc520cdp.c)
  - bank switched flash is used (see octagon-5066.c, elan-104nc.c,
    sbc_gxx.c,vmax301.c)
  - offset is not a direct index into the flash (see pci.c)


> The ones I casually looked at did nothing more than hardcoding
> addresses and similar stuff. Basically, they condense several config
> options into a single one, making the kernel configuration easier.
                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
... which isn't so bad after all ...

BTW: That so many mapping drivers do their own (hardcoded) partitioning 
instead of using cmdline.c is possibly because many of them existed before 
cmdline.c was added and nobody has since bothered to adapt them. And then 
there is also the copy-paste effect (new mapping mapping drivers being 
derived from existing ones, thus copying their shortcomings).


>
> A quick grep on 2.4.19-ac4 showed that 32 out of 32 mapping drivers
> use ioremap.

This doesn't imply that they could all be replaced by physmap.c (see above). 

I agree that many of the existing mapping drivers are basically specialized 
versions of physmap.c. Probably one could make many (most ?) of them obsolete 
by adding just a little bit of functionality to physmap.c, and that would be 
a Good Thing(tm).
But my experience tells me that one should never underestimate the hardware 
designer's creativity when it comes to inventing new weird ways of connecting 
a flash chip to a bus. So, the need for specialized mapping drivers to 
support weird configurations will never vanish completely. 

Given that, I would strongly suggest to encourage the use of cmdline.c 
wherever it makes sense rather than re-inventing that particular wheel and 
implementing it in {m}physmap.c where it would only be available to a subset 
of the possible configurations. Mapping devices and partitioning them are 
independent things and thus they should stay decoupled as they are.


Rob

----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO AG
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
