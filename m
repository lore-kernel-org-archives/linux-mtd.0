Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HJSP1-0007ds-N0
	for linux-mtd@lists.infradead.org; Tue, 20 Feb 2007 05:39:22 -0500
Subject: Re: Why is PEB not erased before writing???
From: Thomas Gleixner <tglx@linutronix.de>
To: brijesh.singh@calsoftinc.com
In-Reply-To: <44602.172.16.0.34.1171964998.squirrel@webmail.calsoftinc.com>
References: <6b5362aa0702192237o69e7efe9wf5844bfaff91e2ff@mail.gmail.com>
	<1171964069.30834.220.camel@localhost.localdomain>
	<44602.172.16.0.34.1171964998.squirrel@webmail.calsoftinc.com>
Content-Type: text/plain
Date: Tue, 20 Feb 2007 11:44:19 +0100
Message-Id: <1171968259.30834.229.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Brijesh Singh <brijesh.s.singh@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-02-20 at 15:19 +0530, brijesh.singh@calsoftinc.com wrote:
> > Applications and UBI kernel users have no access to physical erase
> > blocks. They look at logical erase blocks. UBI manages the translation
> > of logical to physical blocks. If you write to the same logical erase
> > block again UBI will just write to a different physical erase block and
> > erase the previous PEB later on. The internal management guarantees that
> > the application looks only at the newest written block and not at the
> > older one.
> 
> Yes this is what I thought it should do.If LEB is mapped to a dirty PEB
> remap it and wl daemon will erase it.But it doesn't.
> But here is the scenario
> Steps
>      *I made a 2MB ubi volume
>      *Total mtd device size is 3MB
>      *I wrote a 2MB file to UBI using "dd if=file of=/dev/ubi_vol"
>      *Now device is full
>      *Again I did the same thing.
>      *Now theoretically erase should have been called,by wl or eba module
>      *But it directly over-writes the device.
> I am using mtdram to test if erase is called.Nop,it is not.
> Cdev write interface calls eba_write which doesn't check if block is
> already written.And it over-writes it with no call to erase.
> Now what to do?Erase is not even called!

Did you enable CONFIG_MTD_USERSPACE_IO ? If yes, then the behaviour is
clear. This is a _DEBUG_ option and bypasses the normal update
procedure.

	tglx
