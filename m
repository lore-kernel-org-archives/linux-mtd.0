Received: from law14-f87.law14.hotmail.com ([64.4.21.87] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19N81A-0008VW-Ss
	for <linux-mtd@lists.infradead.org>; Tue, 03 Jun 2003 10:23:45 +0100
From: "Vikram Mehta" <vm6580@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 03 Jun 2003 14:53:48 +0530
Mime-Version: 1.0
Message-ID: <Law14-F878P8Sp1ppTN0002fd45@hotmail.com>
Content-Type: text/plain; format=flowed
cc: uclinux-dev@uclinux.org
Subject: cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type,
 NULL); not workin
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi joern,
Thanx
I agree this format was confusing. So let me put it simply

in cfi_probe.c  in  cfi_probe_chip function

cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
Works
but

cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
doesnot work.
It fails when   __raw_writew(d, map->map_priv_1 +adr); is called in its 
stack.

The stack built is (downwards)

cfi_send_gen_cmd
cfi_h_cfi_build_cmd
cfi_write
my_physmap_write16
__raw_writew(d, map->map_priv_1 +adr)



So what do u think. I hope it i s amore understandable format now.



>From: Jörn Engel <joern@wohnheim.fh-wedel.de>
>To: Vikram Mehta <vm6580@hotmail.com>
>CC: mtd <linux-mtd@lists.infradead.org>
>Subject: Re: cfi_probe_chip  problem
>Date: Tue, 3 Jun 2003 11:00:13 +0200
>
>On Tue, 3 June 2003 13:41:48 -0700, Vikram Mehta wrote:
> >
> >
> > Let me tell u in detail with a map
> > cfi_probe     calls
> >      cfi_probe_chip. calls
> >              cfi_send_gen_cmd calls
> >                               cfi_build_cmd
> >                             cfi_build_cmd  returns
> >        cfi_send_gen_cmd:   code
> >                         if (prev_val)
> >                      *prev_val = cfi_read(map, addr); doesnot satify
> >          cfi_send_gen_cmd     calls
> >                            cfi_write     The values called are  __u32
> > val=250 and __u32 addr = 0
> >                             cfi_write calls
> >                                    mymap->write16 calls
> >                                       __raw_writew(d, map->map_priv_1 +
> > adr);
> >                                        __raw_writew(d, map->map_priv_1 +
> > adr);      returns
> >                                      mymap->write16  returns
> >                            cfi_write retruns
> >         cfi_send_gen_cmd  returns
> > cfi_probe_chip again calls
> >                cfi_send_gen_cmd
> >                        .........similar to above stack
> >                               cfi_write     The values called are  __u32
> > val=152 and __u32 addr = 170
> > cfi_write calls
> >                                    mymap->write16 calls
> >                                        __raw_writew(d, map->map_priv_1 +
> > adr);
> >                                                         DOES NOT RETURN
> > Whay could be wrong here?
>
>You might be using a proportional font.  The result is completely
>unreadable for anyone else.  Set your font to courier and redraw.
>
>Jörn
>
>--
>Victory in war is not repetitious.
>-- Sun Tzu

_________________________________________________________________
HCL Beanstalk PCs. You could win one. 
http://server1.msn.co.in/sp03/hclbeanstalktour/index.asp Interested?
