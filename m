Received: from pacific.moreton.com.au ([203.143.235.130]
	helo=dorfl.internal.moreton.com.au)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19N0td-00075S-Cx
	for <linux-mtd@lists.infradead.org>; Tue, 03 Jun 2003 02:47:29 +0100
Message-ID: <3EDBFE55.2040903@snapgear.com>
Date: Tue, 03 Jun 2003 11:48:05 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: uClinux development list <uclinux-dev@uclinux.org>
References: <Law14-OE536PDT89CLh0002e430@hotmail.com>
In-Reply-To: <Law14-OE536PDT89CLh0002e430@hotmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: [uClinux-dev] uCdimm 68VZ328  JFFS2 Questions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Vikram,

Vikram Mehta wrote:
> A few questions
> 1.) I am using uCdimm 68VZ328 with AM29DL323GB flash chip
> NOw I am on CYGWIN and am using Patrice KADIONIK guide HOW TO USE MTD/JFFS2
> UNDER µClinux
> 
[snip]
> 2.) Earlier one was  a silly but important  question, The makefile in
> mtd-utils compliles files with 2 compilers... Onewith m68k-elf-gcc and other
> with gcc. Now on my machine ( I guess due to bein gon CYGWIN) gcc build
> doesnot work for all files and I get linker errors. So I hv removed gcc
> build parts from the makefile. How does that affect the working of the
> tools, kernels etc.

 From your description I can tell you are referring the the uClinux-dist
user/mtd-utils/Makefile, which is different to what is contained in
the  MTD cvs Makefile.

The reason it is compiled with gcc in a complete uClinux build is
to generate the filesystem builer tools for running as part of the
build. So to build mkfs.jffs, mkfs.jffs2, etc. These will be needed
on the host to construct a filesystem ready for loading onto the
real target.


> 3.) Mr David Woodhouse was kind enough to answer me saying that MTD CVS
> utils/makefile doenot contain any gcc build options. So Can someone send me
> this makefile... I tried using the CVS but couldnot ..... I am trying but
> still

If you are building uClinux-dist use what it contains.

If you are using the MTD tools on there own use the MTD CVS
code.


> 4.) Can someone tell me from where can I read in detail about the
> significance of changes Mentioned in  vendors/.../Makefile
> DEVICES = \
> tty,c,5,0 console,c,5,1 cua0,c,5,64 cua1,c,5,65 \
> 
> mtd0,c,90,0 mtd1,c,90,2 mdt2,c,90,4 mtd3,c,90,6 \
> 
> mtd4,c,90,8 mtd5,c,90,10 mtd6,c,90,12 mtd7,c,90,14 \
> 
> mtdblock0,b,31,0 mtdblock1,b,31,1 mtdblock2,b,31,2 mtdblock3,b,31,3 \

In the uClinux-dist build system this is the list of device
nodes that will be created in the target filesystem. Format is
simple:

    <node-name>,<b=block/c=char>,<major>,<minor>

They are never created as nodes on the host system, only in the
target root filesystem (be in ROMfs, JFFS, JFFS2, EXT2, whatever).

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Chief Software Dude       EMAIL:     gerg@snapgear.com
SnapGear Pty Ltd                            PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
