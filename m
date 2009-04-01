Received: from mail-bw0-f159.google.com ([209.85.218.159])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lov0y-00012m-9I
	for linux-mtd@lists.infradead.org; Wed, 01 Apr 2009 07:37:42 +0000
Received: by bwz3 with SMTP id 3so2934280bwz.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Apr 2009 00:37:32 -0700 (PDT)
Message-ID: <49D31937.6080403@gmail.com>
Date: Wed, 01 Apr 2009 10:35:19 +0300
From: Darius Augulis <augulis.darius@gmail.com>
MIME-Version: 1.0
To: massimo cirillo <maxcir@gmail.com>
Subject: Re: [PATCH] Fixup for Numonyx M29W128 chips
References: <62cbdcd90903260402q61725160v7f1538762fbd76bc@mail.gmail.com>	<49CB7AEA.2000009@gmail.com>
	<62cbdcd90903300556hb66dca5u94e1d52b67c85240@mail.gmail.com>
In-Reply-To: <62cbdcd90903300556hb66dca5u94e1d52b67c85240@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

massimo cirillo wrote:
> Hi ,
> We performed a complete validation test session on this device,
> using jffs2 in the 2.6.26.1 release kernel, without any failures.
> Could you specify the test case and the related failure?
> What kernel version did you use? Did you apply any patch?
> Thanks,
> Massimo

Hi,

I use newest 2.6.29 kernel. The same was with 2.6.28.
My flash device is M29W128GL.
This is the sequence how writing to flash crashes:

1. Mount new and fresh (empty) jffs2 partition.
2. Create emtpy file ("touch test")
3. Echo short string to this file ("echo test > test")
4. Unmount partition (optional)
5. Reboot system
6. Mount the same jffs2 partition
7. Create another file ("touch test2")
8. Try to write something to this file ("echo test > test2")
9. Get this error: [42949481.440000] Node totlen on flash (0xffffffff) != totlen from node ref (0x00000044)
10. Unmount and reboot
11. Get jffs2 errors and broken file system:

starting pid 37, tty '': '/bin/mount -t jffs2 /dev/mtdblock3 /tmp/cfg'
[42949376.530000] Empty flash at 0x0000415c ends at 0x00004180
[42949376.550000] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00004180: 0xe3db instead
[42949376.580000] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00004184: 0xe3db instead
[42949376.600000] jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000419c: 0x2452 instead


There absolutely no problem if write buffer is disabled.
So I don't guess this is hardware error. May it be memory chip defect?

Darius.





> 
> 2009/3/26 Darius Augulis <augulis.darius@gmail.com>:
>> Hi,
>>
>> I'm getting jffs2 errors after write to flash. I don't have the output log
>> now, but the idea is that after write to flash, jffs2 does not find magic
>> numbers anymore. File system is broken.
>> It's completely resolved when write buffers are not used. I could make patch
>> which disables write buffer only for M29W128 chips. Anyway it's not working,
>> one who needs more performace, is welcome to fix this in better way...
>>
>> Darius.
>>
>> massimo cirillo wrote:
>>> Hi Darius,
>>> what kind of failure did you experiment with M29W?
>>>
>>> In my opinion, complete removal of the buffer program feature is not a
>>> good solution,
>>> because you are taking away an important feature of the device, that
>>> results in
>>> a very high performance decrease.
>>>
>>> Moreover, if you make the fix applicable to all devices with 0x227E device
>>> ID,
>>> you are removing the same feature from other devices too, such as M29EW
>>> that has a much bigger buffer thus resulting in a dramatic performance
>>> decrease
>>> for this device.
>>>
>>>
>>
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
