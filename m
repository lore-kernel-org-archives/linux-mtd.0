Received: from mail-px0-f195.google.com ([209.85.216.195])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NDjdg-0002Tv-8C
	for linux-mtd@lists.infradead.org; Thu, 26 Nov 2009 19:04:28 +0000
Received: by pxi33 with SMTP id 33so644444pxi.28
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Nov 2009 11:04:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <d970ff420911260732m400e7605u63fe597aa82d8bcc@mail.gmail.com>
References: <d970ff420911250403w6a81308v89f3f0faf47a9ee0@mail.gmail.com>
	<1259220777.29118.56.camel@localhost>
	<d970ff420911260732m400e7605u63fe597aa82d8bcc@mail.gmail.com>
Date: Thu, 26 Nov 2009 17:04:22 -0200
Message-ID: <d970ff420911261104y2b7360bdn6fd877d2bff928b9@mail.gmail.com>
Subject: Re: UBIFS: problems writing to the partition
From: Alemao <xcarandiru@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 26, 2009 at 1:32 PM, Alemao <xcarandiru@gmail.com> wrote:
> On Thu, Nov 26, 2009 at 5:32 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> On Wed, 2009-11-25 at 10:03 -0200, Alemao wrote:
>>> Hi all,
>>>
>>> I have de following scenario:
>>>
>>> - Freescale MPC8541
>>> - U-Boot-2009.03
>>> - Linux-2.6.26
>>> - NAND flash 512Mbit (64MB), page: 512 bytes, erase block: 16KB
>>>
>>>
>>> And Im creating UBI image with this parameters:
>>>
>>> mkfs.ubifs -r rootfs/ -m 512 -c 3897 -e 15872 -o ubi.temp
>>> ubinize -o rootfs.ubifs -m 512 -p 16384 -s 256 ubinize.cfg
>>
>> Please, start with validating your NAND flash/driver using the mtd
>> tests:
>> http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests
>
>
> Im using JFFS2 with no problem. My NAND driver is OK.
>

I used mtd tests, here the results:

# insmod oobtest.ko dev=3
oobtest: oobtest finished with 0

# insmod pagetest.ko dev=3
pagetest: pagetest finished with 0 errors

# insmod scantest.ko dev=3
scantest: Size=67108864  EB size=16384  Write size=512  EB count=4096
Pages per EB=32  Page size=512  Oob size=16
scantest: scanning for bad blocks
scantest: found 0 bad
scantest: Testing page read
scantest: scantest finished

# insmod speedtest.ko dev=3
speedtest: Testing eraseblock write speed
eraseblock write speed is 2039 KiB/s
speedtest: Testing eraseblock read speed
eraseblock read speed is 3102 KiB/s
speedtest: Testing page write speed
page write speed is 2025 KiB/s
speedtest: Testing page read speed
page read speed is 3087 KiB/s
speedtest: Testing 2 page write speed
2 page write speed is 2033 KiB/s
speedtest: Testing 2 page read speed
2 page read speed is 3094 KiB/s
speedtest: Testing erase speed
erase speed is 9073 KiB/s

# insmod stresstest.ko dev=3 count=10000
stresstest: Doing operations
stresstest: 0 operations
stresstest: 4096 operations
stresstest: 8192 operations
stresstest: 10000 operations
stresstest: stresstest finished

# insmod subpagetest.ko dev=3
subpagetest: dev = 3
sub-page size is: 256
subpagetest: subpagetest finished with 0 errors


Seems there is no problem with my NAND driver. Im using Freescale
Local Bus UPM driver.

Any other hints or anything else should I check?

Cheers,

--
Alemao
