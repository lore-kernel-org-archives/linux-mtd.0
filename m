Received: from mail170.messagelabs.com ([216.82.253.227])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SkUMV-0002wC-8f
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 06:07:25 +0000
From: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Fri, 29 Jun 2012 16:05:33 +1000
Subject: RE: UBIFS fails to mount on second boot
Message-ID: <6871BC8982B258468985EE735D2C575243C0F0889A@ntcex01.corp.netcomm.com.au>
References: <CAEZtdFU1cET8=kViUsR0Oq3q0ckcFLuKsd_Hc5WHo_uhFiKVBw@mail.gmail.com>,
 <1340806219.3070.23.camel@sauron.fi.intel.com>
In-Reply-To: <1340806219.3070.23.camel@sauron.fi.intel.com>
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

thanks for looking into this.

On Thu, 28 Jun 2012 00:10:19 +1000
Artem Bityutskiy <dedekind1@gmail.com> wrote:
> So this is reproducible? Can you provide me the ubifs image?

Yes, I'll send you the image and a copy of the whole rootfs
partition with the breakage separately.

>
> > It is possible to avoid the failure by performing a large number of
> > filesystem operations (i.e. file system benchmark) during the first
> > session.
>
> Hmm, sounds strange.

While trying to reproduce the problem, I have come across another
way to avoid it. If the boot scripts in the rootfs perform an
ubiformat, attach, mkvol & mount on an unrelated empty mtd
partition, the problem goes away.

Is there any global state shared between separate UBI/UBIFS
partitions?

>
> > Has anyone seen this before? Suggestions?
>
> Similar issue was reported once and the reported disappeared:
> http://lists.infradead.org/pipermail/linux-mtd/2012-June/042046.html

That sounds exactly like this thing.

>
> > The hardware is a TI am335x processor with a 256MB, 2K pages, 128K
> > erase block NAND flash.
>
> SLC flash?

Yes. A unusually resilient one for that, re-writing the same random
pattern into a page takes 2K-10K writes before the first bit error
appears. I'm also running an apparently unnecessary BCH8 ECC on it.

>
> Did you validate your flash with MTD tests?

Yes, see the end of this mail. All tests seem to pass, apart from
the subpage one.

>
> > As is all too common, the flash supports sub-pages, the driver does
> > not. Thus, I'm
> > forcing the VID header offset to 2048.
>
> This means the driver is buggy: it does not support sub-pages but
> still reports that it does. Just fix it instead.

I was under the impression that the subpage capability is extracted
from the ONFI information. So I take it there is a flag for the
driver to override that?

>
> Did you try to mount an empty volume and let UBIFS auto-format it, and
> then reproduce the issue?

No, UBIFS created from an empty partition work OK. In fact, doing that
also stops the rootfs mount failure on the second boot.


MTD tests:

root:~# mtd_debug info /dev/mtd2
mtd.type =3D MTD_NANDFLASH
mtd.flags =3D MTD_CAP_NANDFLASH
mtd.size =3D 33554432 (32M)
mtd.erasesize =3D 131072 (128K)
mtd.writesize =3D 2048 (2K)
mtd.oobsize =3D 64
regions =3D 0

root:/lib/modules/3.1.0+/kernel/drivers/mtd/tests# insmod mtd_nandecctest.=
ko
[  182.206980] mtd_nandecctest: ok - nand-ecc-256
[  182.207470] mtd_nandecctest: ok - nand-ecc-512

root:/lib/modules/3.1.0+/kernel/drivers/mtd/tests# insmod mtd_oobtest.ko
[  380.639390]
[  380.640974] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
[  380.647159] mtd_oobtest: MTD device: 0
[  380.651116] mtd_oobtest: MTD device size 3145728, eraseblock size 13107=
2, page size 2048, count of eraseblocks 24, pages per eraseblock 64, OOB s=
ize 64
[  380.665434] mtd_oobtest: scanning for bad eraseblocks
[  380.673032] mtd_oobtest: scanned 24 eraseblocks, 0 are bad
[  380.678806] mtd_oobtest: test 1 of 5
[  380.682613] mtd_oobtest: erasing whole device
[  380.698184] mtd_oobtest: erased 24 eraseblocks
[  380.702891] mtd_oobtest: writing OOBs of whole device
[  380.721776] mtd_oobtest: written up to eraseblock 0
[  381.043079] mtd_oobtest: written 24 eraseblocks
[  381.047846] mtd_oobtest: verifying all eraseblocks
[  381.057118] mtd_oobtest: verified up to eraseblock 0
[  381.162073] mtd_oobtest: verified 24 eraseblocks
[  381.166949] mtd_oobtest: test 2 of 5
[  381.170706] mtd_oobtest: erasing whole device
[  381.186723] mtd_oobtest: erased 24 eraseblocks
[  381.191397] mtd_oobtest: writing OOBs of whole device
[  381.210406] mtd_oobtest: written up to eraseblock 0
[  381.532281] mtd_oobtest: written 24 eraseblocks
[  381.537043] mtd_oobtest: verifying all eraseblocks
[  381.546248] mtd_oobtest: verified up to eraseblock 0
[  381.647383] mtd_oobtest: verified 24 eraseblocks
[  381.652265] mtd_oobtest: test 3 of 5
[  381.656021] mtd_oobtest: erasing whole device
[  381.672033] mtd_oobtest: erased 24 eraseblocks
[  381.676704] mtd_oobtest: writing OOBs of whole device
[  381.695205] mtd_oobtest: written up to eraseblock 0
[  382.007184] mtd_oobtest: written 24 eraseblocks
[  382.011992] mtd_oobtest: verifying all eraseblocks
[  382.025181] mtd_oobtest: verified up to eraseblock 0
[  382.221002] mtd_oobtest: verified 24 eraseblocks
[  382.225904] mtd_oobtest: test 4 of 5
[  382.229661] mtd_oobtest: erasing whole device
[  382.245284] mtd_oobtest: erased 24 eraseblocks
[  382.249957] mtd_oobtest: attempting to start write past end of OOB
[  382.256486] mtd_oobtest: an error is expected...
[  382.261344] mtd_oobtest: error occurred as expected
[  382.266488] mtd_oobtest: attempting to start read past end of OOB
[  382.272906] mtd_oobtest: an error is expected...
[  382.277760] mtd_oobtest: error occurred as expected
[  382.282901] mtd_oobtest: attempting to write past end of device
[  382.289122] mtd_oobtest: an error is expected...
[  382.293988] mtd_oobtest: error occurred as expected
[  382.299114] mtd_oobtest: attempting to read past end of device
[  382.305258] mtd_oobtest: an error=20is expected...
[  382.310110] mtd_oobtest: error occurred as expected
[  382.316509] mtd_oobtest: attempting to write past end of device
[  382.322774] mtd_oobtest: an error is expected...
[  382.327640] mtd_oobtest: error occurred as expected
[  382.332784] mtd_oobtest: attempting to read past end of device
[  382.338914] mtd_oobtest: an error is expected...
[  382.343780] mtd_oobtest: error occurred as expected
[  382.348905] mtd_oobtest: test 5 of 5
[  382.352673] mtd_oobtest: erasing whole device
[  382.368233] mtd_oobtest: erased 24 eraseblocks
[  382.372927] mtd_oobtest: writing OOBs of whole device
[  382.378483] mtd_oobtest: written up to eraseblock 0
[  382.383839] mtd_oobtest: written up to eraseblock 0
[  382.398650] mtd_oobtest: written 23 eraseblocks
[  382.403440] mtd_oobtest: verifying all eraseblocks
[  382.408613] mtd_oobtest: verified up to eraseblock 0
[  382.416748] mtd_oobtest: verified 23 eraseblocks
[  382.421625] mtd_oobtest: finished with 0 errors
[  382.426402] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

root:/lib/modules/3.1.0+/kernel/drivers/mtd/tests# insmod mtd_pagetest.ko
[  412.379751]
[  412.381334] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
[  412.387509] mtd_pagetest: MTD device: 0
[  412.391558] mtd_pagetest: MTD device size 3145728, eraseblock size 1310=
72, page size 2048, count of eraseblocks 24, pages per eraseblock 64, OOB =
size 64
[  412.405962] mtd_pagetest: scanning for bad eraseblocks
[  412.413604] mtd_pagetest: scanned 24 eraseblocks, 0 are bad
[  412.419468] mtd_pagetest: erasing whole device
[  412.435239] mtd_pagetest: erased 24 eraseblocks
[  412.440004] mtd_pagetest: writing whole device
[  412.484655] mtd_pagetest: written up to eraseblock 0
[  413.405323] mtd_pagetest: written 24 eraseblocks
[  413.410192] mtd_pagetest: verifying all eraseblocks
[  413.607643] mtd_pagetest: verified up to eraseblock 0
[  418.045976] mtd_pagetest: verified 24 eraseblocks
[  418.050937] mtd_pagetest: crosstest
[  418.055640] mtd_pagetest: reading page at 0x0
[  418.060719] mtd_pagetest: reading page at 0x2ff800
[  418.066259] mtd_pagetest: reading page at 0x0
[  418.071319] mtd_pagetest: verifying pages read at 0x0 match
[  418.077249] mtd_pagetest: crosstest ok
[  418.081189] mtd_pagetest: erasecrosstest
[  418.085326] mtd_pagetest: erasing block 0
[  418.090717] mtd_pagetest: writing 1st page of block 0
[  418.096767] mtd_pagetest: reading 1st page of block 0
[  418.102616] mtd_pagetest: verifying 1st page of block 0
[  418.108152] mtd_pagetest: erasing block 0
[  418.112852] mtd_pagetest: writing 1st page of block 0
[  418.118789] mtd_pagetest: erasing block 23
[  418.123988] mtd_pagetest: reading 1st page of block 0
[  418.129789] mtd_pagetest: verifying 1st page of block 0
[  418.135358] mtd_pagetest: erasecrosstest ok
[  418.139755] mtd_pagetest: erasetest
[  418.143437] mtd_pagetest: erasing block 0
[  418.148211] mtd_pagetest: writing 1st page of block 0
[  418.154184] mtd_pagetest: erasing block 0
[  418.158884] mtd_pagetest: reading 1st page of block 0
[  418.164738] mtd_pagetest: verifying 1st page of block 0 is all 0xff
[  418.171365] mtd_pagetest: erasetest ok
[  418.175326] mtd_pagetest: finished with 0 errors
[  418.180184] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

root:/lib/modules/3.1.0+/kernel/drivers/mtd/tests# insmod mtd_readtest.ko
[  474.413743]
[  474.415326] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
[  474.421419] mtd_readtest: MTD device: 0
[  474.425546] mtd_readtest: MTD device size 3145728, eraseblock size 1310=
72, page size 2048, count of eraseblocks 24, pages per eraseblock 64, OOB =
size 64
[  474.439952] mtd_readtest: scanning for bad eraseblocks
[  474.447493] mtd_readtest: scanned 24 eraseblocks, 0 are bad
[  474.453417] mtd_readtest: testing page read
[  475.300355] mtd_readtest: finished
[  475.303986] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

root:/lib/modules/3.1.0+/kernel/drivers/mtd/tests# insmod mtd_speedtest.ko=

[  518.657209]
[  518.658792] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
[  518.664968] mtd_speedtest: MTD device: 0
[  518.669107] mtd_speedtest: MTD device size 3145728, eraseblock size 131=
072, page size 2048, count of eraseblocks 24, pages per eraseblock 64, OOB=
 size 64
[  518.686489] mtd_speedtest: scanning for bad eraseblocks
[  518.694125] mtd_speedtest: scanned 24 eraseblocks, 0 are bad
[  518.719583] mtd_speedtest: testing eraseblock write speed
[  519.609520] mtd_speedtest: eraseblock write speed is 3471 KiB/s
[  519.615799] mtd_speedtest: testing eraseblock read speed
[  520.361942] mtd_speedtest: eraseblock read speed is 4145 KiB/s
[  520.388366] mtd_speedtest: testing page write speed
[  521.280191] mtd_speedtest: page write speed is 3463 KiB/s
[  521.285923] mtd_speedtest: testing page read speed
[  522.033009] mtd_speedtest: page read speed is 4134 KiB/s
[  522.058862] mtd_speedtest: testing 2 page write speed
[  522.949521] mtd_speedtest: 2 page write speed is 3467 KiB/s
[  522.955441] mtd_speedtest: testing 2 page read speed
[  523.699606] mtd_speedtest: 2 page read speed is 4162 KiB/s
[  523.705409] mtd_speedtest: Testing erase speed
[  523.730343] mtd_speedtest: erase speed is 153600 KiB/s
[  523.735778] mtd_speedtest: Testing 2x multi-block erase speed
[  523.752796] mtd_speedtest: 2x multi-block erase speed is 307200 KiB/s
[  523.759569] mtd_speedtest: Testing 4x multi-block erase speed
[  523.776609] mtd_speedtest: 4x multi-block erase speed is 307200 KiB/s
[  523.783411] mtd_speedtest: Testing 8x multi-block erase speed
[  523.800412] mtd_speedtest: 8x multi-block erase speed is 307200 KiB/s
[  523.807214] mtd_speedtest: Testing 16x multi-block erase speed
[  523.825476] mtd_speedtest: 16x multi-block erase speed is 256000 KiB/s
[  523.832394] mtd_speedtest: Testing 32x multi-block erase speed
[  523.849498] mtd_speedtest: 32x multi-block erase speed is 307200 KiB/s
[  523.856396] mtd_speedtest: Testing 64x multi-block erase speed
[  523.873493] mtd_speedtest: 64x multi-block erase speed is 307200 KiB/s
[  523.880356] mtd_speedtest: finished
[  523.884054] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

root:/lib/modules/3.1.0+/kernel/drivers/mtd/tests# insmod mtd_subpagetest.=
ko
[ 1669.603950]
[ 1669.605533] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
[ 1669.611679] mtd_subpagetest: MTD device: 0
[ 1669.616002] mtd_subpagetest: MTD device size 3145728, eraseblock size 1=
31072, page size 2048, subpage size 512, count of eraseblocks 24, pages pe=
r eraseblock 64, OOB size 64
[ 1669.632327] mtd_subpagetest: scanning for bad eraseblocks
[ 1669.640123] mtd_subpagetest: scanned 24 eraseblocks, 0 are bad
[ 1669.646327] mtd_subpagetest: erasing whole device
[ 1669.662277] mtd_subpagetest: erased 24 eraseblocks
[ 1669.667315] mtd_subpagetest: writing whole device
[ 1669.673635] mtd_subpagetest: written up to eraseblock 0
[ 1669.706083] mtd_subpagetest: written 24 eraseblocks
[ 1669.711211] mtd_subpagetest: verifying all eraseblocks
[ 1669.717551] mtd_subpagetest: error: read failed at 0x0
[ 1669.722998] mtd_subpagetest: error -74 occurred
[ 1669.727770] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

______________________________________________________________________
This communication contains information which may be confidential or privi=
leged. The information is intended solely for the use of the individual or=
 entity named above.  If you are not the intended recipient, be aware that=
 any disclosure, copying, distribution or use of the contents of this info=
rmation is prohibited.  If you have received this communication in error, =
please notify me by telephone immediately.
______________________________________________________________________
