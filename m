Received: from mail.mediatrix.com ([205.237.248.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157dQk-0006Av-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Jun 2001 14:33:03 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D99548B@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: 'Abraham vd Merwe' <abraham@2d3d.co.za>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: RE: mtd_info->write
Date: Wed, 6 Jun 2001 09:32:00 -0400 
MIME-Version: 1.0
Content-Type: text/plain
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

In my opinion, the low level driver does not have to handle validation, it
just have to provide an interface to primitive function.  The high level
module ( the user interface part of the driver ) has to do the job.  I think
that's the way of MTD people too. 

Frederic Giasson





-----Original Message-----
From: Abraham vd Merwe [mailto:abraham@2d3d.co.za]
Sent: Wednesday, June 06, 2001 9:35 AM
To: Frederic Giasson
Cc: MTD for Linux
Subject: Re: mtd_info->write


Hi Frederic!

> I am almost sure that you have to validate the erase state of the sector
you
> want to write to.  For example, I use cfi_amdstd_write function, and
> absolutely no validation is made in that fonction for this.

You mean the user process/module has to, not the chip driver? I'm writing a
chip driver and I want to know whether the chip driver is responsible for
the checking.

I noticed the other chip drivers (like you say here) doesn't so I'm assuming
I don't have to but I just want to make sure.

> > If the data is all ones ("1"), it has been erased.   If not, it has not.
> 
> Yes, I know, but I want to know whether I have to check if that's the case
> or not.
> 
> > Can you safely assume in the MTD write function that the blocks on which
> the
> > data is have been erased or do you actually have to do some error
checking
> > and return with -EINVAL if you discover that it's not been erased?

-- 

Regards
 Abraham

Chemistry professors never die, they just fail to react.

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa
