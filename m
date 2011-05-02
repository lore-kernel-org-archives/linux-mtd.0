Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QGpFH-0004dQ-Gi
	for linux-mtd@lists.infradead.org; Mon, 02 May 2011 09:16:48 +0000
Received: by wyb28 with SMTP id 28so5148213wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 02 May 2011 02:16:45 -0700 (PDT)
Message-ID: <4DBE767A.5060703@gmail.com>
Date: Mon, 02 May 2011 11:16:42 +0200
From: angelo <angelo70@gmail.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: help request, jffs2 fs files get lost
References: <4DBD4572.5040508@gmail.com>
	<Pine.LNX.4.64.1105020853440.15966@lnxricardw.se.axis.com>
	<4DBE6BCD.3050400@gmail.com>
	<Pine.LNX.4.64.1105021057420.15966@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.1105021057420.15966@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/05/2011 10:58, Ricard Wanderlof wrote:
>
> On Mon, 2 May 2011, angelo wrote:
>
>> If this is in fact what you're doing, you're overwriting your 
>> jffs2.img file with the all-ff's contents of the newly erased 
>> /dev/mtd2. Swap the two arguments instead.
>>
>> sorry, was just a bad had-written text,
>> i generally do "cp jffs2.img /dev/mtd2", and after mounting mtdblock2 
>> i see correctly the root tree.
>>
>> I did some other tests:
>> if i mount the new created jffs2 and unmount it, nothing is lost.
>> If i mount it, open a file, append some text, close it and unmount, 
>> then at the next mount everything is disapperaed (checking mtd2, all 
>> is set to 0xff).
>>
>> Saving modified files i notice a warning:
>> Writing files is also notice some MTD debug trace, maybe an error:
>> Node totlen on flash (0xffffffff) != totlen from node ref (0x00000074)
>
> Out of curiosity, what exactly is the type of flash you are using?
>
> /Ricard

Hi Ricard,

thanks again for help

the flash chip is an SST 39VF2301B, word programmable, tot 4MB, 4KB 
sector size, 64K block size, it is very similar to an AMD 16bit data bus 
width flash.

It seems to be correctly detected from jedec probe, but through CFI 
queries probably

...
physmap platform flash device: 00400000 at ffc00000
physmap-flash: Found 1 x16 devices at 0x0 in 16-bit bank. Manufacturer 
ID 0x0000bf Chip ID 0x00235d
number of CFI chips: 1
...

/proc # cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00010000 00001000 "Colilo (64K)"
mtd1: 002f0000 00001000 "Kernel+ROMfs (3008K)"
mtd2: 00100000 00001000 "JFFS2 (1024K)"
mtd3: 0009d000 00001000 "ROMfs"

This is a suspected sequence of MTD commands i find in dmesg:

...
MTD_ioctl
MTD_ioctl
MTD_ioctl
MTD_ioctl
MTD_ioctl
MTD_ioctl
MTD_close
MTD_open
MTD_write
MTD_close
Node totlen on flash (0xffffffff) != totlen from node ref (0x00000074)
MTD_open <-- jffs2 fs disapperaed from here
MTD_read
MTD_read
...

many thanks,
angelo
