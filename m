Received: from [199.221.73.29] (helo=marconi-gfw.marconicommerce.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14wkDj-0008HM-00
	for <linux-mtd@lists.infradead.org>; Mon, 07 May 2001 13:34:35 +0100
Message-ID: <A3E34B558F5CD211B4980008C7A4A99003163ECC@sparrow.eng.gilbarco.com>
From: "Williams, Kevin M." <kevin.m.williams@marconi.com>
To: "'edmund@troche.org'" <edmund@troche.org>, linux-mtd@lists.infradead.org
Subject: RE: Invalid ioctl answer + another question
Date: Mon, 7 May 2001 08:34:34 -0400 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Edmund, 

I just posted a similar problem last week and David's suggestion fixed my
problem....

I was running a 2.4.4 kernel, but using the utilities built from an older
kernel (2.4.3-pre-3).  I rebuilt everything in the 'util' directory with the
new kernel headers from 2.4.4 and my ioctl error went away.  Try rebuilding
the mkfs.jffs binary with the new kernel headers.

However, I now have the following timeout error and question:

bash#>sbin/erase /dev/mtd2 0 6
MTD_open
Erase Total 6 Units
MTD_ioctlMTD_ioctl
Erase Unit Size MTD_ioctl
Performing Flash Erase of length 131072 at offset 0x0waiting for erase to
complete timed out.
MTD Erase failure: Input/output error<6>MTD_close

Can anyone give me any ideas on why I am getting this?  I just
double-checked, and the old 'erase' utility works with this same hardware
and my 2.4.3-pre-3 kernel (with the 5 April mtd snapsnot).

Thank you in advance for any help!

Kevin

-----Original Message-----
From: Edmund Troche [mailto:edmund@troche.org]
Sent: Sunday, May 06, 2001 3:23 PM
To: MTD Mailing List
Subject: Re: Invalid ioctl


I have  the same results with a 48MB DoC 2000 also.


Edmund

Edmund Troche wrote:

> I created a 8MB partition (nftla1) on a 8MB DoC 2000, and tried to cp a
jffs
> image that was created with mkfs.jffs, and got the following message:
>     Invalid ioctl 5401 (MEMGETINFO = 80204d01)
>     ECC needs a full sector write (adr: 9de00 size 134)
>
> The DiskOnChip is being found @ address 0xD6000 and it correctly detects
it as
> 8MB. JFFS and MTD support is compiled in, no modules in this case.
>
> Anyone familiar with what may be the problem? Thanks in advance for any
help.
>
> Edmund Troche
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
