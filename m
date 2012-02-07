Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RuoYI-0004P5-T8
 for linux-mtd@lists.infradead.org; Tue, 07 Feb 2012 17:09:59 +0000
Received: by wera10 with SMTP id a10so6691736wer.36
 for <linux-mtd@lists.infradead.org>; Tue, 07 Feb 2012 09:09:57 -0800 (PST)
Date: Tue, 7 Feb 2012 19:09:38 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Userspace write to UBI partitions
Message-ID: <20120207190938.7a59fae9@pixies.home.jungo.com>
In-Reply-To: <Pine.LNX.4.64.1202071733580.17234@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1202071616560.17234@lnxricardw.se.axis.com>
 <20120207182944.334b4665@pixies.home.jungo.com>
 <Pine.LNX.4.64.1202071733580.17234@lnxricardw.se.axis.com>
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

On Tue, 7 Feb 2012 17:36:25 +0100 (CET) Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:
> 
> On Tue, 7 Feb 2012, Shmulik Ladkani wrote:
> 
> > On Tue, 7 Feb 2012 16:20:58 +0100 (CET) Ricard Wanderlof <ricard.wanderlof@axis.com> wrote:
> >>
> >> Is it possible to do a userspace write to a UBI volume as if it were plain
> >> flash memory, i.e. should I be able to do "cat somefile > /dev/ubi0_0" ? I
> >> get a 'Write Error: Operation not permitted' when I do this (Linux 2.6.35)
> >> but I'm pretty sure that I've used UBI volumes that way in the past, may
> >> have been with older kernels then.
> >
> > Is your volume dynamic or static?
> 
> I tried both, but given the nature of the data we want to keep in the 
> volume it should really be dynamic.
> 
> > If dynamic, have you tried setting the UBI_VOL_PROP_DIRECT_WRITE
> > property by issuing a UBI_IOCSETVOLPROP volume ioctl?
> > (formerly named UBI_PROP_DIRECT_WRITE and UBI_IOCSETPROP)
> 
> Thanks for the pointer, I've never noticed this ioctl before.
> 
> I'll try this out. In the meantime, there doesn't seem to be an ioctl for 
> erasing blocks?
> 

Well, another option would be using Gluebi - (CONFIG_MTD_UBI_GLUEBI).
It exposes a "regular" mtd for every existing volume.

You'd be able to work using standard mtd interfaces on it (mtdchar
ioctls, e.g. MEMERASE, or even the mtdblock abstraction).

Regards,
Shmulik
