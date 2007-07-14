Received: from wa-out-1112.google.com ([209.85.146.180])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I9gHY-0004XE-A6
	for linux-mtd@lists.infradead.org; Sat, 14 Jul 2007 07:59:29 -0400
Received: by wa-out-1112.google.com with SMTP id v33so895334wah
	for <linux-mtd@lists.infradead.org>;
	Sat, 14 Jul 2007 04:59:26 -0700 (PDT)
Message-ID: <9b52d64c0707140459t23fce988qc384ade21a1f5f42@mail.gmail.com>
Date: Sat, 14 Jul 2007 17:29:26 +0530
From: "Vinit Agnihotri" <vinit.agnihotri@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: UBI: Can we handle -EINTR differently in erase/write path???
In-Reply-To: <1184331963.6456.3.camel@weaponx.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <9b52d64c0707122307j419d2d98xa771c2c09a280164@mail.gmail.com>
	<1184331963.6456.3.camel@weaponx.rchland.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ok the scenario is like this.
1. User created a volume
2. User issues raw writes on device by using "dd"
3.UBI do not find any preerased block & so it tries to erase 1 block
synchronously
4.When sync_erase is invoked... it waits in wait_event_interruptible()
5. At this moment if user presses ctrl+c & wait_event_interruptible()
return -EINTR
6. On error erase_worker() will mark ubi in Read-only mode.

Soo we need to handle -EINTR differently, as I've faced this situation :)

Thanks & Regards
Vinit.


/13/07, Josh Boyer <jwboyer@linux.vnet.ibm.com> wrote:
> On Fri, 2007-07-13 at 11:37 +0530, Vinit Agnihotri wrote:
> > Hi heres few code snip from erase_worker(); from wl.c
> > if (err != -EIO) {
> >         /*
> >          * If this is not %-EIO, we have no idea what to do. Scheduling
> >          * this physical eraseblock for erasure again would cause
> >          * errors again and again. Well, lets switch to RO mode.
> >          */
> >         ubi_ro_mode(ubi);
> >         return err;
> >     }
> >
> > Suppose while erasure in progress & someone pressed "Ctrl+C" then UBI
>
> This is the kernel...  the erase_worker function is called from a kernel
> thread that doesn't allow signals.  How would it get a "Ctrl+C" event?
>
> > This is my initial understanding about handling -EINTR, however I
> > would like to know views of others. If all agrees I can post patch for
> > same.
>
> That is how you handle the EINTR errno in userspace.  I think you'd need
> to show how -EINTR could show up in this code path in the kernel before
> worrying about how to handle it.
>
> josh
>
>


-- 
I feel free now
