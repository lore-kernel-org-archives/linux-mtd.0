Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VA2FR-0005lI-TR
 for linux-mtd@lists.infradead.org; Thu, 15 Aug 2013 18:26:14 +0000
Received: from DeadDuck (unknown [172.20.177.82])
 by nsa.nbspaymentsolutions.com (Postfix) with ESMTP id 2E7E53FC47F
 for <linux-mtd@lists.infradead.org>; Thu, 15 Aug 2013 14:27:40 -0400 (EDT)
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: linux-mtd@lists.infradead.org
Subject: Re: Fail to mount cloned disk image with fastmap.
References: <87a9kjt73h.fsf@nbsps.com>
Date: Thu, 15 Aug 2013 14:23:26 -0400
In-Reply-To: <87a9kjt73h.fsf@nbsps.com> (Bill Pringlemeir's message of "Thu,
 15 Aug 2013 09:29:54 -0400")
Message-ID: <87pptesti9.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15 Aug 2013, bpringlemeir@nbsps.com wrote:

> I have back-ported the fastmap code from the 3.0 series to a 2.6.36
> kernel on an ARM cpu.  It has been running for some time without issue
> and the boot time is reduced by 1/2 second.  I just ran a test over
> night with 'pppd' capturing packets and likely filled up the disk.
>
> It appears that my kernel does not boot, so I made a clone of the disk
> and then attempt to mount it on my Ubuntu machine,

[snip]

> The 'modprobe' of the UBI fails with the 3.8 Ubuntu kernel.  Should I
> re-compile without MTD_UBI_FASTMAP to see if I can mount the file
> system?  I would like to be able to look at the file system, even in
> read-only mode.  The kernel logs are below from the 'ubi' modprobe.
> Is there actually an issue here with UBI? But I think that some of the
> UBI issues might be a problem?  Can I use some other flash with a
> bigger size so that 'PEBs' can be reserved?

I remounted the Ubuntu machine with nandsim and only used a single
partition.  This gets rid of the 'print_rsvd_warning'.  However, the
image still can not be mounted on the PC with ubifs (UBI has fast map).

I recompiled my Linux 2.6.36 without Linux and used a 'nandwrite' and
'tftp' from an initramfs to reproduce the image on another device.  The
2.6.36 patched kernel mount it after correcting some errors.  However,
as the 'bad blocks' are different between devices, I may have missed
some data and this made it work.

Fwiw,
Bill Pringlemeir.
