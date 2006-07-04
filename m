Received: from herkules.vianova.fi ([194.100.28.129] helo=mail.vianova.fi)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fxm9W-0002mD-I1
	for linux-mtd@lists.infradead.org; Tue, 04 Jul 2006 10:45:34 -0400
From: "Ville Herva" <vherva@ENIGMA.vianova.fi>
Date: Tue, 4 Jul 2006 17:38:36 +0300
To: linux-mtd@lists.infradead.org
Subject: kernel command line arguments for block2mtd do not work
Message-ID: <20060704143836.GA5104@vianova.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Reply-To: vherva@vianova.fi, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There seems to be a problem in 2.6.17.3 drivers/mtd/devices/block2mtd.c .
If I compile the driver in statically (to avoid the hassle with modules),
passing in the block2mtd parameter always fails. I'm using kernel command
line parameter

        block2mtd.block2mtd=/dev/hdc2,65536

The
        name = kmalloc(len, GFP_KERNEL);
allocation in block2mtd.c::parse_name() always return NULL (len is 10), even
if I try GFP_ATOMIC.

I tried allocating the name statically (char sname[50]; *pname =
(char*)sname), but that only gave me a screenful of

        unknown interrupt or fault at EIP 00000060 c0126251 00006250

I hardcoded name to be "/dev/hdc2", but it failed in add_device() in similar
manner.

I can only conclude block2mtd_setup() is called too early when the driver is
compiled

After boot
        echo "/dev/hdc2" > /sys/module/block2mtd/parameters/block2mtd
seems to work


As far as I can see, doing kmalloc() for name in parse_name() is superfluous
anyway; block2mtd_setup() calls parse_name(), and the returned name is only used
by add_device() a couple of lines later. add_device() duplicates the string
but never kfrees it as far as I can see. So it's a memory leak at least.

I can workaround this by saving the parameter into static char[] during
block2mtd_setup() (called by module_param_call() macro) and only doing the  
real block2mtd_setup() call in block2mtd_init(). Even then, block2mtd fails 
to find the device (/dev/hdc2). (Note that after boot, echo "/dev/hdc2" >   
/sys/module/block2mtd/parameters/block2mtd does work fully.)             

My next try was to only call real block2mtd_setup() from late_initcall().     
That is still earlier than rootfs mount, so it can't find /dev/hdc2. 

For the rough idea, see 
        http://iki.fi/v/tmp/block2mtd.c                      
(Sorry for the ugliness - it's just a workaround hack.)


The final and ugliest hack wast to do

block2mtd.c::add_device()
        if (strcmp(devname, "/dev/hdc2") == 0)
        {
                INFO("Opening dev \"%s\" via open_by_devnum(MKDEV(22, 2)...\n",
                bdev = open_by_devnum(MKDEV(22, 2), FMODE_WRITE | FMODE_READ);
                INFO("... got bdev=0x%08x\n", bdev);
        }   
        else
                bdev = open_bdev_excl(devname, O_RDWR, NULL);

and that "works". Better ideas would be welcome. At least if (and since)
passing module params to block2mtd via kernel command line is not supposed
to work, the kernel might give an error saying so...
