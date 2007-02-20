Received: from ug-out-1314.google.com ([66.249.92.174])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HJStr-0008Fd-55
	for linux-mtd@lists.infradead.org; Tue, 20 Feb 2007 06:11:14 -0500
Received: by ug-out-1314.google.com with SMTP id m2so712015uge
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Feb 2007 03:11:08 -0800 (PST)
Message-ID: <6b5362aa0702200311k6e063b46ia6e659277c082434@mail.gmail.com>
Date: Tue, 20 Feb 2007 16:41:08 +0530
From: "Brijesh Singh" <brijesh.s.singh@gmail.com>
To: tglx@linutronix.de
Subject: Re: Why is PEB not erased before writing???
In-Reply-To: <1171968259.30834.229.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <6b5362aa0702192237o69e7efe9wf5844bfaff91e2ff@mail.gmail.com>
	<1171964069.30834.220.camel@localhost.localdomain>
	<44602.172.16.0.34.1171964998.squirrel@webmail.calsoftinc.com>
	<1171968259.30834.229.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org, brijesh.singh@calsoftinc.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2/20/07, Thomas Gleixner <tglx@linutronix.de> wrote:
> On Tue, 2007-02-20 at 15:19 +0530, brijesh.singh@calsoftinc.com wrote:
> > > Applications and UBI kernel users have no access to physical erase
> > > blocks. They look at logical erase blocks. UBI manages the translation
> > > of logical to physical blocks. If you write to the same logical erase
> > > block again UBI will just write to a different physical erase block and
> > > erase the previous PEB later on. The internal management guarantees that
> > > the application looks only at the newest written block and not at the
> > > older one.
> >
> > Yes this is what I thought it should do.If LEB is mapped to a dirty PEB
> > remap it and wl daemon will erase it.But it doesn't.
> > But here is the scenario
> > Steps
> >      *I made a 2MB ubi volume
> >      *Total mtd device size is 3MB
> >      *I wrote a 2MB file to UBI using "dd if=file of=/dev/ubi_vol"
> >      *Now device is full
> >      *Again I did the same thing.
> >      *Now theoretically erase should have been called,by wl or eba module
> >      *But it directly over-writes the device.
> > I am using mtdram to test if erase is called.Nop,it is not.
> > Cdev write interface calls eba_write which doesn't check if block is
> > already written.And it over-writes it with no call to erase.
> > Now what to do?Erase is not even called!
>
> Did you enable CONFIG_MTD_USERSPACE_IO ? If yes, then the behaviour is
> clear. This is a _DEBUG_ option and bypasses the normal update
> procedure.
>
>         tglx
>
>
>

Yes I did enable this CONFIG_MTD_UBI_USERSPACE_IO  option.We can't
write the device if this flag is not enabled.UBI treats the device as
readonly.
This  is the usual way to write UBI device,I guess.

UBI doesn't maintain which write sub-block is dirty.Most of the
hardwares don't give error if user is "not writing free sub-block".
There is a paranoid check in ubi_io_write_data to check all 0xFF but
not a mainline check

The call hirerchy of write is,
cdev- write
eba-write
    if mapped
               io_write_data
 <------ here if I am over-writing the sub-block(NOT 0xFF),
                                               UBI should copy
block,get a free PEB,write this block without  old sub-block and write
new sub-block
---->
else
              map LEB-PEB
              io_write_data
io-write
  call mtd-write

So whose job is to check block is not empty,so erase it then write it.
