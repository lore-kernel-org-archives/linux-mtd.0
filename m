Received: from mail.i-bucks.com ([216.2.101.40] helo=speedy.i-bucks.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178m9X-0006JG-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 19:08:32 +0100
Received: from bullwinkle4 (CBL-riehl.hs.earthlink.net [209.178.111.84])
	by speedy.i-bucks.com (8.11.6/8.11.6) with SMTP id g4HI6fn00555
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 11:06:51 -0700
Message-Id: <3.0.32.20020517110807.0072a470@mail.i-bucks.com>
Date: Fri, 17 May 2002 11:08:28 -0700
To: linux-mtd@lists.infradead.org
From: john riehl <jr@i-bucks.com>
Subject: Re: Getting big flash onto motherboards. Will CF work? what
  will?
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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

At 10:08 AM 5/17/02 -0700, Russ Dill wrote:
>
>> Are there other options? These are 1U or .8U spaces most likely, and so a
>> big PCI card is out of the question -- that's needed for Myrinet. There
>> are no ISA slots. There are two IDE headers, and possibly a SCSI header. A
>> very low profile PCI card might work. The only option I was aware of was
>> IDE->CF adapaters. Is there something else I should look at?
>
>there are DOC devices that plug into IDE
>

These are called DiskonModule  (as opposed to diskonchip).  

They come in both 40 and 44 pin connections.  They arent very big, they
look like a terminator.  Most are flat, like a hard drive (but much shorter
& smaller), some have an L-shape.

I have seen them at a lot of trade shows (comdex, etc.).   Inside the front
cover of my copy of processor magazine, there is an ad for them from
www.pqiusa.com.

The idea is that they act like an ide hard drive.   I havent used one.  I
dont know what needs to be done, driver-wise, to actually use one.

jr
john riehl

 
