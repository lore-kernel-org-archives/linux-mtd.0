Received: from mail1.cray.com ([136.162.0.111])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B7GR4-00047v-T4
	for linux-mtd@lists.infradead.org; Sat, 27 Mar 2004 16:13:27 +0000
Received: from relaya.us.cray.com (relaya.us.cray.com [192.168.252.144])
	i2RGDKFj005092	for <linux-mtd@lists.infradead.org>;
	Sat, 27 Mar 2004 10:13:20 -0600 (CST)
Received: from orchid.us.cray.com (orchid.us.cray.com [172.30.27.91])
	i2RGDIIQ010417	for <linux-mtd@lists.infradead.org>;
	Sat, 27 Mar 2004 10:13:18 -0600 (CST)
Received: from cray.com (troll [192.168.250.5])i2RGDH7t4553420
	for <linux-mtd@lists.infradead.org>;
	Sat, 27 Mar 2004 10:13:17 -0600 (CST)
Message-ID: <4065A81B.6020607@cray.com>
Date: Sat, 27 Mar 2004 10:13:15 -0600
From: David Updegraff <dave@cray.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <406328A2.3060905@cray.com>
	<200403270907.07298.tglx@linutronix.de>
	<1080383077.17352.5.camel@imladris.demon.co.uk>
	<200403271210.30061.tglx@linutronix.de>
	<1080386714.17352.52.camel@imladris.demon.co.uk>
In-Reply-To: <1080386714.17352.52.camel@imladris.demon.co.uk>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: nand oob layout assumptions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In all this discussion, the need for anyone outside the driver to know
hardware positions of ECC and badblock markers still elludes me.  Yes, 
various FS need to scribble oob info of their own in a particular 
format, and in a way that won't scribble over ecc/badblock, but is there 
anything more than that?

So, again, what if the 'oobsize' and 'oob_buf' (or a renamed relative 
thereof) were interpreted to mean "region available in OOB for misc. 
file system housekeeping, that will not stomp on private ECC or badblock 
areas and will not be interpreted by nand driver".  And let the driver 
put it wherever it wants/needs to in OOB.  Driver gets to ignorant of FS 
details, FS gets to be ignorant of chip-HW-dependent ECC and badblock 
layout.

>>What else would you need ? 
> 
> 
> Nothing more, but it does live where it is in the hardware driver.
> 
> 
>>I'm not happy to build in the bad block bitmap stuff as a general solution. 
>>Next will be translation tables, bad block remapping and all kind of crap, 
>>which is not neccecary to run a NAND FLASH aware filesystem. 
> 
> 
> We don't need to build it in as a general solution -- the DiskOnChip
> code will do it itself. All we need to do is keep the API sufficiently
> versatile that the FS doesn't need to know about the peculiarities of
> the DiskOnChip -- it just gets told which bytes of the OOB area it can
> use, and does so.
> 
> The DiskOnChip uses the first 6 bytes of the OOB area for hardware ECC,
> and bad block information is elsewhere on the medium.
> 
> 
>>The NAND specs have defined to have the bad block markers in the OOB area, 
>>which is quite clever, as it does not restrict the usage of any byte in the 
>>main area.
> 
> 
> No, the NAND specs have defined the bad block markers to be in the OOB
> area when the device is shipped. What you do with it after that is up to
> you. And in the case of the DiskOnChip that means the bad block
> information is moved. We _really_ want to honour that and keep it within
> the hardware driver. I don't want any possibility of erasing bad blocks,
> and I'm not overly happy with thinking non-bad blocks are bad just
> because the device has already been used with NFTL and has ECC data in
> byte 5.
> 
> 
>>Nand.c needs bad block handling in the sense of preventing erase of bad 
>>blocks. Maybe the prevention of reading / writing bad blocks too. And the 
>>possibility to have a bad block detection function, which covers specific 
>>cases like DOC.
>>
>>But this does not change the interface. 
> 
> 
> Except that in the file system we need to call the device's
> ->is_bad_block() function rather than poking at the OOB area.
>  
> 
>>ECC positions are a totaly different thing. If we want to have a fixed scheme 
>>for storing ECC bytes, which is not neccecary even with hardware ECC, as the 
>>hardware ECC only does the ECC calculation and no placing of ECC data into 
>>OOB, 
> 
> 
> On the DiskOnChip I think it has to be the first six bytes of the OOB.
> You read <data + ECC> and check a _bit_ to see if there was an error.
> You don't read the ECC syndrome and compare with what you separately
> read from the medium.
> 
> 
>>then we have to use _ONE_ final ECC placement scheme for all filesystems 
>>and therefor we can only use the SmartmediaCard layout, as doing not so would 
>>prevent the development of a SmartMedia FAT fs driver. This would break YAFFS 
>>support complete. JFFS2 uses the SmartMedia layout anyway.
> 
> 
> We don't need a fixed ECC scheme. But we do need to tell the file system
> what we support. Those should include the SmartMedia software ECC, and
> may include the DiskOnChip hardware ECC too. 
> 
> JFFS2 uses the DiskOnChip ECC on DiskOnChip already, doesn't it?
> 
> 
>>>Other than noticing them and avoiding them, there really isn't much
>>>handling to be done.
>>
>>True, but it still is a job of the filesystem and therefor it must have access 
>>to this information.
> 
> 
> Yes. It _absolutely_ needs access to the information 'is this a bad
> block?'. What it doesn't need is stuff like "what byte in the OOB area
> would tell us if this was a bad block".
> 
