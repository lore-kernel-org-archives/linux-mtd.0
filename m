Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17T2EW-0003h8-00
	for <linux-mtd@lists.infradead.org>; Fri, 12 Jul 2002 16:21:24 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020712075715.GA9952@rhin> 
References: <20020712075715.GA9952@rhin>  <20020604132254.GA4911@rhin.smartdata.ch> <20020701131443.GA10227@rhin> <20020711161909.GA8143@rhin> <20020711191540.GA16466@wohnheim.fh-wedel.de> 
To: Frederic Gobry <frederic.gobry@smartdata.ch>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mmap question 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 12 Jul 2002 16:21:19 +0100
Message-ID: <10934.1026487279@redhat.com>
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

frederic.gobry@smartdata.ch said:
>  I can work around this for my program (I just tested, performing a
> simple read just after the write restores what is seen in the mmapped
> memory), but I still would like to know if the MTD API could be
> augmented in order to handle read-only memory mapped areas (when
> available) in a cleaner way as what I currently do?  I don't think
> this would imply lots of changes:

>       - a flag indicating if the flash can be mmapped

>       - the implementation  of mmap (which probably would  need a call
>         similar  to  'point'  but  with an  explicit  semantic  toward
>         mmapping.

Er, ditch the crap 'point' semantics and implement something sane for 
mmapping, because that's about the only sane use of point() anyway.

>       - possibly another  flag to indicate  that an area  is currently
>         mmapped, so that the erase / write operations set the flash in
>         read mode once they have finished their duty 

That's not sufficient. If you let the erase or write operations happen 
while it's mapped, what prevents your app from reading from the flash 
_during_ the erase/write operation? You need to either prevent the erases/
writes from happening while the flash is mapped (bad) or arrange for the 
pages mapped to userspace to be marked invalid during the erase/write 
operation, and faults on those pages have to wait until the flash is back 
in read mode again.

We want some kind of mtd_remap() call which has its own struct vm_operations,
with a nopage() which sets a flag in the state of the underlying mtd_info, 
and ensure that the page can be found again and made invalid before any 
other MTD operations. With the rmap VM the latter is quite simple, without 
it we'd need to keep track of all vmas ourselves.

This can be used from userspace via the mtdchar device's mmap() method, and 
also from kernelspace so that things like jffs2 can just remap the flash 
and read from it directly instead of having to make repeated mtd->read() 
calls. 

--
dwmw2
