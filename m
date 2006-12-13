Received: from wr-out-0506.google.com ([64.233.184.234])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GuIyi-0000eY-6V
	for linux-mtd@lists.infradead.org; Tue, 12 Dec 2006 20:32:14 -0500
Received: by wr-out-0506.google.com with SMTP id i11so11248wra
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Dec 2006 17:32:10 -0800 (PST)
Message-ID: <90e974410612121732m6d1535bcv5cdba75f51a6362e@mail.gmail.com>
Date: Tue, 12 Dec 2006 17:32:09 -0800
From: "Daniel Robinson" <danielgrobinson@gmail.com>
To: "Josh Boyer" <jwboyer@linux.vnet.ibm.com>
Subject: Re: intel p30, unlocking before loading driver, again
In-Reply-To: <1165973472.2505.4.camel@crusty.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <90e974410612121501x67c7650aq9549b3d508bcf939@mail.gmail.com>
	<1165973472.2505.4.camel@crusty.rchland.ibm.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I found the problem.

I think I have it working now.

Thanks, Dan

On 12/12/06, Josh Boyer <jwboyer@linux.vnet.ibm.com> wrote:
> On Tue, 2006-12-12 at 15:01 -0800, Daniel Robinson wrote:
> > I have a board with a P30 part on it and here are the knowns:
> >
> > 1) the P30 powers up with all blocks locked.
>
> Yes.
>
> >
> > 2) if the driver gets loaded with the blocks locked, mode is 0660
> > (rw-rw----), which allows me to open the device in O_RDWR mode, will
> > let me do ioctl() calls to unlock blocks, but won't let me write to
> > the device.  The ioctl() returns without error, but writing fails
> > because it is a read only file system.
> >
> > 3) In an attempt to increase robustness for a system that will be
> > embedded, I want to limit the amount of the part that is unlocked and
> > available for writing.  Ideally, I would like to control that
> > parametrically.
> >
> > I can't find the place in the flash device is checked for being
> > unlocked and the bits are set that indicate that it is a read-only
> > device.
>
> There are commands you can send to the chip to query this status.  See
> the datasheet for the flash chip.
>
> You can partition up your device and unlock partitions as needed.  Or
> you can do it from within a board driver if you need it at boot time for
> things like a root filesystem.
>
> josh
>
>
