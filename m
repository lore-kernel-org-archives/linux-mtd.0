Received: from rt-pi1-ru-sssup.pi1.garr.net ([193.206.136.46]
	helo=smtp2.sssup.it)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JzRZT-0005mg-Dl
	for linux-mtd@lists.infradead.org; Fri, 23 May 2008 07:20:12 +0000
Message-ID: <48366FF8.5010506@gandalf.sssup.it>
Date: Fri, 23 May 2008 09:19:20 +0200
From: michael <trimarchi@gandalf.sssup.it>
MIME-Version: 1.0
To: James <jamessteward@optusnet.com.au>
Subject: Re: Help needed with MTD on AT91SAM9263-EK please.
References: <1211437223.6129.82.camel@Ubuntu-Desktop>	
	<80b317760805222326j57e6bc11sfe0beef9ab68267b@mail.gmail.com>	
	<1211524684.6203.13.camel@torchwood>
	<483668B6.3080507@gandalf.sssup.it>
	<1211526142.6203.24.camel@torchwood>
In-Reply-To: <1211526142.6203.24.camel@torchwood>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Richard Genoud <richard.genoud@gmail.com>,
	linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
> What kernel, patches and tool chain are you using?
>
2.6.24.4 + preempt_rt patch
A number recent fix of jffs2 layer and same personal drivers.
The gcc version is (generated with build root)

./arm-linux-gcc -v
Using built-in specs.
Target: arm-linux-uclibc
Configured with: 
/home/michael/buildroot/toolchain_build_arm/gcc-4.2.1/configure 
--prefix=/usr --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu 
--target=arm-linux-uclibc --enable-languages=c 
--with-sysroot=/home/michael/buildroot/build_arm/staging_dir 
--with-build-time-tools=/home/michael/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/bin 
--disable-__cxa_atexit --enable-target-optspace --with-gnu-ld 
--enable-shared 
--with-gmp=/home/michael/buildroot/toolchain_build_arm/gmp 
--with-mpfr=/home/michael/buildroot/toolchain_build_arm/mpfr 
--disable-nls --enable-threads --disable-multilib --with-tune=arm9tdmi 
--disable-largefile : (reconfigured) 
/home/michael/buildroot/toolchain_build_arm/gcc-4.2.1/configure 
--prefix=/usr --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu 
--target=arm-linux-uclibc --enable-languages=c 
--with-sysroot=/opt/crosstools 
--with-build-time-tools=/opt/crosstools/usr/arm-linux-uclibc/bin 
--disable-__cxa_atexit --enable-target-optspace --with-gnu-ld 
--enable-shared 
--with-gmp=/home/michael/buildroot/toolchain_build_arm/gmp 
--with-mpfr=/home/michael/buildroot/toolchain_build_arm/mpfr 
--disable-nls --enable-threads --disable-multilib --with-tune=arm9tdmi 
--disable-largefile
Thread model: posix
gcc version 4.2.1

> Regards,
> James.
>
>   
Michael
