Received: from nuustak.csir.co.za ([146.64.10.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fHAo-00030r-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2002 09:11:55 +0000
Received: from CS-IMO.CSIR.CO.ZA (cs-imo.csir.co.za [146.64.10.94])
	by nuustak.csir.co.za (8.11.4/8.11.4) with ESMTP id g1P9N3m17621
	for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2002 11:23:03 +0200 (SAST)
Message-Id: <sc7a1e95.021@CS-IMO.CSIR.CO.ZA>
Date: Mon, 25 Feb 2002 11:22:51 +0200
From: "Herman Theron" <HEtheron@csir.co.za>
To: <linux-mtd@lists.infradead.org>, <ilatypov@superbt.com>
Subject: Re: Error using GRUB patch (and LILO questions)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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

Hi Ilguiz

Yes, I upgraded to automake 1.5, and that solved the problem with grub.
I successfully installed Grub and got the system booting. Being used to
LILO, I must say that is was a bit difficult for me. The
README_DiskOnChip can give more information on how to setup the DOC
(going through nftl_format,etc, etc). Grub unfortunately doesn't abide
to the BIOS boot order. Sometimes I want to boot using a stiffy (rescue
disk), but Grub will always start first. I know that you should be able
to boot from fd0 from Grub, but it is not easy (especially not for
somebody that does not know grub well enough).

So, I still prefer LILO. And yes, I actually got version Lilo 22.2 to
boot my DOC. Thanks Ilguiz. Here follows my lilo.conf:

boot=/dev/nftl/disc0/disc
disk=/dev/nftl/disc0/disc
bios=0x80
lba32
install=/boot/boot-text.b
map=/boot/map
backup=/dev/null
prompt
timeout=50
default=Linux
image=/boot/bzImage-2.4.17-rthal5g
        label=Linux
        root=/dev/nftl/disc0/disc
        vga=normal
	read-only
image=/boot/bzImage-2.4.17-rthal5g
        label=Linux-fb
        root=/dev/nftl/disc0/disc
        vga=0x314
	read-only

I had to tell LILO to use the DOC as the first drive (bios=0x80);

Thanks all
Herman
>>> Ilguiz Latypov <ilatypov@superbt.com> 02/22/02 06:57PM >>>

Herman,

Can you try the updated automake and autoconf packages from
  ftp://ftp.redhat.com/pub/redhat/linux/rawhide/i386/RedHat/RPMS 

Mine are
  automake-1.5-8
  autoconf-2.52-6
I get only a couple of warnings with autoconf.  Sorry for the 
configuration nuisance.

Ilguiz

P.S.  Have you checked the LILO HOWTO at
http://www.ibiblio.org/pub/Linux/docs/HOWTO/mini/LILO ? After the
quick
search on the web I have a suspicion that your M-Sys BIOS firmware was
configured to pretend as a second hard drive.

On Fri, 22 Feb 2002, Herman Theron wrote:

> stage1/Makefile.am:55: invalid variable `nodist_pkgdata_DATA'




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/ 


****************************************
Herman Theron
Hermanus Magnetic Observatory
CSIR
PO Box 32
Hermanus
7200
South Africa
E-mail: hetheron@csir.co.za
Phone: +27 28 3121196
Fax: +27 28 3122039
Cel: +27 833 206 311
