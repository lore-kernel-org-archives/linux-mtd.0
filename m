Received: from host-216-252-217-242.interpacket.net ([216.252.217.242]
	helo=forof.hylink.am)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CetNu-0000L1-1N
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2004 06:01:28 -0500
Message-ID: <002401c4e35e$6d926c40$1000000a@araav>
From: "Ara Avanesyan" <araav@hylink.am>
To: "David Woodhouse" <dwmw2@infradead.org>
References: <redirect-100966814@mail5.rambler.ru>
	<003e01c4e274$73696ff0$1000000a@araav>
	<1103104997.13016.99.camel@hades.cambridge.redhat.com>
	<004901c4e28e$a341fa20$1000000a@araav>
	<1103106287.13016.110.camel@hades.cambridge.redhat.com>
Date: Thu, 16 Dec 2004 15:00:15 +0400
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="koi8-r"; reply-type=original
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: supporting DiskOnChip G3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ohh, actually I'm noob in the low level world but in any case I have to do 
this porting. accidentally, is there any good book/material that explains 
the mtd structure etc so i won't loose too much time exploring the source 
code blindly... actually i'm doing it for two days already:)

hey, thanks for a great answer!
Ara

----- Original Message ----- 
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Ara Avanesyan" <araav@hylink.am>
Cc: <linux-mtd@lists.infradead.org>
Sent: Wednesday, December 15, 2004 2:24 PM
Subject: Re: supporting DiskOnChip G3


> On Wed, 2004-12-15 at 14:12 +0400, Ara Avanesyan wrote:
>> David,
>>
>> thanks for the answer.
>> the documentation is the easiest part;)
>> http://www.m-systems.com/files/documentation/doc/DOC_G3_512Mb_1Gb_Rev2.0.pdf
>
> Oh, that's interesting. They always used to be very cagey about their
> documentation. I'm glad to see they're making progress -- at first
> glance it looks like we ought to be able to support the device with that
> information.
>
> That would be enough for using YAFFS or JFFS2 on it; if the translation
> layer isn't INFTL (as I suspect it isn't) then we'd also need docs on
> the new translation layer too, if we want to use it in DOS-compatible
> mode.
>
>> so now you have the doc, means you have plans to support it?:)
>
> Yeah -- given some sample hardware and a few spare weeks of spare time,
> I'd be happy to play :)
>
> It shouldn't be _that_ hard to make a driver for it which uses the core
> NAND code. See the existing drivers/mtd/nand/diskonchip.c for
> inspiration and turn up on #mtd of irc.freenode.net. If you're willing
> and capable then we can help you do it -- but if it turns out to be as
> much work to talk you through it as it would be to do it ourselves, then
> it's not going to work too well :)
>
> -- 
> dwmw2
>
> 
