Received: from mail85.messagelabs.com ([216.82.241.211])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SlrjV-00018q-Lu
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2012 01:16:52 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Tue, 3 Jul 2012 11:16:43 +1000
Subject: RE: UBIFS fails to mount on second boot
Message-ID: <6871BC8982B258468985EE735D2C575243C0F088B7@ntcex01.corp.netcomm.com.au>
References: <CAEZtdFU1cET8=kViUsR0Oq3q0ckcFLuKsd_Hc5WHo_uhFiKVBw@mail.gmail.com>
 ,<1340806219.3070.23.camel@sauron.fi.intel.com>
 <6871BC8982B258468985EE735D2C575243C0F0889A@ntcex01.corp.netcomm.com.au>,
 <1340977577.3070.207.camel@sauron.fi.intel.com>,
 <6871BC8982B258468985EE735D2C575243C0F088B6@ntcex01.corp.netcomm.com.au>
In-Reply-To: <6871BC8982B258468985EE735D2C575243C0F088B6@ntcex01.corp.netcomm.com.au>
Content-Language: en-AU
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Artem,


I can confirm now that a sync after the first boot also fixes the problem,=
 just like
James reported in

http://lists.infradead.org/pipermail/linux-mtd/2012-June/042046.html

If I power-cycle before sync, the next boot fails. Power cycle after sync,=

and the next (and all subsequent) boots are fine.

Below is what happens during sync, with both UBIFS & UBI debug enabled.


Best regards,

Iwo


root:~# sync
[  656.066204] UBIFS DBG gen: 'sync' in dir ino 157
[  656.071086] UBIFS DBG tnc: search key (157, direntry, 0x1c79da4)
[  656.077483] UBIFS DBG tnc: found 1, lvl 0, n 1
[  656.082186] UBIFS DBG io: LEB 21:48136, direntry node, length 61
[  656.088510] UBI DBG gen: read 61 bytes from LEB 0:21:48136
[  656.094305] UBI DBG eba: read 61 bytes from offset 48136 of LEB 0:21, P=
EB 23
[  656.101737] UBI DBG io: read 61 bytes from PEB 23:52232
[  656.107791] UBIFS DBG gen: inode 255
[  656.111626] UBIFS DBG tnc: search key (255, inode)
[  656.116670] UBIFS DBG tnc: found 1, lvl 0, n 5
[  656.121348] UBIFS DBG tnc: LEB 21:47968, key (255, inode)
[  656.127049] UBIFS DBG io: LEB 21:47968, inode node, length 167
[  656.133207] UBI DBG gen: read 167 bytes from LEB 0:21:47968
[  656.139073] UBI DBG eba: read 167 bytes from offset 47968 of LEB 0:21, =
PEB 23
[  656.146593] UBI DBG io: read 167 bytes from PEB 23:52064
[  656.155255] UBIFS DBG gen: xattr 'security.capability', ino 233 ('busyb=
ox'), buf size 20
[  656.163902] UBIFS DBG tnc: search key (233, xentry, 0x10888ae6)
[  656.170136] UBIFS DBG tnc: found 0, lvl 0, n 0
[  656.179385] UBIFS DBG cmt: start
[  656.182952] UBIFS DBG log: add ref to LEB 249:6144 for jhead 2 (data)
[  656.189767] UBI DBG gen: unmap LEB 0:4
[  656.193746] UBIFS DBG log: writing commit start at LEB 4:0, len 2048
[  656.200432] UBI DBG gen: write 2048 bytes to LEB 0:4:0
[  656.205872] UBI DBG wl: PEB 198 EC 1
[  656.209634] UBI DBG wl: added PEB 198 EC 1 to the protection queue
[  656.216154] UBI DBG eba: write VID hdr and 2048 bytes at offset 0 of LE=
B 0:4, PEB 198
[  656.224405] UBI DBG io: write VID header to PEB 198
[  656.229543] UBI DBG io: write 512 bytes to PEB 198:2048
[  656.235689] UBI DBG io: write 2048 bytes to PEB 198:4096
[  656.241950] UBIFS DBG log: preserve 63:124928, jhead 1 (base), bud byte=
s 2048, cmt_bud_bytes 2048
[  656.251306] UBIFS DBG log: remove 127:118784, jhead 1 (base), bud bytes=
 8192, cmt_bud_bytes 10240
[  656.260661] UBIFS DBG log: preserve 249:0, jhead 2 (data), bud bytes 61=
44, cmt_bud_bytes 16384
[  656.269773] UBIFS DBG cmt: committing 20 znodes
[  656.274555] UBIFS DBG cmt: need about 0 empty LEBS for TNC commit
[  656.280982] UBIFS DBG lp: LEB 130, free 6144, dirty 3712, flags 48
[  656.287500] UBIFS DBG lp: LEB 130, free 2048, dirty 5136, flags 48
[  656.294026] UBIFS DBG lp: LEB 130, free 6144, dirty 3712, flags 48
[  656.300537] UBIFS DBG find: found 1 dirty index LEBs
[  656.305777] UBIFS DBG find: dirtiest index LEB is 129 with dirty 640 an=
d free 0
[  656.313484] UBIFS DBG cmt: number of index LEBs 2
[  656.318428] UBIFS DBG cmt: size of index 246128
[  656.323208] UBIFS DBG lp:=20
[  656.326077] UBIFS DBG cmt: committing 13 cnodes
[  656.330839] UBIFS DBG lp: committing 13 cnodes
[  656.335539] UBIFS DBG lp: LEB 8 free 124928 dirty 1529 to 122880 +1861
[  656.342422] UBIFS DBG cmt: 0 orphans to commit
[  656.347212] UBI DBG gen: write 2048 bytes to LEB 0:130:120832
[  656.353292] UBI DBG eba: write 2048 bytes at offset 120832 of LEB 0:130=
, PEB 194
[  656.361088] UBI DBG io: write 2048 bytes to PEB 194:124928
[  656.367475] UBI DBG gen: write 2048 bytes to LEB 0:130:122880
[  656.373545] UBI DBG eba: write 2048 bytes at offset 122880 of LEB 0:130=
, PEB 194
[  656.381323] UBI DBG io: write 2048 bytes to PEB 194:126976
[  656.390913] UBIFS DBG cmt: TNC height is 5
[  656.395293] UBIFS DBG lp:=20
[  656.398193] UBI DBG gen: write 2048 bytes to LEB 0:8:2048
[  656.403897] UBI DBG eba: write 2048 bytes at offset 2048 of LEB 0:8, PE=
B 169
[  656.411310] UBI DBG io: write 2048 bytes to PEB 169:6144
[  656.417913] UBIFS DBG lp: LPT root is at 8:2223
[  656.422727] UBIFS DBG lp: LPT head is at 8:4096
[  656.427491] UBIFS DBG lp: LPT ltab is at 8:2048
[  656.432278] UBIFS DBG log: old tail was LEB 3:0, new tail is LEB 4:0
[  656.438981] UBIFS DBG io: LEB 1:4096, master node, length 512 (aligned =
2048)
[  656.446451] UBI DBG gen: write 2048 bytes to LEB 0:1:4096
[  656.452153] UBI DBG eba: write 2048 bytes at offset 4096 of LEB 0:1, PE=
B 167
[  656.459567] UBI DBG io: write 2048 bytes to PEB 167:8192
[  656.467262] UBIFS DBG io: LEB 2:4096, master node, length 512 (aligned =
2048)
[  656.474743] UBI DBG gen: write 2048 bytes to LEB 0:2:4096
[  656.480426] UBI DBG eba: write 2048 bytes at offset 4096 of LEB 0:2, PE=
B 168
[  656.487858] UBI DBG io: write 2048 bytes to PEB 168:8192
[  656.494335] UBIFS DBG lp: LEB 8 add 12 to 3390
[  656.499012] UBIFS DBG lp: LEB 8 add 11 to 3402
[  656.503725] UBIFS DBG lp: LEB 8 add 12 to 3413
[  656.508398] UBIFS DBG lp: LEB 8 add 12 to 3425
[  656.513088] UBIFS DBG lp: LEB 8 add 12 to 3437
[  656.517760] UBIFS DBG lp: LEB 8 add 17 to 3449
[ =20656.522450] UBIFS DBG lp: LEB 127, free 0, dirty 9128, flags 16
[  656.528678] UBIFS DBG lp: LEB 127, free -2147483647, dirty -2147483647,=
 flags 0
[  656.536383] UBIFS DBG lp: LEB 127, free 0, dirty 9128, flags 16
[  656.542636] UBIFS DBG log: unmap log LEB 3
[  656.546942] UBI DBG gen: unmap LEB 0:3
[  656.550887] UBI DBG eba: erase LEB 0:3, PEB 196
[  656.555666] UBI DBG wl: PEB 196
[  656.558977] UBI DBG wl: deleted PEB 196 from the protection queue
[  656.565403] UBI DBG wl: schedule erasure of PEB 196, EC 1, torture 0
[  656.572110] UBIFS DBG cmt: commit end
[  656.577344] UBI DBG wl: erase PEB 196 EC 1 LEB 0:3
[  656.582431] UBI DBG wl: erase PEB 196, old EC 1
[  656.587200] UBI DBG io: erase PEB 196
root:~# [  656.593077] UBI DBG wl: erased PEB 196, new EC 2
[  656.598441] UBI DBG io: write EC header to PEB 196
[  656.603570] UBI DBG io: write 512 bytes to PEB 196:0

________________________________________
From: Iwo Mergler
Sent: Monday, 2 July 2012 5:49 PM
To: dedekind1@gmail.com
Cc: linux-mtd@lists.infradead.org
Subject: RE: UBIFS fails to mount on second boot

On Fri, 29 Jun 2012 23:46:17 +1000
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Fri, 2012-06-29 at 16:05 +1000, Iwo Mergler wrote:
> > > > It is possible to avoid the failure by performing a large
> > > > number of filesystem operations (i.e. file system benchmark)
> > > > during the first session.
> > >
> > > Hmm, sounds strange.
> >
> > While trying to reproduce the problem, I have come across another
> > way to avoid it. If the boot scripts in the rootfs perform an
> > ubiformat, attach, mkvol & mount on an unrelated empty mtd
> > partition, the problem goes away.
> >
> > Is there any global state shared between separate UBI/UBIFS
> > partitions?
>
> No. Do you MTD partitions overlap? What is in /proc/mtd ?

root:~# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00300000 00020000 "S1S2EN"
mtd1: 00500000 00020000 "kernela"
mtd2: 02000000 00020000 "roota"
mtd3: 01000000 00020000 "ovla"
mtd4: 00500000 00020000 "kernelb"
mtd5: 02000000 00020000 "rootb"
mtd6: 01000000 00020000 "ovlb"
mtd7: 19300000 00020000 "NAND"

The partitions are passed from U-Boot on the command line.

>
> > > This means the driver is buggy: it does not support sub-pages but
> > > still reports that it does. Just fix it instead.
> >
> > I was under the impression that the subpage capability is extracted
> > from the ONFI information. So I take it there is a flag for the
> > driver to override that?
>
> I do not know your system, but if your flash chip supports subpages,
> but the ECC you use does not allow them, the driver should report that
> sub-pages are not supported..

It's similar to a BeagleBone, but with NAND FLASH, I'm using the
omap2 ECC driver.

So, if I set NAND_NO_SUBPAGE_WRITE in chip.options, UBI will
leave the subpages alone?

>
> > > Did you try to mount an empty volume and let UBIFS auto-format
> > > it, and then reproduce the issue?
> >
> > No, UBIFS created from an empty partition work OK. In fact, doing
> > that also stops the rootfs mount failure on the second boot.
>
> Sounds like this is not UBIFS fault but rather like a side-effect of
> something strange happening elsewhere. Probably it is related to how
> you flash it.

Well, I'm just copying the UBI image into the NAND partition in U-Boot,
while skipping pages containing all 0xFF. It would also skip bad blocks,
but this NAND hasn't got any.

>
> We had the following issue in the past.
>
> 1. You have some UBI on your flash. Then you want to flash an new
> image. 2. The flasher for some reason did not erase some PEBs of the
> partition. Probably because Linux view of the partition and flashers
> did not 100% match. Anyway, on or few PEBs were not erased in the end
> of the partition. Lets call them "ghost PEBs".
> 3. We flashed new image.
> 4. UBI attached the partition, the ghost PEBs were scanned and treated
> as valid PEBs and their data appeared in one of the volumes, because
> their generation numbers were higher than in PEBs from the new image
> (the generation number is in the UBI headers). The ghost data, instead
> of valid data, was read by UBIFS. And we had strange corruptions.
>
> We introduced so-called "image sequence number" to catch such issues.
> It is stored in the EC header. All EC headers on the MTD device have
> to have the same. Every time we generate an image - we pick random
> one. So if there are ghost PEBs, we notice this because they have a
> different image sequence number.
>
> See 'image_seq' in drivers/mtd/ubi/ubi-media.h.
>
> Can this problem affect you as well?

The image is re-created with ubinize on every build. It could affect
me, if I was re-flashing the same image a second time - the sequence
numbers would match then.

But the problem happens with a freshly generated image as well.

>
> If you use 'ubiformat' for flashing your images, it will generate a
> random image sequence number every time it flashes. So it won't use
> the one in the image.
>
> Do you use ubiformat for flashing? If not, try to re-generate your
> image
> - ubinize will put a different number there, and flash it and see what
> happens. You'd get an error like this:
>
> UBI error: process_eb: bad image sequence number 3726164569 in PEB 47,
> expected 642536469

This doesn't seem to happen. Also, the behaviour is no different
between erasing the whole flash and only erasing the rootfs
partition.

>
> Additional thoughts...
>
> I think what could be more interesting if you could enable debugging
> for real. The docs on the web-site are out of date and we switched to
> dynamic debugging, so you need to enable the debugging messages
> differently. I need to write a howto, and I do not know how to do this
> via kernel cmdline so far, need to find out. I know how to do this via
> debugfs. But check Documentation/dynamic-debug-howto.txt.

Thanks for the hint, I have. Turns out it's fairly simple, just pass
ddebug_query=3D"module ubifs +p" on the command line. Unfortunately,
the way ddebug parses the line, you can only have one rule there.

I think there may be a change in newer kernels that allows to use
a semicolon as a separator between rules, but my kernel doesn't
allow that.

So I had to make two debug runs, one each for ubi and ubifs debugging
enabled.

The attached archive contains 4 log files:

konsole_ubi_1.txt   =3D first (successful) boot with UBI debug enabled
konsole_ubi_2.txt   =3D second (failed) boot with UBI debug enabled
konsole_ubifs_1.txt =3D first (successful) boot with UBIFS debug enabled
konsole_ubifs_2.txt =3D second (failed) boot with UBIFS debug enabled


Best regards,

Iwo

______________________________________________________________________
This communication contains information which may be confidential or privi=
leged. The information is intended solely for the use of the individual or=
 entity named above.  If you are not the intended recipient, be aware that=
 any disclosure, copying, distribution or use of the contents of this info=
rmation is prohibited.  If you have received this communication in error, =
please notify me by telephone immediately.
______________________________________________________________________
