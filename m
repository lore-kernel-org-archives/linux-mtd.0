Received: from [149.6.83.202] (helo=toronto.xi-lite.net)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hjwbe-0000Ke-9H
	for linux-mtd@lists.infradead.org; Fri, 04 May 2007 08:09:56 -0400
Message-ID: <463B21B7.5070303@parrot.com>
Date: Fri, 04 May 2007 14:06:15 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Stefan Roese <sr@denx.de>
Subject: Re: RO jffs2 implementation for bootloader
References: <loom.20070503T102421-36@post.gmane.org>
	<1178186163.7539.62.camel@sauron> <463B02F5.6060503@parrot.com>
	<200705041353.43372.sr@denx.de>
In-Reply-To: <200705041353.43372.sr@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: u-boot-users@lists.sourceforge.net, linux-mtd@lists.infradead.org,
	Dan Merillat <harik.attar@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Stefan,

Stefan Roese a écrit :
> Hi Matthieu,
> 
> On Friday 04 May 2007 11:55, Matthieu CASTET wrote:
>>> On Thu, 2007-05-03 at 08:40 +0000, Matthieu CASTET wrote:
>>>> I need to mount a jffs2 partition in a bootloader. I tried u-boot that
>>>> support jffs2, but it is very slow (2 minutes for mounting a 64MB
>>>> partition). Do you know if there are other (fast) implemenation of jffs2
>>>> suitable for a bootloader ?
>>> Not sure about any existing "fast" implementation, but mounting a JFFS2
>>> partition is about scanning whole partition. You may optimize some
>>> thing, but you have to scan anyway.
>> Well u-boot implementation is very slow. For 64MB partition : 2 minutes
>> for u-boot
> 
> This really is slow. 64MB isn't that big and shouldn't take that long to 
> mount.
> 
>> and 11 s for linux (3s with summary). 
> 
> So it can be done better.
> 
> Did you think about improving the performance in U-Boot? If so, please let's 
> move this discussion to the u-boot-users mailing list.

Somebody already try something for u-boot jffs2 [1], but is doesn't seem 
to work (don't compile).
He didn't receive any report, so u-boot jffs2 code seems unmaintained.

> 
> Thanks.
> 
> BTW: What cpu at what speed are you using?
an arm9 @240 Mhz.

Matthieu


[1] http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/25780/focus=25808
