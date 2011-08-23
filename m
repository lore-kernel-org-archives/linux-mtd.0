Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QvknC-0002vf-Os
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2011 06:48:59 +0000
Date: Tue, 23 Aug 2011 08:48:54 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [RFC 0/5] fix data+OOB writes, add ioctl
In-Reply-To: <1314015423.2644.118.camel@sauron>
Message-ID: <Pine.LNX.4.64.1108230843510.13510@lnxricardw.se.axis.com>
References: <1313625029-19546-1-git-send-email-computersforpeace@gmail.com>
	<1314007366.2644.101.camel@sauron> <20110822120417.GA13515@parrot.com>
	<1314015423.2644.118.camel@sauron>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
	"b35362@freescale.com" <b35362@freescale.com>,
	=?utf-8?B?UmljYXJkIFdhbmRlcmzDtmY=?= <ricardw@axis.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Ivan Djelic <ivan.djelic@parrot.com>,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 22 Aug 2011, Artem Bityutskiy wrote:

> On Mon, 2011-08-22 at 14:04 +0200, Ivan Djelic wrote:
>> On Mon, Aug 22, 2011 at 11:02:40AM +0100, Artem Bityutskiy wrote:
>>> Hi,
>>>
>>> On Wed, 2011-08-17 at 16:50 -0700, Brian Norris wrote:
>>>> First off, these fixes are motivated by a number of things:
>>>>
>>>> 1) Broken "noecc" writes; `nandwrite -n -o' does not work on my
>>>>    hardware, at least, without these patches
>>>
>>> I think Ivan complained about this at some point - he said he has image=
s
>>> with crafted ECC codes to test his BCH library, but he could not flash
>>> them properly. So yes, this is worth fixing.
>>
>> Actually it was Ricard Wanderlof, but indeed he was testing the BCH libr=
ary
>> (http://lists.infradead.org/pipermail/linux-mtd/2011-March/034516.html).
>> It would be nice if he could ack the fix ?

(Hi guys, just got back, been away for a while over the summer).

This particular issue was fixed in a patch by Peter Wippich on June 6th:

http://lists.infradead.org/pipermail/linux-mtd/2011-June/036016.html

(I subsequently tested the patch and found it to fix the problem:=20
http://lists.infradead.org/pipermail/linux-mtd/2011-June/036085.html).

I could test patch 1 of this set to see if it accomplishes the same thing,=
=20
but initially to me it seems that the issue has already been fixed, albeit=
=20
perhaps not pushed yet?

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
