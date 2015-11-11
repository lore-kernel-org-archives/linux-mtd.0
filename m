Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwbKT-0003X1-5g
 for linux-mtd@lists.infradead.org; Wed, 11 Nov 2015 19:45:14 +0000
Received: by pasz6 with SMTP id z6so40826333pas.2
 for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2015 11:44:52 -0800 (PST)
Date: Wed, 11 Nov 2015 11:44:49 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Saurabh Sengar <saurabh.truth@gmail.com>
Cc: joe@perches.com, andy.shevchenko@gmail.com, joern@lazybastard.org,
 dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: phram: error handling
Message-ID: <20151111194449.GH12143@google.com>
References: <20151110194157.GS12143@google.com>
 <1447230238-3693-1-git-send-email-saurabh.truth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1447230238-3693-1-git-send-email-saurabh.truth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Saurabh,

On Wed, Nov 11, 2015 at 01:53:58PM +0530, Saurabh Sengar wrote:
> Brian Norris wrote:
> > Well, today you're in luck! You're touching a driver that requires no
> > special hardware, so you should be able to test it.
> 
> > I think you can try using the mem= kernel parameter (see
> > Documentation/kernel-parameters.txt) to restrict your system memory, and
> > then try using that unreachable portions of memory for phram. You can
> > try this driver as either a module or built-in. For the former, you can
> > specify the parameters during modprobe time, or later by writing to
> > /sys/module/phram/parameters/phram. For the latter, you can specify on
> > the kernel command line or in /sys/module/phram/parameters/phram.
> 
> > Let me know if you have any more questions about testing your patch.
> 
> 
> Hi Brian,
> 
> As you have suggested I have restricted my laptop's memory to 1GB and tried to access unreachable portion of memory(2GB).
> It seems to be successfully registered(this is OK right ?).

Seems OK.

> I have also tested below error scenarios; all exiting gracefully
>   - parameter too long
>   - too many arguments
>   - not enough arguments
>   - invalid start adddress
>   - invalid device length

Nice! Glad to see you've tested quite a few good scenarios.

> This is my first interaction with phram device so I request you to verify my testing.
> Below are the commands and output I did for this testing.
> 
> -----------------------------------------------------
>   <restricting memory of my machine to 1 GB>
> saurabh@saurabh:~/little/Task02/linux$ cat /proc/meminfo | grep Mem
> MemTotal:        1016588 kB
> MemFree:          126016 kB
> MemAvailable:     295508 kB
> saurabh@saurabh:~/little/Task02/linux$ cat /proc/cmdline 
> BOOT_IMAGE=/boot/vmlinuz-4.3.0-10333-gdfe4330-dirty mem=1024M root=UUID=2b66d4b2-ac21-4554-bf3b-64bc973e1dad ro quiet splash vt.handoff=7
> 
>   <accessing unreachable portions of memory>
> saurabh@saurabh:~/little/Task02/linux$ sudo insmod drivers/mtd/devices/phram.ko phram=ram,2048Mi,1ki
> saurabh@saurabh:~/little/Task02/linux$ sudo dmesg -c
> [  634.748495] phram: ram device: 0x400 at 0x80000000
> 
>   <parameter too long>
> saurabh@saurabh:~/little/Task02/linux$ sudo insmod drivers/mtd/devices/phram.ko phram=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz,256Mi,1Mi
> insmod: ERROR: could not insert module drivers/mtd/devices/phram.ko: Invalid parameters
> saurabh@saurabh:~/little/Task02/linux$ sudo dmesg -c
> [ 1469.763787] phram: parameter too long
> [ 1469.763797] phram: `abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz,256Mi,1Mi' invalid for parameter `phram'
> 
> 
>   <too many arguments>
> saurabh@saurabh:~/little/Task02/linux$ sudo insmod drivers/mtd/devices/phram.ko phram=swap,256Mi,1Mi,extra_parameter
> insmod: ERROR: could not insert module drivers/mtd/devices/phram.ko: Invalid parameters
> saurabh@saurabh:~/little/Task02/linux$ sudo dmesg -c
> [ 1650.081694] phram: too many arguments
> [ 1650.081703] phram: `swap,256Mi,1Mi,extra_parameter' invalid for parameter `phram'
> 
>   <not enough arguments>
> saurabh@saurabh:~/little/Task02/linux$ sudo insmod drivers/mtd/devices/phram.ko phram=swap,256Mi
> insmod: ERROR: could not insert module drivers/mtd/devices/phram.ko: Invalid parameters
> saurabh@saurabh:~/little/Task02/linux$ sudo dmesg -c
> [ 1707.437130] phram: not enough arguments
> [ 1707.437138] phram: `swap,256Mi' invalid for parameter `phram'
> 
> 
>   <invalid start address>
> saurabh@saurabh:~/little/Task02/linux$ sudo insmod drivers/mtd/devices/phram.ko phram=swap,256xyz,1Mi
> insmod: ERROR: could not insert module drivers/mtd/devices/phram.ko: Invalid parameters
> saurabh@saurabh:~/little/Task02/linux$ sudo dmesg -c
> [ 1783.014351] phram: invalid start address
> [ 1783.014359] phram: `swap,256xyz,1Mi' invalid for parameter `phram'
> 
>   <invalid device length>
> saurabh@saurabh:~/little/Task02/linux$ sudo insmod drivers/mtd/devices/phram.ko phram=swap,256Mi,1xyz
> insmod: ERROR: could not insert module drivers/mtd/devices/phram.ko: Invalid parameters
> saurabh@saurabh:~/little/Task02/linux$ sudo dmesg -c
> [ 1831.746108] phram: invalid device length
> [ 1831.746117] phram: `swap,256Mi,1xyz' invalid for parameter `phram'
> -------------------------------------------

This all looks very good. For the successful cases, it might be nice to
make sure you can still read and write the "device". (Try dd on
/dev/mtd0, or see mtd-utils for tools like flash_erase.) But you're not
touching the actual I/O behavior, so this isn't so important.

More importantly, it's good to test these cases too:

 * phram is built-in (not a module), with and without a phram= line on
   the commandline
 * writing to /sys/module/phram/parameters/phram (for both the module
   and built-in cases) 

Thanks,
Brian
