Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Runva-0008Tm-Us
 for linux-mtd@lists.infradead.org; Tue, 07 Feb 2012 16:29:59 +0000
Received: by wera10 with SMTP id a10so6650261wer.36
 for <linux-mtd@lists.infradead.org>; Tue, 07 Feb 2012 08:29:56 -0800 (PST)
Date: Tue, 7 Feb 2012 18:29:44 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Userspace write to UBI partitions
Message-ID: <20120207182944.334b4665@pixies.home.jungo.com>
In-Reply-To: <Pine.LNX.4.64.1202071616560.17234@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1202071616560.17234@lnxricardw.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 7 Feb 2012 16:20:58 +0100 (CET) Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:
> 
> Is it possible to do a userspace write to a UBI volume as if it were plain 
> flash memory, i.e. should I be able to do "cat somefile > /dev/ubi0_0" ? I 
> get a 'Write Error: Operation not permitted' when I do this (Linux 2.6.35) 
> but I'm pretty sure that I've used UBI volumes that way in the past, may 
> have been with older kernels then.

Is your volume dynamic or static?

If dynamic, have you tried setting the UBI_VOL_PROP_DIRECT_WRITE
property by issuing a UBI_IOCSETVOLPROP volume ioctl?
(formerly named UBI_PROP_DIRECT_WRITE and UBI_IOCSETPROP)

Regards,
Shmulik
