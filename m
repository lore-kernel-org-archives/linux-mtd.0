Received: from ash.lnxi.com ([207.88.130.242] helo=DLT.linuxnetworx.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Y4sP-0003dg-00
	for <linux-mtd@lists.infradead.org>; Fri, 26 Jul 2002 14:11:25 +0100
To: Jasmine Strong <jasmine@regolith.co.uk>
Cc: <linux-mtd@lists.infradead.org>, LinuxBIOS <linuxbios@lanl.gov>
Subject: Re: Compact Flash is a valid canidate for an MTD device.
References: <9C0262F9-A077-11D6-A351-000502893FA1@regolith.co.uk>
From: Eric W Biederman <ebiederman@lnxi.com>
Date: 26 Jul 2002 07:11:18 -0600
In-Reply-To: <9C0262F9-A077-11D6-A351-000502893FA1@regolith.co.uk>
Message-ID: <m31y9qprbd.fsf@DLT.linuxnetworx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Jasmine Strong <jasmine@regolith.co.uk> writes:

> On Friday, July 26, 2002, at 07:23 AM, Eric W Biederman wrote:
> > In particular the following commands were added to IDE.
> > -  CFA REQUEST EXTENDED ERROR CODE
> > -  CFA WRITE SECTORS WITHOUT ERASE
> > -  CFA ERASE SECTORS
> > -  CFA WRITE MULTIPLE WITHOUT ERASE
> > -  CFA TRANSLATE SECTOR
> > -  SET FEATURES Enable/Disable 8-bit transfer
> >
> 
> If you can bypass the device's internal wearlevelling logic, then
> maybe;  but it doesn't look awfully like one can.  Can you, for
> example, write your own out-of-band data, or write untranslated sectors?

Good question.  The bit about out-of-band data I don't quite get.  I
haven't seen an ordinary flash chip that supports it, so I'm not
certain what the concept is.   ECC data?  You can read/write the ECC
data if needed.

The CFA TRANSLATE SECTOR looks like it gives attempts to give the
mapping from translated to untranslated sectors, as well as the number
of times a sector has been erased.

> The problem we had was the internal ASIC getting confused and causing
> the whole device to cease to function.  It doesn't look awfully like
> these extra commands will help this.

ASIC confusion is certainly hard to guard against.  At the minimum
a window is provided into the workings of the Compact Flash.  Beyond
that the window might just be large enough to configure the device
as an MTD device.

At the same time given that the normal filesystem is FAT16 on a
Compact Flash device I won't expect miracles.  But it looks to me like
it might be worth it to see if the Compact Flash variant of the IDE
command set, is acually useful.  Instead of saying it looks just like
an IDE block device so ignore it.

Eric
