Received: from elproma-gw.hbz.pl ([213.77.124.176] helo=elproma.com.pl)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17vvWE-0006rS-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2002 09:03:06 +0100
Received: from ptroja by elproma.com.pl with local (Exim 3.35 #1 (Debian))
	id 17vvVh-0000Kv-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2002 10:02:33 +0200
Date: Mon, 30 Sep 2002 10:02:33 +0200
From: Piotr Trojanek <ptroja@elproma.com.pl>
To: linux-mtd@lists.infradead.org
Subject: Re: Question about power fail during file upgrade
Message-ID: <20020930080233.GA1236@elproma.com.pl>
References: <19E00413.60CCAB38.0265FBE9@netscape.net> <8493.1033029923@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8493.1033029923@redhat.com>
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

On Thu, Sep 26, 2002 at 09:45:23AM +0100, David Woodhouse wrote:
> 
> Kschoo70C@netscape.net said:
> >     I need some help to understand how the JFFS2 works. If I have a
> > version 1 of software component A on JFFS2, what happen if power
> > failed while I am in the middle of upgrading the component A to
> > version 2 ? The question is do I have version 1 intact or a
> > combination of version 1 and 2 ?
> 
> > Does the JFFS2 filesystem only set the inodes of a file to be valid
> > only after a complete file is written to the flash ? Does the old file
> > will only be deleted only after the new file is verified to be valid ?
> 
> JFFS2 knows nothing of 'complete files'. You are guaranteed atomicity of 
> individual file system operations only, according to POSIX. 
> 
> As with other file systems, you can write the new version of the file, then
> rename it over the top of the original. That will be atomic.
> 
> There's been talk about extending JFFS2 to allow userspace 'transactions' 
> but it's not been done.

so the only atomic change, that is guaranteed to work is renaming
new.file -> old.file?

if I need to make upgrade which depends on 10 files what should I do?
how about put all filesystem in one .tar and put it in ramdisk at system
startup, then make upgrade of .tar file, which is on JFFS2 DOC and
reboot? will it work?

-- 
Piotr Trojanek
