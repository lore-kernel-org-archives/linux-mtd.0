Received: from h139-142-224-7.gtcust.grouptelecom.net ([139.142.224.7])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16smmv-0004OX-00
	for <linux-mtd@lists.infradead.org>; Wed, 03 Apr 2002 16:35:05 +0100
Received: from athlon (24-66-30-3.gatewest-shaw.ca [24.66.30.3])
        by kynes.gatewest.net (8.12.1/8.12.0.Beta19/Debian 8.12.0.Beta19) with SMTP id g33FZ1du011660
        for <linux-mtd@lists.infradead.org>; Wed, 3 Apr 2002 09:35:01 -0600
Message-ID: <000f01c1db25$262b4f50$87657bc8@athlon>
From: "Derek Ross" <dross@iders.ca>
To: <linux-mtd@lists.infradead.org>
References: <005701c1da70$1a0370f0$87657bc8@athlon>  <01f601c1d9ce$b9a1e5d0$87657bc8@athlon> <3371.1017706441@redhat.com>  <19030.1017794319@redhat.com>
Subject: Re: Are erase suspends possible? 
Date: Wed, 3 Apr 2002 09:35:14 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

> dross said:
> > "do_erase_oneblock_dont_wait", which doesn't wait for the erase to
> > finish, and returns immediately,
> dwmw2 replied:
> You should not be looking in there. You should be calling the mtd->read(),
> mtd->write() and mtd->erase() functions. The latter is already permitted to 
> return immediately, calling a caller-provided callback later on completion.

Is that callback capability available in userspace?
I'm looking in the file "util/erase.c" and it calls
an ioctl with an erase_info_t, which is a typedef of
erase_info_user, which doesn't have that callback
function pointer.

> The read function already suspends active erases to fulfil the read 
> request. You can easily make the write function do the same, on chips that 
> support it.

If I modified cfi_intelext_write_* to suspend erases in progress,
would that screw up the operation of the JFFS2? Or would I have
to supply a flag to turn that feature on and off depending
on if JFFS is running?

Thanks,
Derek Ross.
