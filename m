Received: from anchor-post-32.mail.demon.net ([194.217.242.90])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D13rz-0002JG-31
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 09:40:18 -0500
Content-Type: text/plain;
  charset="iso-8859-1"
From: Simon Haynes <simon@baydel.com>
To: Sean Kelley <sean.sweng@gmail.com>,
 linux-mtd@lists.infradead.org
Date: Tue, 15 Feb 2005 14:33:20 +0000
References: <43507b7c0502141847134e1e68@mail.gmail.com>
In-Reply-To: <43507b7c0502141847134e1e68@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <B14B7F022B43@baydel.com>
Cc: 
Subject: Re: Linux MTD and NFTL - Question
Reply-To: simon@baydel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sean,

Do you know if the USB device contains any embedded block translation layer ?

I had a similar problem with Smart Media. All of the PC card readers I have 
come across have a embedded block translation layer and my ebmedded hardware
did not. I had to write a software version of this translation layer so that 
I could interchange the media. I included this stuff in the mtd tree so you 
can get it there, if this is what you need ?

This is very basic code and it has limitiations which made writing the stuff 
quicker. These are ok for me but may not be for you.

Cheers

Simon

On Tuesday 15 Feb 2005 2:47 am, Sean Kelley wrote:
> I've been looking into an NFTL implementation for a device that uses a
> NAND part and needs to be mounted on a Window's PC Desktop.  Thus I
> need a Block Device interface so as to present a surface on which a
> FAT filesystem can be placed.  However, in the course of my research
> it came to my attention that a company called M-Systems has a hefty
> amount of IP with regards to FTL and NFTL for pseudo-block devices.
> How does the Linux MTD-NFTL skirt the patents that M-Systems has in
> place?  If I want to sell my product commercially what sort of risk?
> It is not terribly clear.  I've looked at YAFFS and JFFS2, but those
> won't work if I wish to support USB mass storage for the Windows
> desktop.
>
> Any comments on NFTL and M-Systems patents much appreciated.
>
> Thanks,
>
> Sean
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
