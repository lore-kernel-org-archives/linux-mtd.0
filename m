Received: from mail024.syd.optusnet.com.au ([210.49.20.148])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17LH4E-0000ao-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2002 06:34:43 +0100
Received: from max.ctam.local (198.142.103.111.optusnet.com.au [198.142.103.111] (may be forged))
	by mail024.syd.optusnet.com.au (8.11.1/8.11.1) with ESMTP id g5L5Yde27540
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2002 15:34:39 +1000
Received: from k9.ctam.local ([192.168.0.55] helo=ctam.com.au)
	by max.ctam.local with esmtp (Exim 3.12 #1 (Debian))
	id 17LH45-0007bd-00
	for <linux-mtd@lists.infradead.org>; Fri, 21 Jun 2002 15:34:33 +1000
Message-ID: <3D12BAE1.3050400@ctam.com.au>
Date: Fri, 21 Jun 2002 15:34:25 +1000
From: Brendan J Simon <brendan.simon@ctam.com.au>
Reply-To: brendan.simon@ctam.com.au
MIME-Version: 1.0
To: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: doc2000 nftl[abcd] devices
References: <3D127644.3050004@ctam.com.au>  <3D115F9B.9030203@ctam.com.au> <12942.1024563800@redhat.com> <10394.1024620838@redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


David Woodhouse wrote:

>brendan.simon@ctam.com.au said:
>
>>I'm getting ENODEV.  It seems that the NFTLs[] array doesn't have the
>>appropriate information.  How is this setup ?  I'm using modules so is
>> it initialised so I assume it's initialised when I do an "insmod
>>nftl". 
>> Which routine scans the DOC2000 for NFTL devices and initialises the
>>NFTLs[] array. 
>>
>
>NFTL_setup() from nftlcore.c and NFTL_mount() from nftlmount.c.
>
>Looking at them more closely, I see that I was mistaken -- we _don't_ 
>continue the scan after finding the first NFTL on the device. Patching 
>NFTL_mount() and find_boot_record() to take a 'start' argument for where to 
>start scanning is simple enough -- you just need to fix NFTL_setup() to 
>loop till NFTL_mount() stops working.
>
I expect it's not as easy as you suggest (at least for me as all this 
MTD, NFTL stuff is doing my head in).
In NFTL_mount, it uses the number of blocks supplied to it as 
nftl->nb_blocks.  This is set in NFTP_setup() just before NFTL_mount is 
called.  I think this is currently set to the entire mtd device (ie. the 
DOC).  I'll put some more printks to find out exactly what it is doing :)
I guess the alternative to is to scan from some start address till the 
next media headers are found, then the size is known and it can be 
passed backed to NFTL_setup (directly or indirectly).

Does this sound right ?

What about holes in the DOC.  ie.  What if I have nftl_formatted between 
0x00000000-0x01FFFFFF & 0x04000000-0x7FFFFFFF.  This has a hole between 
0x02000000-0x03FFFFFF.  Does NFTL_mount cater for this ?  Should it ? 
 If so, does this mean that the Media Header needs to be searched to 
find the start of the partition and then the next Media Header to find 
the end of the partition.  This seems wrong because the first partition 
would be recognised as 4MB instead of 2MB.  There must be some info in 
the media headers that give the size of the partition.  Any clues ? 
 I'll do some more research in the mean time.

Thanks,
Brendan Simon.
