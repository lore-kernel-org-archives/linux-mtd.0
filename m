Received: from ug-out-1314.google.com ([66.249.92.171])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HfKib-0001mh-JE
	for linux-mtd@lists.infradead.org; Sat, 21 Apr 2007 14:53:58 -0400
Received: by ug-out-1314.google.com with SMTP id m2so929027uge
	for <linux-mtd@lists.infradead.org>;
	Sat, 21 Apr 2007 11:53:55 -0700 (PDT)
Message-ID: <625fc13d0704211153w4d9abb2q40aaa05a2e1a536c@mail.gmail.com>
Date: Sat, 21 Apr 2007 13:53:54 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: Wilson <callwilson@gmail.com>
Subject: Re: MTD in a 44B0X borad
In-Reply-To: <002301c783d4$92653480$800101df@WILSONSAMSUNG>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <002301c783d4$92653480$800101df@WILSONSAMSUNG>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/21/07, Wilson <callwilson@gmail.com> wrote:
> Hi all,
> Please give me a hand.. I need to get it done ASAP... Thanks.
>
> I would like to enable MTD in S3C44B0X with NOR flash SST 39VF160.
>
> When I erase mtd1, I got the following error messages:
> /> eraseall /dev/mtd1
> MTD_open
> MTD_ioctl
> Erasing 4 KibyteMTD_ioctl
>  @ 0 --  0 % compInternal error: Oops: f9f4e
> CPU: 0
> pc : [<00028f9c>]    lr : [<0c7e0ac8>]    Not tainted
> sp : 0c7ffc70  ip : 0c7ffbd8  fp : 00000000
> r10: 0c7f0e84  r9 : 00000001  r8 : 0c7f0adc
> r7 : 00000000  r6 : 00000023  r5 : 00000002  r4 : 0000096c
> r3 : 000000ff  r2 : 00000014  r1 : 0c7ffc80  r0 : 00000023
> Flags: nZcv  IRQs off  FIQs on  Mode SVC_32  Segment user
> Control: 0
> Process sh (pid: 30, stackpage=0c3af000)
> Stack:
> 0c3affe0:
>
> 1) Do I need to modify the lock address 5555/2AAA in jedec_probe.c?
> 2) Do I need to modify the interrupt table(seems like an interrupt error)?
>
> P.S The boot up message of uClinux: (It looks good to me)
> s3c4510b flash device: 200000 at 1000000
> Found: SST 39LF160/VF160
> number of JEDEC chips: 1
> Creating 2 MTD partitions on "SST39LF160 flash":
> 0x00000000-0x00160000 : "Reserved for bootloader and kernel (1408kB)"
> mtd: Giving out device 0 to Reserved for bootloader and kernel (1408kB)
> 0x00170000-0x001b0000 : "user partition (256K)"
> mtd: Giving out device 1 to user partition (256K)
> init_mtdchar: allocated major number 90.
> init_mtdblock: allocated major number 30.
>
> Any other things I missed here?

Which kernel and mtd-utils versions are these?

josh
