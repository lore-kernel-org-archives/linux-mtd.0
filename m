Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17vw4s-0006v7-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2002 09:38:54 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020930080233.GA1236@elproma.com.pl> 
References: <20020930080233.GA1236@elproma.com.pl>  <19E00413.60CCAB38.0265FBE9@netscape.net> <8493.1033029923@redhat.com> 
To: Piotr Trojanek <ptroja@elproma.com.pl>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Question about power fail during file upgrade 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 30 Sep 2002 09:38:51 +0100
Message-ID: <1788.1033375131@redhat.com>
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

ptroja@elproma.com.pl said:
> On Thu, Sep 26, 2002 at 09:45:23AM +0100, David Woodhouse wrote:
> > Kschoo70C@netscape.net said:
> > >     I need some help to understand how the JFFS2 works. If I have a
> > > version 1 of software component A on JFFS2, what happen if power
> > > failed while I am in the middle of upgrading the component A to
> > > version 2 ? The question is do I have version 1 intact or a
> > > combination of version 1 and 2 ?
> >
> > > Does the JFFS2 filesystem only set the inodes of a file to be valid
> > > only after a complete file is written to the flash ? Does the old
> > > file will only be deleted only after the new file is verified to be
> > > valid ?
> >
> > JFFS2 knows nothing of 'complete files'. You are guaranteed atomicity
> > of individual file system operations only, according to POSIX. 
> >
> > As with other file systems, you can write the new version of the file,
> > then rename it over the top of the original. That will be atomic.
> > 
> > There's been talk about extending JFFS2 to allow userspace
> > 'transactions' but it's not been done.

> so the only atomic change, that is guaranteed to work is renaming
> new.file -> old.file?

At the filesystem level, yes.

> if I need to make upgrade which depends on 10 files what should I do?
> how about put all filesystem in one .tar and put it in ramdisk at
> system startup, then make upgrade of .tar file, which is on JFFS2 DOC
> and reboot? will it work? 

There are plenty of options, one of which is to implement transation 
support in the file system so that your application can ensure that 
either all 10 of your renames happen or none of them.

I'm assuming you only really care about atomicity w.r.t power failure, and 
a moment where the files are absent is acceptable as long as they can be 
trivially recovered at boot time? You could unpack all the files into a 
directory -- '/usr/mypackage-v2', then make a symlink from /usr/mypackage 
to whichever version is current. If you boot and find no symlink, you check 
which is the most recent _intact_ version and symlink to that. Many 
variations on the theme are possible.


trivially be re

--
dwmw2
