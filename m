Received: from ftpbox.mot.com ([129.188.136.101])
	by pentafluge.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DmwpU-0004oZ-BG
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2005 17:51:32 +0100
Received: from az33exr02.mot.com (az33exr02.mot.com [10.64.251.232])
	by ftpbox.mot.com (Motorola/Ftpbox) with ESMTP id j5RGpGHC004793
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Jun 2005 09:51:16 -0700 (MST)
Received: from il02exm15.corp.mot.com (il02exm15.corp.mot.com [10.0.111.27])
	by az33exr02.mot.com (8.13.1/8.13.0) with ESMTP id j5RGskAq000752
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Jun 2005 11:54:46 -0500 (CDT)
Message-ID: <53F44AF77A9F9B458DCE1910C2E6263812072E24@il02exm15.corp.mot.com>
From: Lindstrom James-A19027 <A19027@motorola.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Mon, 27 Jun 2005 11:51:10 -0500
MIME-Version: 1.0
Content-Type: text/plain
Subject: more help needed with MD2202-D384 DoC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(To Andre: Thanks for your reply earlier -- that helped me verify that I at least had the right kernel configuration settings.)

Still, though, I'm unable to get past the point where diskonchip.c is looking for the "DiskOnChip BNAND Media Header".  I've put some debug code in diskonchip.c to print out the 512-byte blocks it's reading off my doc when it tries to find this media header.  [See below.]  Is this in any way informational to people who know more about what it SHOULD be reading?  I notice that in the reads at addresses 0x0000 and 0x4000, text strings appear that say "DiskOnChip  c  M Systems" (retyped, possible case/spacing differences).  I don't see the BNAND or ANAND strings anywhere though.  On the fourth block it reads, I see "ECC error scanning DOC at 0xc000" and then it gives up.

Can anyone offer any clues?  

I'm willing to do some really low-level detective work if someone can at least tell me what those error messages mean, or what it OUGHT to be seeing -- at this point, though, that's unclear to me.  

Many thanks,

jbl


===============

Initializing CS8900
CS8900: toggle_sbhe()
Probing CS8900
CS8900: probe_cs8900a()
CS8900A found at 0x08000300
CS8900: toggle_sbhe()
Waiting for CS8900...CS8900 reset
Link disconnected.
CS8900: probe_cs8900a()
Got MAC from chip
210
Relocating zImage from 00060000 to C0008000 (len=00100000)
Proper ARM zImage ID found. Booting...
Uncompressing Linux........................................................... done, booting the kernel.
Linux version 2.4.18-rmk7-pxa3-cerf3 (root@linux95) (gcc version 2.95.3 20010315 (release)) #42 Mon Jun 27 11:16:35 UTC 2005
CPU: Intel StrongARM-1110 revision 9
Machine: Intrinsyc's Cerf Family of Products

<Jim> normal, unrelated boot messages

INFTL: inftlcore.c $Revision: 1.18 $, inftlmount.c $Revision: 1.16 $
-- SA11xx Flash probe.  Please report results.
* Probing 0x00000000: MSC = 0x8377 16 bit <6>Probe: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
pass
* Probing 0x08000000: MSC = 0x6e74 16 bit <7>CFI: Found no Probe device at location zero
failed
* Probing 0x10000000: MSC = 0xffff 16 bit <7>CFI: Found no Probe device at location zero
failed
* Probing 0x18000000: MSC = 0xffff 16 bit <7>CFI: Found no Probe device at location zero
failed
* Probing 0x40000000: MSC = 0xffff 16 bit <7>CFI: Found no Probe device at location zero
failed
* Probing 0x48000000: MSC = 0xffff 16 bit <7>CFI: Found no Probe device at location zero
failed
-- SA11xx Flash probe complete.
sa1100-0: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
SA1100 flash: CFI device at 0x00000000, 16MiB, 16-bit
request_module[cmdlinepart]: Root fs not mounted
cmdlinepart partition parsing not available
request_module[RedBoot]: Root fs not mounted
RedBoot partition parsing not available
SA1100 flash: using static partition definition
Creating 4 MTD partitions on "sa1100-0":
0x00000000-0x00020000 : "Bootloader"
mtd: Giving out device 0 to Bootloader
0x00020000-0x00060000 : "Params"
mtd: Giving out device 1 to Params
0x00060000-0x00160000 : "Kernel"
mtd: Giving out device 2 to Kernel
0x00160000-0x01000000 : "Filesystem"
mtd: Giving out device 3 to Filesystem
Using configured DiskOnChip probe address 0x10000000
DOC_ChipID_DocMil (0x30)
DiskOnChip found at 0x10000000
NAND device: Manufacturer ID: 0xec, Chip ID: 0x79 (Samsung NAND 128MiB 3,3V 8-bit)
3 NAND chips detected
Bad block table not found for chip 0
Bad block table not found for chip 0
nand_read_ecc: from = 0x00000000, len = 512
 55<U> aa< > 10< > eb< > 42<B> 00< > 00< > 44<D> 69<i> 73<s> 6b<k> 4f<O> 6e<n> 43<C> 68<h> 69<i>
 70<p> 28< > 43<C> 29< > 00< > 32<2> 33<3> 00< > 00< > 00< > 27< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 30<0> 55<U> 24< > 50<P> 6e<n> 50<P> 01< > 02< > 00< > 00< > 00< >
 a7< > 6d<m> 1a< > 01< > 10< > 07< > 00< > 07< > 00< > 01< > 80< > 00< > 94< > 69<i> 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 50<P> 2e< > a1< > 1a< > 00< > 0b< > c0< > 58<X> 74<t>
 18< > 1e< > 57<W> 56<V> 51<Q> 0e< > 1f< > be< > 27< > 00< > b9< > 04< > 00< > f3< > a6< > 59<Y>
 5e< > 5f< > 1f< > 75<u> 04< > b8< > 20< > 01< > cb< > 9c< > 50<P> 53<S> 51<Q> 52<R> 56<V> 57<W>
 55<U> 1e< > 06< > ba< > c0< > 1f< > 33<3> c0< > 8e< > c0< > 33<3> ff< > 83< > c2< > 40< > 8e< >
 da< > 81< > fa< > 00< > a0< > 74<t> 1a< > 33<3> f6< > b9< > 00< > 02< > fc< > ad< > 0b< > c0< >
 75<u> e8< > e2< > f9< > 83< > ff< > 00< > 75<u> 02< > 1e< > 07< > 47<G> 83< > ff< > 40< > 72<r>
 db< > 83< > ff< > 40< > 73<s> 05< > ba< > 00< > 58<X> 8e< > c2< > 0e< > 1f< > 8b< > ec< > 83< >
 ec< > 04< > 8c< > c0< > 8c< > 46<F> fe< > c7< > 46<F> fc< > d4< > 00< > 0e< > e8< > 14< > 00< >
 8b< > 46<F> fe< > 8e< > c0< > 33<3> ff< > b9< > 00< > 80< > 33<3> c0< > fc< > f3< > ab< > 8b< >
 e5< > e9< > 92< > 00< > 55<U> 8b< > ec< > 2e< > a1< > 20< > 00< > 0b< > c0< > 75<u> 03< > 8b< >
 46<F> 04< > 8e< > d8< > bb< > 00< > 00< > c6< > 87< > 03< > 10< > 00< > c6< > 87< > 02< > 10< >
 85< > c6< > 87< > 02< > 10< > 85< > be< > 00< > 08< > b1< > ff< > e8< > 7a<z> 00< > fc< > 06< >
 0e< > 07< > 2e< > 8b< > 16< > 22< > 00< > 46<F> 4e<N> 81< > fa< > 00< > 08< > 7d< > 20< > bf< >
 71<q> 01< > b1< > 50<P> e8< > 61<a> 00< > 83< > c2< > 10< > b1< > 08< > e8< > 5c< > 00< > b9< >
 04< > 00< > e8< > 50<P> 00< > 84< > 87< > 1d< > 10< > a6< > 75<u> dc< > 4e<N> e2< > fa< > 07< >
 4a<J> 32<2> e4< > b1< > 00< > e8< > 40< > 00< > 2e< > 8b< > 0e< > 24< > 00< > 33<3> ff< > f7< >
 c1< > ff< > 01< > 75<u> 0b< > 42<B> e8< > 32<2> 00< > e8< > 29< > 00< > 84< > 87< > 1d< > 10< >
 ac< > 02< > e0< > aa< > 4e<N> e2< > e8< > 2e< > 3a< > 26< > 26< > 00< > 75<u> 06< > 5d< > 06< >
 33<3> c0< > 50<P> cb< > 5d< > cb< > 07< > 1f< > 5d< > 5f< > 5e< > 5a<Z> 59<Y> 5b< > 58<X> 9d< >
 cb< > 84< > a8< > ac< > a0< > e9< > 99< > 16< > e9< > 85< > 16< > e9< > b9< > 16< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >

nand_read_ecc: from = 0x00004000, len = 512
 eb< > 34<4> 55<U> aa< > 18< > d8< > 6f<o> 0c< > 0a< > a3< > 05< > 01< > 53<S> 50<P> 4c<L> 5f< >
 44<D> 69<i> 73<s> 6b<k> 4f<O> 6e<n> 43<C> 68<h> 69<i> 70<p> 20< > 28< > 63<c> 29< > 20< > 4d<M>
 2d< > 53<S> 79<y> 73<s> 74<t> 65<e> 6d<m> 73<s> 00< > 00< > 00< > 00< > 30<0> 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 55<U> 8b< > ec< > 50<P> 53<S> 51<Q> 52<R> 56<V> 57<W> 1e< >
 06< > 9c< > 0e< > 1f< > 2e< > a1< > 29< > 00< > 3d< > 00< > 00< > 75<u> 03< > 8b< > 46<F> 04< >
 a3< > 5c< > 2a< > 2e< > a1< > 2b< > 00< > a3< > 5e< > 2a< > 2e< > a1< > 2d< > 00< > a3< > 60< >
 2a< > 8c< > 16< > 66<f> 2a< > 89< > 26< > 68<h> 2a< > 8c< > c8< > bb< > aa< > 2b< > 81< > c3< >
 00< > 02< > fa< > 8e< > d0< > 8b< > e3< > fb< > a3< > 64<d> 2a< > 2e< > a1< > 2f< > 00< > 3d< >
 00< > 00< > 75<u> 0f< > d1< > eb< > d1< > eb< > d1< > eb< > d1< > eb< > 83< > c3< > 01< > 8c< >
 c8< > 03< > c3< > a3< > 58<X> 2a< > 8c< > d8< > 8e< > c0< > 33<3> c0< > bf< > 8c< > 2a< > b9< >
 aa< > 2b< > 2b< > cf< > fc< > f3< > aa< > e8< > 14< > 00< > fa< > 8e< > 16< > 66<f> 2a< > 8b< >
 26< > 68<h> 2a< > 9d< > 07< > 1f< > 5f< > 5e< > 5a<Z> 59<Y> 5b< > 58<X> 5d< > cb< > c8< > 1a< >
 00< > 00< > 66<f> a1< > 5e< > 2a< > 66<f> 89< > 46<F> f8< > 66<f> c7< > 46<F> f4< > 00< > 00< >
 10< > 00< > e8< > cc< > 00< > 0b< > c0< > 74<t> 03< > e9< > c3< > 00< > c4< > 1e< > 62<b> 2a< >
 26< > 8b< > 47<G> 07< > 89< > 46<F> e6< > 68<h> 92< > 2a< > 66<f> 0f< > b7< > 06< > 5c< > 2a< >
 66<f> c1< > e0< > 04< > 66<f> 0f< > b7< > 16< > 5a<Z> 2a< > 66<f> 03< > c2< > 66<f> 50<P> 66<f>
 0f< > b7< > 06< > 5c< > 2a< > 66<f> c1< > e0< > 04< > 66<f> 03< > c2< > 66<f> 50<P> e8< > ff< >
 27< > 8b< > d8< > 0b< > db< > 74<t> 03< > e9< > 85< > 00< > c7< > 06< > c5< > 2a< > 92< > 2a< >
 68<h> 9c< > 2a< > e8< > e7< > 24< > 8b< > d8< > 0b< > db< > 75<u> 73<s> 1e< > 68<h> 8c< > 2a< >
 1e< > 68<h> 6a<j> 2a< > 6a<j> 04< > e8< > 11< > 03< > e8< > 4b<K> 02< > 52<R> 50<P> 66<f> 58<X>
 66<f> 89< > 46<F> e8< > a1< > 58<X> 2a< > 8b< > 16< > 56<V> 2a< > 83< > c2< > 03< > 89< > 46<F>
 fe< > 89< > 56<V> fc< > 66<f> c7< > 46<F> ec< > 00< > 00< > 00< > 00< > 66<f> 8b< > 46<F> f8< >
 66<f> 89< > 46<F> f0< > eb< > 25< > 8d< > 46<F> f0< > 50<P> 8d< > 46<F> ec< > 50<P> e8< > 95< >
 00< > 8b< > d8< > 0b< > c0< > 74<t> 07< > 3d< > 15< > 00< > 74<t> 23< > eb< > 0d< > a1< > 5c< >
 2a< > 8b< > 4e<N> e6< > 8b< > 16< > 90< > 2a< > ff< > 5e< > fc< > 66<f> 8b< > 46<F> ec< > 66<f>
 3b< > 46<F> e8< > 73<s> 0a< > 66<f> 8b< > 46<F> f0< > 66<f> 3b< > 46<F> f4< > 72<r> c7< > c9< >
 c3< > c8< > 04< > 00< > 00< > c4< > 1e< > 62<b> 2a< > 26< > 8b< > 47<G> 05< > a3< > 90< > 2a< >
 33<3> c0< > 8e< > c0< > 26< > 8b< > 16< > 13< > 04< > c1< > e2< > 06< > eb< > 3e< > 89< > 56<V>
 fe< > c7< > 46<F> fc< > 00< > 00< > c4< > 5e< > fc< > 26< > 81< > 3f< > 55<U> aa< > 75<u> 2b< >
 26< > 80< > 7f< > 06< > 54<T> 75<u> 24< > 26< > 80< > 7f< > 07< > 46<F> 75<u> 1d< > 26< > 80< >
 7f< > 08< > 46<F> 75<u> 16< > 26< > 80< > 7f< > 09< > 53<S> 75<u> 0f< > 26< > 8b< > 47<G> 10< >
 3b< > 06< > 90< > 2a< > 75<u> 05< > b8< > 01< > 00< > eb< > 09< > 42<B> 81< > fa< > 00< > a0< >

nand_read_ecc: from = 0x00008000, len = 512
 5f< > 5e< > 5d< > c2< > 04< > 00< > c8< > 0c< > 00< > 00< > 56<V> 57<W> 8b< > 7e< > 06< > 8b< >
 56<V> 04< > c4< > 5d< > 0a< > 8b< > c2< > d1< > e0< > 03< > d8< > 26< > 8b< > 07< > 89< > 46<F>
 fa< > 83< > 7e< > fa< > ff< > 74<t> 57<W> c4< > 5d< > 06< > 03< > 5e< > fa< > 26< > 80< > 27< >
 80< > 8b< > 5d< > 06< > 03< > 5e< > fa< > 26< > 80< > 0f< > 00< > 66<f> 0f< > b7< > c2< > 8a< >
 4d<M> 44<D> 66<f> d3< > e0< > 66<f> 89< > 46<F> fc< > 33<3> f6< > eb< > 2c< > 57<W> 66<f> ff< >
 76<v> fc< > 66<f> 6a<j> ff< > 8d< > 46<F> f4< > 50<P> e8< > b4< > f9< > 52<R> 50<P> 66<f> 58<X>
 66<f> 89< > 46<F> f6< > 66<f> 83< > 7e< > f6< > ff< > 74<t> 09< > c4< > 5d< > 06< > 03< > 5e< >
 fa< > 26< > fe< > 07< > 46<F> 66<f> ff< > 46<F> fc< > 39<9> 75<u> 42<B> 77<w> cf< > 5f< > 5e< >
 c9< > c2< > 04< > 00< > c8< > 16< > 00< > 00< > 56<V> 57<W> 8b< > 76<v> 08< > 66<f> 8b< > 44<D>
 50<P> 66<f> 3b< > 44<D> 48<H> 72<r> 03< > e9< > 3b< > 04< > 8a< > 44<D> 59<Y> b4< > 00< > 50<P>
 e8< > 1c< > ee< > 8c< > 5e< > ec< > 89< > 46<F> ea< > 66<f> 83< > 7e< > ea< > 00< > 75<u> 03< >
 e9< > 22< > 04< > 66<f> 8b< > 44<D> 50<P> 8a< > 4c<L> 44<D> 66<f> d3< > e8< > 8b< > f8< > 66<f>
 8b< > 44<D> 48<H> 66<f> 2b< > 44<D> 50<P> 66<f> 3b< > 46<F> 04< > 76<v> 06< > 66<f> 8b< > 46<F>
 04< > eb< > 08< > 66<f> 8b< > 44<D> 48<H> 66<f> 2b< > 44<D> 50<P> 66<f> 89< > 46<F> 04< > 8b< >
 1c< > 8b< > 5f< > 29< > c7< > 47<G> 10< > 01< > 00< > 66<f> 68<h> ff< > 00< > 00< > 02< > 1e< >
 ff< > 74<t> 04< > 0e< > e8< > 87< > 3d< > 83< > c4< > 08< > e9< > ce< > 03< > 8b< > 44<D> 50<P>
 23< > 44<D> 46<F> c1< > e0< > 09< > 89< > 46<F> fe< > 8a< > 4c<L> 5c< > 66<f> b8< > 01< > 00< >
 00< > 00< > 66<f> d3< > e0< > 66<f> 0f< > b7< > 56<V> fe< > 66<f> 2b< > c2< > 66<f> c1< > e8< >
 09< > 66<f> 3b< > 46<F> 04< > 73<s> 12< > 66<f> b8< > 01< > 00< > 00< > 00< > 66<f> d3< > e0< >
 66<f> 2b< > c2< > 66<f> c1< > e8< > 09< > eb< > 04< > 66<f> 8b< > 46<F> 04< > 66<f> 89< > 46<F>
 f8< > c4< > 5c< > 0a< > 8b< > c7< > d1< > e0< > 03< > d8< > 26< > 8b< > 07< > 89< > 46<F> fc< >
 83< > 7e< > fc< > ff< > 75<u> 15< > 8a< > 4c<L> 5c< > b8< > 01< > 00< > d3< > e0< > 2b< > 46<F>
 fe< > c1< > e8< > 09< > 66<f> 0f< > b7< > c0< > e9< > 53<S> 03< > 83< > 7e< > fe< > 00< > 75<u>
 11< > 66<f> 68<h> 00< > 00< > 80< > 00< > 1e< > 68<h> 4c<L> 91< > 0e< > e8< > ff< > 3c< > 83< >
 c4< > 08< > c6< > 46<F> f1< > 00< > 80< > 7e< > f1< > 00< > 74<t> 26< > 56<V> ff< > 76<v> fc< >
 57<W> e8< > 7a<z> f5< > 89< > 46<F> fc< > 83< > 7e< > fc< > fe< > 74<t> 06< > 80< > 7e< > f1< >
 40< > 72<r> 06< > b8< > 1f< > 00< > e9< > 2e< > 03< > 83< > 7e< > fc< > ff< > 75<u> 03< > e9< >
 08< > 03< > 8b< > 46<F> fc< > 03< > 44<D> 34<4> 66<f> 0f< > b7< > c0< > 8a< > 4c<L> 5c< > 66<f>
 d3< > e0< > 66<f> 0f< > b7< > 56<V> fe< > 66<f> 03< > c2< > 66<f> 89< > 46<F> f4< > c6< > 46<F>
 f0< > 00< > e9< > d1< > 02< > 66<f> 8b< > 46<F> f4< > 66<f> c1< > e8< > 09< > 23< > 44<D> 46<F>
 d1< > e0< > 8b< > d8< > 83< > bf< > 4c<L> 91< > 00< > 75<u> 0b< > 56<V> 66<f> ff< > 76<v> f4< >
 e8< > 6a<j> f5< > 88< > 46<F> ee< > 66<f> 8b< > 46<F> f4< > 66<f> 05< > 00< > 02< > 00< > 00< >

nand_read_ecc: from = 0x0000c000, len = 512
nand_read_ecc: Failed ECC read, page 0x000000c0 on chip 0
ECC error scanning DOC at 0xc000
 bf< > 5c< > 00< > 00< > 2e< > 03< > 00< > 00< > 00< > 00< > 00< > 00< > 8a< > 00< > 00< > 00< >
 48<H> 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 76<v> 01< > 00< > 00< > 2e< > 01< > 00< > 00< > 2e< > 01< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 02< > 00< > 00< > 1a< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >
 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< > 00< >

DiskOnChip BNAND Media Header not found.

<Jim> ... boots fine at this point
