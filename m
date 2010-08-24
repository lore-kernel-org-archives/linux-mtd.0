Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OnpfK-0007v2-06
	for linux-mtd@lists.infradead.org; Tue, 24 Aug 2010 09:19:35 +0000
Received: by iwn41 with SMTP id 41so7258390iwn.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Aug 2010 02:19:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1282640035.24044.149.camel@localhost>
References: <AANLkTikC6wxXV08=AYsqn56h8Cs-qC_-b8hNyq9DUWps@mail.gmail.com>
	<1280150054.14917.108.camel@localhost>
	<AANLkTik7CdwdyhzVYFXG66V3LKZvqnZhLbg4eVC0nQ=S@mail.gmail.com>
	<1280244340.3021.38.camel@localhost.localdomain>
	<AANLkTi=7-Ur35OzqF7iJtiPzfc-Jp-ANGwa3g_Y=+ae8@mail.gmail.com>
	<1280471755.2838.29.camel@localhost.localdomain>
	<AANLkTikZb=R=8BObvTN6uGaZGAmvvUZd4oYKvkCJih7H@mail.gmail.com>
	<AANLkTikkRNqnEX0PkHigv=zT+Z36J52DEtoVeMGbBExf@mail.gmail.com>
	<AANLkTim6U4uO_2yf-VyoL+4j9-yDkouTQdP_aszpEXwW@mail.gmail.com>
	<1282566891.24044.32.camel@localhost>
	<AANLkTinqAT=aCYFBi8Nri72L898U0k6dTk3z90OJOpRc@mail.gmail.com>
	<1282574489.24044.74.camel@localhost>
	<AANLkTik+T6HA+umRvxj5oPmGwf5=tQvk-sNzSTqaq8VB@mail.gmail.com>
	<1282640035.24044.149.camel@localhost>
Date: Tue, 24 Aug 2010 11:19:32 +0200
Message-ID: <AANLkTikidFJWVGVp-y2kzat7+PxVFx6e3-ozYx_wP=vZ@mail.gmail.com>
Subject: Re: error!: "/dev/ubi0" is not a character device ?!?
From: Arno Steffen <arno.steffen@googlemail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/8/24 Artem Bityutskiy <dedekind1@gmail.com>:
> On Tue, 2010-08-24 at 10:32 +0200, Arno Steffen wrote:
>> Please let me know, whether I used it right. I enabled in config
>> build test modules, "make modules" and copied this modules to my
>> embedded device. There I just typed insmod mtd_readtest.ko
>> As far as I could see it just accesses /dev/mtd0. This is read only
>> (Xloader and HW-ECC). Can this cause this problems? How to check other
>> parts of Flash. Couldn't found some docu to the test modules.
>>
>> What does this mean:
>>
>> mtd_readtest: finished with errors
>> mtd_readtest: error -74 occurred
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> insmod: cannot insert 'mtd_readtest.ko': Bad message
>
> Please, check modinfo mtd_readtest and notice there is a 'dev' parameter
> which you can use to specify the mtd device to test. Use it.
>
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
>
>

To late ... I immolate my Xloader and get some better looking results.
Also modinfo is not available on my system.
May I ask you to have a look at it. I can't really interpet some messgages.

[root@or:/opt/configs]# insmod mtd_nandecctest.ko
mtd_nandecctest: ok - nand-ecc-256
mtd_nandecctest: ok - nand-ecc-512
[root@or:/opt/configs]# insmod mtd_oobtest.ko

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
mtd_oobtest: MTD device: 0
mtd_oobtest: MTD device size 262144, eraseblock size 131072, page size
2048, count of eraseblocks 2, pages per eraseblock 64, OOB size 64
mtd_oobtest: scanning for bad eraseblocks
mtd_oobtest: scanned 2 eraseblocks, 0 are bad
mtd_oobtest: test 1 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 2 eraseblocks
mtd_oobtest: writing OOBs of whole device
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written 2 eraseblocks
mtd_oobtest: verifying all eraseblocks
mtd_oobtest: verified up to eraseblock 0
mtd_oobtest: verified 2 eraseblocks
mtd_oobtest: test 2 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 2 eraseblocks
mtd_oobtest: writing OOBs of whole device
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written 2 eraseblocks
mtd_oobtest: verifying all eraseblocks
mtd_oobtest: verified up to eraseblock 0
mtd_oobtest: verified 2 eraseblocks
mtd_oobtest: test 3 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 2 eraseblocks
mtd_oobtest: writing OOBs of whole device
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written 2 eraseblocks
mtd_oobtest: verifying all eraseblocks
mtd_oobtest: verified up to eraseblock 0
mtd_oobtest: verified 2 eraseblocks
mtd_oobtest: test 4 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 2 eraseblocks
mtd_oobtest: attempting to start write past end of OOB
mtd_oobtest: an error is expected...
mtd_oobtest: error occurred as expected
mtd_oobtest: attempting to start read past end of OOB
mtd_oobtest: an error is expected...
mtd_oobtest: error occurred as expected
mtd_oobtest: attempting to write past end of device
mtd_oobtest: an error is expected...
mtd_oobtest: error occurred as expected
mtd_oobtest: attempting to read past end of device
mtd_oobtest: an error is expected...
mtd_oobtest: error: read past end of device
mtd_oobtest: attempting to write past end of device
mtd_oobtest: an error is expected...
mtd_oobtest: error occurred as expected
mtd_oobtest: attempting to read past end of device
mtd_oobtest: an error is expected...
mtd_oobtest: error: read past end of device
mtd_oobtest: test 5 of 5
mtd_oobtest: erasing whole device
mtd_oobtest: erased 2 eraseblocks
mtd_oobtest: writing OOBs of whole device
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written up to eraseblock 0
mtd_oobtest: written 1 eraseblocks
mtd_oobtest: verifying all eraseblocks
mtd_oobtest: verified up to eraseblock 0
mtd_oobtest: verified 1 eraseblocks
mtd_oobtest: finished with 2 errors
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[root@or:/opt/configs]# insmod mtd_readtest.ko

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
mtd_readtest: MTD device: 0
mtd_readtest: MTD device size 262144, eraseblock size 131072, page
size 2048, count of eraseblocks 2, pages per eraseblock 64, OOB size
64
mtd_readtest: scanning for bad eraseblocks
mtd_readtest: scanned 2 eraseblocks, 0 are bad
mtd_readtest: testing page read
mtd_readtest: finished
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[root@or:/opt/configs]# insmod mtd_pagetest.ko

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
mtd_pagetest: MTD device: 0
mtd_pagetest: MTD device size 262144, eraseblock size 131072, page
size 2048, count of eraseblocks 2, pages per eraseblock 64, OOB size
64
mtd_pagetest: scanning for bad eraseblocks
mtd_pagetest: scanned 2 eraseblocks, 0 are bad
mtd_pagetest: erasing whole device
mtd_pagetest: erased 2 eraseblocks
mtd_pagetest: writing whole device
mtd_pagetest: written up to eraseblock 0
mtd_pagetest: written 2 eraseblocks
mtd_pagetest: verifying all eraseblocks
mtd_pagetest: verified up to eraseblock 0
mtd_pagetest: verified 2 eraseblocks
mtd_pagetest: crosstest
mtd_pagetest: reading page at 0x0
mtd_pagetest: reading page at 0x3f800
mtd_pagetest: reading page at 0x0
mtd_pagetest: verifying pages read at 0x0 match
mtd_pagetest: crosstest ok
mtd_pagetest: erasecrosstest
mtd_pagetest: erasing block 0
mtd_pagetest: writing 1st page of block 0
mtd_pagetest: reading 1st page of block 0
mtd_pagetest: verifying 1st page of block 0
mtd_pagetest: erasing block 0
mtd_pagetest: writing 1st page of block 0
mtd_pagetest: erasing block 1
mtd_pagetest: reading 1st page of block 0
mtd_pagetest: verifying 1st page of block 0
mtd_pagetest: erasecrosstest ok
mtd_pagetest: erasetest
mtd_pagetest: erasing block 0
mtd_pagetest: writing 1st page of block 0
mtd_pagetest: erasing block 0
mtd_pagetest: reading 1st page of block 0
mtd_pagetest: verifying 1st page of block 0 is all 0xff
mtd_pagetest: erasetest ok
mtd_pagetest: finished with 0 errors
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[root@or:/opt/configs]# insmod mtd_speedtest.ko

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
mtd_speedtest: MTD device: 0
mtd_speedtest: MTD device size 262144, eraseblock size 131072, page
size 2048, count of eraseblocks 2, pages per eraseblock 64, OOB size
64
mtd_speedtest: scanning for bad eraseblocks
mtd_speedtest: scanned 2 eraseblocks, 0 are bad
mtd_speedtest: testing eraseblock write speed
mtd_speedtest: eraseblock write speed is 2509 KiB/s
mtd_speedtest: testing eraseblock read speed
mtd_speedtest: eraseblock read speed is 6095 KiB/s
mtd_speedtest: testing page write speed
mtd_speedtest: page write speed is 2534 KiB/s
mtd_speedtest: testing page read speed
mtd_speedtest: page read speed is 6095 KiB/s
mtd_speedtest: testing 2 page write speed
mtd_speedtest: 2 page write speed is 2534 KiB/s
mtd_speedtest: testing 2 page read speed
mtd_speedtest: 2 page read speed is 6095 KiB/s
mtd_speedtest: Testing erase speed
mtd_speedtest: erase speed is 256000 KiB/s
mtd_speedtest: finished
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[root@or:/opt/configs]# insmod mtd_subpagetest.ko

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
mtd_subpagetest: MTD device: 0
mtd_subpagetest: MTD device size 262144, eraseblock size 131072, page
size 2048, subpage size 512, count of eraseblocks 0, pages per
eraseblock 0, OOB size 64
mtd_subpagetest: scanning for bad eraseblocks
mtd_subpagetest: scanned 2 eraseblocks, 0 are bad
mtd_subpagetest: erasing whole device
mtd_subpagetest: erased 2 eraseblocks
mtd_subpagetest: writing whole device
mtd_subpagetest: error: write failed at 0x200
mtd_subpagetest:   write size: 0x200
mtd_subpagetest:   written: 0x0
mtd_subpagetest: error -5 occurred
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
insmod: cannot insert 'mtd_subpagetest.ko': Input/output error
[root@or:/opt/configs]# insmod mtd_stresstest.ko

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
mtd_stresstest: MTD device: 0
mtd_stresstest: MTD device size 262144, eraseblock size 131072, page
size 2048, count of eraseblocks 2, pages per eraseblock 64, OOB size
64
mtd_stresstest: scanning for bad eraseblocks
mtd_stresstest: scanned 2 eraseblocks, 0 are bad
mtd_stresstest: doing operations
mtd_stresstest: 0 operations done
mtd_stresstest: 1024 operations done
mtd_stresstest: 2048 operations done
mtd_stresstest: 3072 operations done
mtd_stresstest: 4096 operations done
mtd_stresstest: 5120 operations done
mtd_stresstest: 6144 operations done
mtd_stresstest: 7168 operations done
mtd_stresstest: 8192 operations done
mtd_stresstest: 9216 operations done
mtd_stresstest: finished, 10000 operations done
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

[root@or:/opt/configs]# insmod mtd_subpagetest.ko

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
mtd_subpagetest: MTD device: 0
mtd_subpagetest: MTD device size 262144, eraseblock size 131072, page
size 2048, subpage size 512, count of eraseblocks 0, pages per
eraseblock 0, OOB size 64
mtd_subpagetest: scanning for bad eraseblocks
mtd_subpagetest: scanned 2 eraseblocks, 0 are bad
mtd_subpagetest: erasing whole device
mtd_subpagetest: erased 2 eraseblocks
mtd_subpagetest: writing whole device
mtd_subpagetest: error: write failed at 0x200
mtd_subpagetest:   write size: 0x200
mtd_subpagetest:   written: 0x0
mtd_subpagetest: error -5 occurred
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
insmod: cannot insert 'mtd_subpagetest.ko': Input/output error
[root@or:/opt/configs]# insmod mtd_torturetest.ko

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
mtd_torturetest: Warning: this program is trying to wear out your
flash, stop it if this is not wanted.
mtd_torturetest: MTD device: 0
mtd_torturetest: torture 32 eraseblocks (8-39) of mtd0
mtd_torturetest: write verify enabled
mtd_torturetest: block_isbad() returned -22 for EB 8
mtd_torturetest: finished after 0 erase cycles
mtd_torturetest: error -22 occurred during torturing
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
insmod: cannot insert 'mtd_torturetest.ko': invalid parameters
