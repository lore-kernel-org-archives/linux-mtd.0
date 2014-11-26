Received: from mail-wg0-x22e.google.com ([2a00:1450:400c:c00::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtYND-0003w0-Cg
 for linux-mtd@lists.infradead.org; Wed, 26 Nov 2014 08:54:56 +0000
Received: by mail-wg0-f46.google.com with SMTP id x12so3055957wgg.19
 for <linux-mtd@lists.infradead.org>; Wed, 26 Nov 2014 00:54:32 -0800 (PST)
From: Rob Ward <robert.ward114@googlemail.com>
Date: Wed, 26 Nov 2014 08:54:20 +0000 (GMT)
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: phram: Allow multiple phram devices on cmd line
In-Reply-To: <20141126063256.GH3212@norris-Latitude-E6410>
Message-ID: <alpine.DEB.2.10.1411260853070.7838@rob-thinkpad>
References: <alpine.DEB.2.10.1410211859030.7838@rob-thinkpad>
 <alpine.DEB.2.10.1411091618160.7838@rob-thinkpad>
 <20141126063256.GH3212@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, joern@lazybastard.org,
 linux-kernel@vger.kernel.org, Rob Ward <robert.ward114@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 25 Nov 2014, Brian Norris wrote:

> On Sun, Nov 09, 2014 at 04:24:44PM +0000, Rob Ward wrote:
> > From 4e9b8ff3a6731a0ac43eac2e8bdf47101ff20ede Mon Sep 17 00:00:00 2001
> > From: Rob Ward <robert.ward114@googlemail.com>
> > Date: Tue, 21 Oct 2014 17:46:53 +0100
> > Subject: [PATCH] mtd: phram: Allow multiple phram devices on cmd line
> > 
> > Allow the phram module the ability to create multiple phram mtd
> > devices via the kernel command line.
> 
> Is the sysfs module parameter option not sufficient?
>
While using the sysfs would work in most situations there are times when 
it is less than ideal. An example is where the information regarding the
locations of filesystems within RAM is not know by the kernel and needs to 
be passed from the bootloader. This can be acheived a number of ways
but passing via the cmdline and having phram understand multiple options
is a nicer and consistent solution.
> 
>   /sys/module/phram/parameters/phram
> 
> It looks like it should be reusable for multiple device creations.
> 
> Notably, we use 000 permissions for module_param_call(), so the
> parameter doesn't even show up by default AFAICT. I had to hack it to
> 0600 or similar.
> 
> > Currently the phram module only allows a single mtd device to be
> > created via the kernel command line. This is due to the phram
> > module having to store the values until it is initialised
> > later. This storage is done using a single char[] meaning when
> > the module_param_call is made the previous value is overidden.
> > 
> > This change modifies the phram system to use a char[][] allowing
> > multiple devices to be created.
> > 
> > The array size if controlled using the new config option
> > CONFIG_MTD_PHRAM_MAX_CMDLINE_ARGS that allows the maximum
> > number of devices to be specified. Currently this option
> > defaults to a value of 1 leaving the behaviour unchanged.
> > 
> > If the array is full a message is printed to the console and the
> > module_param_call returns.
> > 
> > To test, in all cases an area of memory needs to be reserved via
> > the command line e.g. memmap=10M$114M
> > 
> > To test with phram build into the kernel on the command line add
> > the following:
> > 
> > phram.phram=alpha,114Mi,1Mi phram.phram=beta,115Mi,1Mi
> > 
> > If CONFIG_MTD_PHRAM_MAX_CMDLINE_ARGS is left as default i.e. 1
> > then the first device, alpha will be created only. If the value of
> > CONFIG_MTD_PHRAM_MAX_CMDLINE_ARGS is increased to 2 or more then
> > both alpha and beta will be created.
> 
> I really don't think we want this to be a Kconfig option. We can
> dynamically allocate and use a linked list instead, which would be more
> flexible and avoid making a fixed compile-time choice.
>
My first thought was to implement a linked list, however in the phram code
there is a comment:

	phram_param_call() is called so early that it
	is not possible to resolve the device (even
	kmalloc() fails). Defer that work to phram_setup().

To test I modify the current phram code to include a kmalloc:

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index effd9a4..93b3cd9 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -271,6 +271,7 @@ static int phram_param_call(const char *val, struct kernel_param *kp)
 #ifdef MODULE
 	return phram_setup(val);
 #else
+	char* fred = kmalloc(100, GFP_KERNEL);
 	/*
 	 * If more parameters are later passed in via
 	 * /sys/module/phram/parameters/phram

then when the kernel is booted(qemu in my case) using the following 
command:

qemu-system-x86_64 -kernel arch/x86/boot/bzImage -append "console=ttyAMA0 
console=ttyS0 phram.phram=alpha,114Mi,1Mi memmap=10M\$114M" -serial stdio

the the kernel will not boot.

If I remove the phram option so it doesn't go through the 
phram_param_call() and no kmalloc is called then the kernel boots fine.

I couldn't think of a nicer solution than using a Kconfig option other 
than hard coding a value which I don't personally like, I am however happy 
to change it if there is a better solution I haven't thought of.

> > To test phram built as a module insmod with the following arguments:
> > 
> > phram=gamma,114Mi,1Mi phram=delta,115Mi,1Mi
> > 
> > In this case two devices should be created.
> > 
> > Signed-off-by: Rob Ward <robert.ward114@googlemail.com>
> > ---
> >  drivers/mtd/devices/Kconfig | 12 ++++++++++++
> >  drivers/mtd/devices/phram.c | 45 ++++++++++++++++++++++++++++++++++++++++-----
> >  2 files changed, 52 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
> > index c49d0b1..5fdc80b 100644
> > --- a/drivers/mtd/devices/Kconfig
> > +++ b/drivers/mtd/devices/Kconfig
> > @@ -136,6 +136,18 @@ config MTD_PHRAM
> >  	  doesn't have access to, memory beyond the mem=xxx limit, nvram,
> >  	  memory on the video card, etc...
> >  
> > +config MTD_PHRAM_MAX_CMDLINE_ARGS
> > +	int "Max number of devices via Kernel command line"
> > +	depends on MTD_PHRAM=y
> > +	default 1
> > +	help
> > +	  Specify the number of phram devices that can be initialised
> > +	  using the Kernel command line.
> > +
> > +	  This option is only applicable when phram is built into the
> > +	  Kernel. When built as a module many devices can be specified
> > +	  at module insmod.
> > +
> >  config MTD_LART
> >  	tristate "28F160xx flash driver for LART"
> >  	depends on SA1100_LART
> > diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
> > index effd9a4..223f221 100644
> > --- a/drivers/mtd/devices/phram.c
> > +++ b/drivers/mtd/devices/phram.c
> > @@ -212,9 +212,13 @@ static int phram_init_called;
> >   * - phram.phram=<device>,<address>,<size> for built-in case
> >   * We leave 64 bytes for the device name, 20 for the address and 20 for the
> >   * size.
> > + *
> > + * The maximum number of devices supported is controlled by the
> > + * MTD_PHRAM_MAX_CMDLINE_ARGS config option
> > + *
> >   * Example: phram.phram=rootfs,0xa0000000,512Mi
> >   */
> > -static char phram_paramline[64 + 20 + 20];
> > +static char phram_paramline[CONFIG_MTD_PHRAM_MAX_CMDLINE_ARGS][64 + 20 + 20];
> >  #endif
> >  
> >  static int phram_setup(const char *val)
> > @@ -271,6 +275,9 @@ static int phram_param_call(const char *val, struct kernel_param *kp)
> >  #ifdef MODULE
> >  	return phram_setup(val);
> >  #else
> > +	int paramline_it = 0;
> > +	int arraysize = 0;
> 
> Neither of these need to be initialized here. And can you shorten the
> long-ish names? We don't need an "iterator" -- it's just and index 'i'.
> 
> > +
> >  	/*
> >  	 * If more parameters are later passed in via
> >  	 * /sys/module/phram/parameters/phram
> > @@ -290,9 +297,27 @@ static int phram_param_call(const char *val, struct kernel_param *kp)
> >  	 * phram_setup().
> >  	 */
> >  
> > -	if (strlen(val) >= sizeof(phram_paramline))
> > +	if (strlen(val) >= sizeof(phram_paramline[0]))
> >  		return -ENOSPC;
> > -	strcpy(phram_paramline, val);
> > +
> > +	arraysize = sizeof(phram_paramline)/sizeof(phram_paramline[0]);
> 
> Coccinelle complains:
> 
> drivers/mtd/devices/phram.c:303:35-36: WARNING: Use ARRAY_SIZE
> 
> > +
> > +	/*
> > +	 * Check if any space is left in the array. If no space
> > +	 * is left then print warning and return 0
> > +	 */
> > +
> > +	if (phram_paramline[arraysize - 1][0]) {
> > +		pr_warn("exceeded limit via cmd_line - %s ignored", val);
> > +		return 0;
> > +	}
> > +
> > +	for (paramline_it = 0; paramline_it <= arraysize; paramline_it++) {
> 
> Use '<' not '<='. You're overflowing the array.
> 
> > +		if (!phram_paramline[paramline_it][0]) {
> > +			strcpy(phram_paramline[paramline_it], val);
> > +			break;
> > +		}
> > +	}
> >  
> >  	return 0;
> >  #endif
> > @@ -307,8 +332,18 @@ static int __init init_phram(void)
> >  	int ret = 0;
> >  
> >  #ifndef MODULE
> > -	if (phram_paramline[0])
> > -		ret = phram_setup(phram_paramline);
> > +	int arraysize = 0;
> > +	int paramline_it = 0;
> 
> Same comments as above. Neither of these need to be initialized here,
> and shorten the name.
> 
> > +
> > +	arraysize = sizeof(phram_paramline)/sizeof(phram_paramline[0]);
> 
> drivers/mtd/devices/phram.c:338:35-36: WARNING: Use ARRAY_SIZE
> 
> > +
> > +	for (paramline_it = 0; paramline_it <= arraysize; paramline_it++) {
> 
> You're off-by-one; use '<', not '<='. So this line could just be:
> 
> 	for (i = 0; i < ARRAY_SIZE(phram_paramline); i++) {
> 
> (But then, we can avoid this by just allocating and appending to a
> linked list.)
> 
> > +		if (phram_paramline[paramline_it][0]) {
> > +			ret = phram_setup(phram_paramline[paramline_it]);
> > +			if (ret)
> > +				break;
> > +		}
> > +	}
> >  	phram_init_called = 1;
> >  #endif
> >  
> 
> Brian
> 
Cheers,

Rob
