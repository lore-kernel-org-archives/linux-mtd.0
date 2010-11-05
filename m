Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PEKDv-00048h-4R
	for linux-mtd@lists.infradead.org; Fri, 05 Nov 2010 11:12:48 +0000
Date: Fri, 5 Nov 2010 13:12:38 +0200
From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
To: ext Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCHv2 0/3] mtd: onenand: add cache program feature for 4kb
	page onenand
Message-ID: <20101105111238.GA21115@nokia.com>
References: <1288781721-31771-1-git-send-email-roman.tereshonkov@nokia.com>
	<AANLkTikUSTnPedgdP19_bNbhOtSdfApdyCLKMyn+6Ext@mail.gmail.com>
	<E1C7579D1379824DAE67858071C810383717438EEF@NOK-EUMSG-02.mgdnok.nokia.com>
	<AANLkTikrO1BC7LuUCzuNg7b3gAuC=DYLKLRnFh4rPoco@mail.gmail.com>
	<20101104124016.GA13312@nokia.com>
	<AANLkTimJK4H00ug-SCybUcMYq+QrSMncfZ7hrCYyegec@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AANLkTimJK4H00ug-SCybUcMYq+QrSMncfZ7hrCYyegec@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 04, 2010 at 01:47:26PM +0100, ext Kyungmin Park wrote:
> I think it has some slow write performance since two page write is lower than one page. It means cache program is not work as expected.
> That's reason no warning message. In my case I enabled the sync write and get 10MiB or more performance. Please see my speedtest result.

Where can I see your speedtest results? If it was in attachment when I have not got any such.


These are my speed test results for different write sizes.
write size (bytes):            4096  8192 16384 32768 65536 131072 262144
cache program disabled (KB/s): 8827  8904  8827  8982  8982   8982   8982
cache program enabled (KB/s):  8752 10893 12337 13298 13837  14222  14422


Regards
Roman Tereshonkov

> 
> Thank you,
> Kyungmin Park
> 
> Sent from Android
> 
> On Nov 4, 2010 9:40 PM, "Roman Tereshonkov" <roman.tereshonkov@nokia.com<mailto:roman.tereshonkov@nokia.com>> wrote:
> >
> > Hi Park,
> >
> > I tried several times
> > fsstress -p 3 -n 10000 -d /mnt/ubifs
> > for 28 MB onenand partition. No warnings observed.
> > The logs are below.
> >
> >
> > # modprobe ubi mtd=4
> > [ 101.013549] UBI: attaching mtd4 to ubi0
> > [ 101.017486] UBI: physical eraseblock size: 262144 bytes (256 KiB)
> > [ 101.023895] UBI: logical eraseblock size: 253952 bytes
> > [ 101.029510] UBI: smallest flash I/O unit: 4096
> > [ 101.034271] UBI: VID header offset: 4096 (aligned 4096)
> > [ 101.040405] UBI: data offset: 8192
> > [ 101.054565] UBI: empty MTD device detected
> > [ 101.058868] UBI: create volume table (copy #1)
> > [ 101.067504] UBI: create volume table (copy #2)
> > [ 101.077239] UBI: attached mtd4 to ubi0
> > [ 101.081054] UBI: MTD device name: "swap"
> > [ 101.086090] UBI: MTD device size: 32 MiB
> > [ 101.091033] UBI: number of good PEBs: 123
> > [ 101.095733] UBI: number of bad PEBs: 5
> > [ 101.100280] UBI: max. allowed volumes: 128
> > [ 101.104949] UBI: wear-leveling threshold: 8192
> > [ 101.109771] UBI: number of internal volumes: 1
> > [ 101.114257] UBI: number of user volumes: 0
> > [ 101.118804] UBI: available PEBs: 117
> > [ 101.123504] UBI: total number of reserved PEBs: 6
> > [ 101.128295] UBI: number of PEBs reserved for bad PEB handling: 2
> > [ 101.134399] UBI: max/mean erase counter: 0/0
> > [ 101.138763] UBI: image sequence number: 0
> > [ 101.142852] UBI: background thread "ubi_bgt0d" started, PID 104
> > [ 101.150085] modprobe used greatest stack depth: 6068 bytes left
> > # modprobe ubifs
> > # ubimkvol /dev/ubi0 -N test -m
> > Set volume size to 29712384
> > Volume ID 0, size 117 LEBs (29712384 bytes, 28.3 MiB), LEB size [ 111.348449] ubimkvol used greatest stack depth: 5820 bytes left
> > 253952 bytes (248.0 KiB), dynamic, name "test", alignment 1
> > #mount -t ubifs ubi0_0 /mnt/ubifs
> > [ 133.515991] UBIFS: default file-system created
> > [ 133.565490] UBIFS: mounted UBI device 0, volume 0, name "test"
> > [ 133.571594] UBIFS: file system size: 27426816 bytes (26784 KiB, 26 MiB, 108 LEBs)
> > [ 133.579406] UBIFS: journal size: 2031617 bytes (1984 KiB, 1 MiB, 6 LEBs)
> > [ 133.586791] UBIFS: media format: w4/r0 (latest is w4/r0)
> > [ 133.592712] UBIFS: default compressor: lzo
> > [ 133.596893] UBIFS: reserved for root: 1295435 bytes (1265 KiB)
> > [ 133.604675] mount used greatest stack depth: 5768 bytes left
> > # fsstress -p 3 -n 10 -d /mnt/ubifs
> > seed = 397323
> > # fsstress -p 3 -n 100 -d /mnt/ubifs
> > seed = 826848
> > # fsstress -p 3 -n 1000 -d /mnt/ubifs
> > seed = 209658
> > # fsstress -p 3 -n 10000 -d /mnt/ubifs
> > seed = 748381
> > #
> >
> >
> > mtd_speedtest gives no warnings also. Only bad block related errors:
> >
> > # insmod mtd_speedtest.ko dev=4
> > [ 23.759948]
> > [ 23.761505] =================================================
> > [ 23.767639] mtd_speedtest: MTD device: 4
> > [ 23.771728] mtd_speedtest: MTD device size 33554432, eraseblock size 262144, page size 4096, count of eraseblocks 128, pages per eraseblock 64, OOB size 128
> > [ 23.800933] mtd_speedtest: scanning for bad eraseblocks
> > [ 23.808441] Bad eraseblock 42 at 0x00a80000
> > [ 23.812713] mtd_speedtest: block 22 is bad
> > [ 23.818542] Bad eraseblock 60 at 0x00f00000
> > [ 23.822814] mtd_speedtest: block 40 is bad
> > [ 23.827423] Bad eraseblock 65 at 0x01040000
> > [ 23.831665] mtd_speedtest: block 45 is bad
> > [ 23.837860] Bad eraseblock 87 at 0x015c0000
> > [ 23.842163] mtd_speedtest: block 67 is bad
> > [ 23.850891] Bad eraseblock 136 at 0x02200000
> > [ 23.855224] mtd_speedtest: block 116 is bad
> > [ 23.860534] mtd_speedtest: scanned 128 eraseblocks, 5 are bad
> > [ 24.010498] mtd_speedtest: testing eraseblock write speed
> > [ 26.267669] mtd_speedtest: eraseblock write speed is 13988 KiB/s
> > [ 26.273803] mtd_speedtest: testing eraseblock read speed
> > [ 27.286437] mtd_speedtest: eraseblock read speed is 31269 KiB/s
> > [ 27.430114] mtd_speedtest: testing page write speed
> > [ 36.082855] mtd_speedtest: page write speed is 3641 KiB/s
> > [ 36.088409] mtd_speedtest: testing page read speed
> > [ 37.086517] mtd_speedtest: page read speed is 31678 KiB/s
> > [ 37.444854] mtd_speedtest: testing 2 page write speed
> > [ 60.709533] mtd_speedtest: 2 page write speed is 1353 KiB/s
> > [ 60.715148] mtd_speedtest: testing 2 page read speed
> > [ 61.624176] mtd_speedtest: 2 page read speed is 34870 KiB/s
> > [ 61.629791] mtd_speedtest: Testing erase speed
> > [ 61.868347] mtd_speedtest: erase speed is 133991 KiB/s
> > [ 61.873565] mtd_speedtest: finished
> > [ 61.877105] =================================================
> >
> >
> >
> > Regards
> > Roman Tereshonkov
> >
> > On Thu, Nov 04, 2010 at 10:10:36AM +0100, ext Kyungmin Park wrote:
> >> On Thu, Nov 4, 2010 at 5:58 PM, <roman.tereshonkov@nokia.com<mailto:roman.tereshonkov@nokia.com>> wrote:
> >> >
> >> > Hi,
> >> >
> >> >
> >> > I used driver/mtd/tests and did not observe any warnings except a couple of bad blocks for some boards.
> >> Yes in case of mtd_test* there's no messages.
> >> >
> >> > Can you discribe your test case for me to reproduce it. And show your kernel log when it happens if possible?
> >> > Is it for 2kb or 4kb page onenand?
> >>
> >> Mount ubifs on OneNAND which has 4KiB pagesize and run fsstress -p 3
> >> -n 1000000000 -d /ubifs
> >>
> >> then you can or maybe see the UBI scrubbing message.
> >>
> >> Thank you,
> >> Kyungmin Park
> >> >
> >> >
> >> > Regards
> >> > Roman Tereshonkov
> >> >
> >> >
> >> >>-----Original Message-----
> >> >>From: kyungmin78@gmail.com<mailto:kyungmin78@gmail.com> [mailto:kyungmin78@gmail.com<mailto:kyungmin78@gmail.com>] On
> >> >>Behalf Of ext Kyungmin Park
> >> >>Sent: 04 November, 2010 03:15
> >> >>To: Tereshonkov Roman (Nokia-MS/Helsinki)
> >> >>Cc: linux-mtd@lists.infradead.org<mailto:linux-mtd@lists.infradead.org>
> >> >>Subject: Re: [PATCHv2 0/3] mtd: onenand: add cache program
> >> >>feature for 4kb page onenand
> >> >>
> >> >>Hi,
> >> >>
> >> >>One concern is that after apply patch, there are some 1-bit ECC
> >> >>warnings so UBI scrubbing messages are displayed.
> >> >>
> >> >>Are there these message at your board?
> >> >>
> >> >>Thank you,
> >> >>Kyungmin Park
> >> >>
> >> >>On Wed, Nov 3, 2010 at 7:55 PM, Roman Tereshonkov
> >> >><roman.tereshonkov@nokia.com<mailto:roman.tereshonkov@nokia.com>> wrote:
> >> >>> Implement cache program feature for 4KB page onenand.
> >> >>> This feature improves the write data performance.
> >> >>> The observed 128KB data program speed change is
> >> >>> from 8827KB/s to 14156 KB/s when the feature is enabled.
> >> >>>
> >> >>> Roman Tereshonkov (3):
> >> >>>  mtd: onenand: add option and variable for cache program feature
> >> >>>  mtd: onenand: fix omap2 code to handle cache program feature
> >> >>>  mtd: onenand: implement cache program feature for 4kb page onenand
> >> >>>
> >> >>>  drivers/mtd/onenand/omap2.c        |   12 +++++++++---
> >> >>>  drivers/mtd/onenand/onenand_base.c |   22 +++++++++++++++++++---
> >> >>>  include/linux/mtd/onenand.h        |   12 ++++++++++++
> >> >>>  3 files changed, 40 insertions(+), 6 deletions(-)
> >> >>>
> >> >>>
> >> >>> ______________________________________________________
> >> >>> Linux MTD discussion mailing list
> >> >>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >> >>>
> >> >>
> >> > ______________________________________________________
> >> > Linux MTD discussion mailing list
> >> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >> >
