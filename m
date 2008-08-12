Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KSpPZ-0006zT-EJ
	for linux-mtd@lists.infradead.org; Tue, 12 Aug 2008 08:39:26 +0000
Message-ID: <48A14CAA.6030808@nokia.com>
Date: Tue, 12 Aug 2008 11:41:14 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "Bruce_Leonard@selinc.com" <Bruce_Leonard@selinc.com>
Subject: Re: Problem mounting a UBIFS volume
References: <OF0ABC5A6E.C65055D0-ON882574A3.001ABDC5-882574A3.001B51DE@selinc.com>
In-Reply-To: <OF0ABC5A6E.C65055D0-ON882574A3.001ABDC5-882574A3.001B51DE@selinc.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bruce_Leonard@selinc.com wrote:
> Adrian,
> 
> Sorry it took me so long to respond, I had a family emergency.
> 
> Adrian Hunter <ext-adrian.hunter@nokia.com> wrote on 07/28/2008 02:16:49 
> AM:
> 
>> Adrian Hunter wrote:
>>> Bruce_Leonard@selinc.com wrote:
>>>> Artem,
>>>>
>>>> Sorry for the delay in replying, I was on holiday for a couple of 
> weeks 
>>>> and it's taken me a while to get my brain wrapped back around what I 
> was 
>>>> working on when I left :).
>>>>
>>>> Artem Bityutskiy <dedekind@infradead.org> wrote on 07/04/2008 
> 06:02:29 AM:
>>>>> On Wed, 2008-07-02 at 22:18 -0700, Bruce_Leonard@selinc.com wrote:
>>>>>> UBIFS error (pid 842): check_lpt_crc:invalid crc in LPT node: crc 
> 2bbb 
>>>>>> calc a5a5
>>>>>> UBIFS error (pid 842): ubifs_read_nnode: error -22 reading nnode at 
> 
>>>> 8:6150
>>>>>> mount: wrong fs type, bad option, bad superblock on ubi0:bob,
>>>>>>        missing codepage or other error
>>>>>>        In some cases useful info is found in syslog - try
>>>>>>        dmesg | tail  or so
>>>>> AFAIU, you still use a small flash and small image. So the only 
> change
>>>>> was your MTD change. Are you sure it is not the MTD change which is 
> to
>>>>> blame? Can you reproduce this error without your MTD change?
>>>>>
>>>> Yes I can and here's what I've found.  I pulled the latest vanilla 
> kernel 
>>>> from Linus' tree (congratulations on getting UBIFS in BTW, very 
> cool), 
>>>> pulled the latest mkfs.ubifs, and did an entirely new clone of 
> mtd-utils 
>>>> (I wanted to get rid of my modifications).  So there are NONE of my 
> MTD 
>>>> changes in any of the code I'm currently using.  I also reset my 
> driver to 
>>>> only recognize 2GiB of NAND.  Before I left I was starting to get 
>>>> suspicious of mkfs.ubifs, so I ran the following experiment this 
> morning. 
>>>> I used mkfs.ubifs to create two different images of the same 
> filesystem 
>>>> (one for up to 2GiB devices and one for up to 8GiB devices) as 
> follows:
>>>> $ mkfs.ubifs -r x103/ -m 2048 -e 129024 -c 16384 -o x103.img
>>>> $ mkfs.ubifs -r x103/ -m 2048 -e 129024 -c 65536 -o x103_large.img
>>>>
>>>> If I understand things right (which usually isn't the case :-\), 
> these 
>>>> should be more or less the same, because the -c option is just 
> specifying 
>>>> a MAXIMUM volume size the image can be put onto.  An ls -l command 
> gives 
>>>> the following:
>>>>
>>>> -rw-r--r--  1 root root  29159424 Jul 23 13:31 x103.img
>>>> -rw-r--r--  1 root root  30449664 Jul 23 14:08 x103_large.img
>>>>
>>>> So they match pretty close in size.  I can burn both images to my 
> NAND 
>>>> without errors by:
>>>>
>>>> $ ubiupdatevol /dev/ubi0_0 x103*.img
>>>>
>>>> When I try to mount the filesystem that comes from x103.img (the one 
> for 
>>>> the 'smaller' NAND flash) it mounts just fine, I can cd to it, create 
> 
>>>> directories/files, etc.  However, when I try to mount the filesystem 
> from 
>>>> x103_large.img, it fails with the following errors:
>>>>
>>>> UBIFS error (pid 863): check_lpt_crc: invalid crc in LPT node: crc 
> f486 
>>>> calc e0b
>>>> UBIFS error (pid 863): ubifs_read_nnode: error -22 reading nnode at 
> 8:1356
>>>> mount: wrong fs type, bad option, bad superblock on ubi0:bob,
>>>>        missing codepage or other error
>>>>        In some cases useful info is found in syslog - try
>>>>        dmesg | tail  or so
>>>>
>>>> So, here's a couple of questions?  Does mkfs.ubifs and UBIFS 
> calculate the 
>>>> CRC identically or could there be a difference that's causing 
> theproblem? 
>>>>  Does ubiupdatevol touch the CRC and that's what's causing the 
> problem?  A 
>>>> complicating factor, I'm running on an MPC8349E, which is big endian 
> and I 
>>>> know we've tripped across an endian issue in the past.  I've tried 
>>>> eliminating endian issues by compiling and running all tools native 
> on the 
>>>> 8347, but could that be a factor?
>>>>
>>>> I'm going to start by digging into mkfs.ubifs on the assumption that 
> the 
>>>> large -c parameter is causing it to some how miscalculate the CRC, 
> but any 
>>>> pointers of where else the problem could be are greatly appreciated.
>>> Almost certainly mkfs.ubifs has screwed up the LPT.  That is because 
> the
>>> LPT is a tree that is sized according to the maximum size that the
>> file system
>>> can grow to i.e. the size given by the -c option
>>>
>>> I will look at this.
>> I tried this with a 2GiB nandsim and did not get any problems.
>>
>> Are you able to make available an image that I can test?  Obviously if 
> you are
>> able to make a small image that has the problem it would be easier to 
> handle.
>>
> 
> I ran mkfs.ubifs on a directory containing just the MTD utils to create 
> the attached image.  I used the following parameters:
> 
> -m 2048 -e 129024 -c 65536
> 
> I get the same failure (though with different CRCs) as in my original post 
> when I try to mount the filesystem.  Just to emphasize it, I'm doing all 
> of this on a powerpc system.  Please let me know what other info I can 
> provide.  I'll try to be more responsive (hopefully there will be no more 
> emergencies :)  ).
> 
> Bruce
> 

I found an endian bug in mkfs.ubifs.  A patch has been added to mkfs.ubifs git tree.

Please try it.
