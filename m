Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16VcWd-0002ft-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 Jan 2002 17:58:31 +0000
Received: from jocke.lumentis.se (hidden-user@[212.105.56.242])
	by mail.utfors.se (8.8.8/8.8.8) with SMTP id TAA26910
	for <linux-mtd@lists.infradead.org>; Tue, 29 Jan 2002 19:09:06 +0100 (MET)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
To: linux-mtd@lists.infradead.org
Subject: Re: MTD/CFI probe broken?
Date: Tue, 29 Jan 2002 19:09:06 +0100
References: <0111121314140A.28381@jocke.lumentis.se> <02010409585400.10979@jocke.lumentis.se> <02012911331100.15969@jocke.lumentis.se>
In-Reply-To: <02012911331100.15969@jocke.lumentis.se>
MIME-Version: 1.0
Message-Id: <02012919090601.15969@jocke.lumentis.se>
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

Hi again

I found the problem in chips/gen_probe.c:
I changed 
1<<cfi.chipshift) < map->size 
part back to
1<<cfi.chipshift) <= map->size

+       for (base = (1<<cfi.chipshift); base + (1<<cfi.chipshift) <= map->size;
-       for (base = (1<<cfi.chipshift); base + (1<<cfi.chipshift) < map->size;
             base += (1<<cfi.chipshift))
                cp->probe_chip(map, base, &chip[0], &cfi);

What was the reason for this change? Have I broken something else now?

            Jocke

On Tuesday 29 January 2002 11:33, Joakim Tjernlund wrote:
> Hi there
>
> I am trying to upgrade our MTD/JFFS2 code(from October) to the latest  CVS
> in the jffs2-2_4-branch and I think something is broken in the MTD
> sublayer. Now MTD does not find my
> second chip. This is the output from MTD before and after upgrade.
> Before upgrade:
> Lumentis: Found 2 x16 devices at 0x2000000 in 32-bit mode
> 0: offset=0x0,size=0x40000,blocks=128
> 1: offset=0x2000000,size=0x40000,blocks=128
> Creating 5 MTD partitions on "Lumentis":
> 0x00000000-0x00040000 : "PPCBoot"
> 0x00040000-0x00080000 : "Environment"
> 0x00080000-0x00100000 : "FPGA"
> 0x00100000-0x001c0000 : "Kernel"
> 0x001c0000-0x04000000 : "JFFS2"
>
> After upgrade:
> Lumentis flash device: 4000000 at f0000000
> map_priv_1 ioremaped to : c9000000
> map_priv_2 ioremaped to : cd001000
> 0: offset=0x0,size=0x40000,blocks=128
> Creating 5 MTD partitions on "Lumentis":
> 0x00000000-0x00040000 : "PPCBoot"
> 0x00040000-0x00080000 : "Environment"
> 0x00080000-0x00100000 : "FPGA"
> 0x00100000-0x001c0000 : "Kernel"
> 0x001c0000-0x02000000 : "JFFS2"
>
>
>     Jocke
> PS.
>    Had to apply this patch to compile util/mkfs.jffs2:
>
> Index: util/Makefile
> ===================================================================
> RCS file: /home/cvs/mtd/util/Makefile,v
> retrieving revision 1.20
> diff -u -r1.20 Makefile
> --- util/Makefile       2001/09/05 00:18:11     1.20
> +++ util/Makefile       2002/01/29 10:27:41
> @@ -27,7 +27,7 @@
>         $(CC) -o $@ $^ -lz
>
>  compr.o: compr.c
> -       $(CC) $(CFLAGS) -Dprintk=printf -DKERN_NOTICE= -c -o $@ $<
> +       $(CC) $(CFLAGS) -Dprintk=printf -DKERN_NOTICE= -DKERN_WARNING= -c
> -o $@ $<
>
>  jffs2reader: jffs2reader.c
>         $(CC) $(CFLAGS) jffs2reader.c -o jffs2reader -lz
