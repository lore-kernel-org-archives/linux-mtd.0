Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19N7dw-0008Gi-0v
	for <linux-mtd@lists.infradead.org>; Tue, 03 Jun 2003 09:59:45 +0100
Date: Tue, 3 Jun 2003 11:00:13 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Vikram Mehta <vm6580@hotmail.com>
Message-ID: <20030603090013.GA31569@wohnheim.fh-wedel.de>
References: <Law14-OE60hyN0a0SMh0002fd22@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Law14-OE60hyN0a0SMh0002fd22@hotmail.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: cfi_probe_chip  problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 3 June 2003 13:41:48 -0700, Vikram Mehta wrote:
> 
> 
> Let me tell u in detail with a map
> cfi_probe     calls
>      cfi_probe_chip. calls
>              cfi_send_gen_cmd calls
>                               cfi_build_cmd
>                             cfi_build_cmd  returns
>        cfi_send_gen_cmd:   code
>                         if (prev_val)
>                      *prev_val = cfi_read(map, addr); doesnot satify
>          cfi_send_gen_cmd     calls
>                            cfi_write     The values called are  __u32
> val=250 and __u32 addr = 0
>                             cfi_write calls
>                                    mymap->write16 calls
>                                       __raw_writew(d, map->map_priv_1 +
> adr);
>                                        __raw_writew(d, map->map_priv_1 +
> adr);      returns
>                                      mymap->write16  returns
>                            cfi_write retruns
>         cfi_send_gen_cmd  returns
> cfi_probe_chip again calls
>                cfi_send_gen_cmd
>                        .........similar to above stack
>                               cfi_write     The values called are  __u32
> val=152 and __u32 addr = 170
> cfi_write calls
>                                    mymap->write16 calls
>                                        __raw_writew(d, map->map_priv_1 +
> adr);
>                                                         DOES NOT RETURN
> Whay could be wrong here?

You might be using a proportional font.  The result is completely
unreadable for anyone else.  Set your font to courier and redraw.

Jörn

-- 
Victory in war is not repetitious.
-- Sun Tzu
