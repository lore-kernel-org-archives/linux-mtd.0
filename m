Received: from ppsw-5.csi.cam.ac.uk ([131.111.8.135])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKvXS-00064m-8y
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2009 14:07:21 +0000
Message-ID: <49660890.5020402@cam.ac.uk>
Date: Thu, 08 Jan 2009 14:07:12 +0000
From: Jonathan Cameron <jic23@cam.ac.uk>
MIME-Version: 1.0
To: Jonathan Cameron <jic23@cam.ac.uk>
Subject: Re: jffs2, 2.6.28-git8 : Weird problem.
References: <4963BAD4.50803@cam.ac.uk>	<20090107110404.1f4cc284@hskinnemoen-d830>
	<4964ED5F.10408@cam.ac.uk> <4964FF55.6080800@cam.ac.uk>
In-Reply-To: <4964FF55.6080800@cam.ac.uk>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: David Howells <dhowells@redhat.com>, linux-mtd@lists.infradead.org,
	Haavard Skinnemoen <haavard.skinnemoen@atmel.com>,
	James Morris <jmorris@namei.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jonathan Cameron wrote:
> Jonathan Cameron wrote:
>>
>>> Jonathan Cameron wrote:
>>>> Having applied a few board specific patches on top of
>>>> Linus' tree (around 2.6.28-git8)
>>>> run into the following.
>>>>
>>>> Anyone have an ideas or seeing anything similar?
>>> Yes, I think the same thing just happened on my avr32 board
>>> (ATSTK1006)...see below.
>>>
>>>> Works fine on 2.6.28 so git bisection underway, but
>>>> will take a while given speed of flashing this device
>>>> (intelmote 2)
>>> Please let me know the result, or if you need any help.
>>>
>>> Haavard
>>>
>>> Unable to handle kernel NULL pointer dereference at virtual address 00000150
>>> ptbr = 93a9b000 pgd = 93b45000
>>> Oops: Kernel access of bad area, sig: 11 [#1]
>>> FRAME_POINTER chip: 0x01f:0x1e82 rev 2
>>> Modules linked in:
>>> PC is at set_dumpable+0x16/0x5e
>>> LR is at commit_creds+0x86/0x10c
>>> pc : [<9005bfc6>]    lr : [<9002e4fe>]    Not tainted
>>> sp : 93bbff00  r12: 00000000  r11: 00000000
>>> r10: ffffffff  r9 : 00000000  r8 : 00000150
>>> r7 : 93bbff00  r6 : 939b9420  r5 : 901eca58  r4 : 00000000
>>> r3 : 939e02e0  r2 : 90021494  r1 : 900a40c4  r0 : 93b52400
>>> Flags: qvnzC
>>> Mode bits: hjmde....G
>>> CPU Mode: Supervisor
>>> Process: jffs2_gcd_mtd1 [281] (task: 939e02e0 thread: 93bbe000)
>>> Stack: (0x93bbff00 to 0x93bc0000)
>>> ff00: 9002e4fe 93bbff14 939b9420 901eca58 00000000 90021b00 93bbff44 93bbe000 
>>> ff20: 901ea8b0 00000000 00000000 90021494 900a40c4 93b52400 ffffffff ffffffff 
>>> ff40: 93bbff58 900a40da 93bbffdc 00000000 93b52400 00000000 00000001 038e300c 
>>> ff60: b3ec22cd 11c4148c b11833cc 338d19ec 77ca338c 734831ec 23dc63cc 33ec334c 
>>> ff80: 33cc33cd 338c30cc 37cc338c b3fcb68d 9001be6c 93bbffa4 90204640 939e05c0 
>>> ffa0: 93b5248c 90014166 93badcfc 90204640 939e05c0 93b5248c 00400000 900180e0 
>>> ffc0: 900180e0 93bc0000 00000000 00000000 00000000 00000000 00000000 90021494 
>>> ffe0: 00000000 00000000 00000000 00000000 00000000 90021494 900a40c4 93b52400 
>>> Call trace:
>>>  [<9002e4fe>] commit_creds+0x86/0x10c
>>>  [<90021b00>] daemonize+0x14c/0x16c
>>>  [<900a40da>] jffs2_garbage_collect_thread+0x16/0x108
>>>  [<90021494>] do_exit+0x0/0x488
>>>
>> Hi All, 
>>
>> Results of git bisection are in.  The patch highlighted as
>> causing the problem is:
>>
>> d84f4f992cbd76e8f39c488cf0c5d123843923b1 is first bad commit                              
>> commit d84f4f992cbd76e8f39c488cf0c5d123843923b1                                           
>> Author: David Howells <dhowells@redhat.com>                                               
>> Date:   Fri Nov 14 10:39:23 2008 +1100                                                    
>>
>>     CRED: Inaugurate COW credentials
>>                                     
>> ( lots of info ).
>>
>> So now for the remaining question of why?
>>
> Got to run in a mo, so thought I'd post my progress on 
> working out what is happening.
> 
> For some reason, when set_dumpable is run in commit_creds
> (cred.c) task->mm is null.  Don't know my way around
> this bit of the kernel, but guessing that isn't good!
> 
Not sure I'm making much progress on this problem.
My guess is that the set_dumpable shouldn't actually
be running.  The reason it is is that the gc task
appears to have the CAP_SETPCAP capability and the 
init task does not.  Any hints as to what should be happening
here would be appreciated.

Jonathan
