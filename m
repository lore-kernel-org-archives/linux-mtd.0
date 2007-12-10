Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J1ooE-0003jH-7E
	for linux-mtd@lists.infradead.org; Mon, 10 Dec 2007 20:01:04 +0000
Date: Mon, 10 Dec 2007 21:00:25 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: [PATCH][MTD-UTILS] Set mkfs.jffs2 page size runtime instead of
	fixed.
In-Reply-To: <20071207070354.02e020b2@weaponx>
Message-ID: <Pine.LNX.4.64.0712102056050.1975@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0712061232550.28640@lnxricardw.se.axis.com>
	<20071207070354.02e020b2@weaponx>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 7 Dec 2007, Josh Boyer wrote:

>> This patch reads the default PAGE_SIZE from sysconf(), i.e. the system
>> mkfs.jffs2 is running on, instead of just setting it to 4096 (which of
>> course is valid for most systems but not all).
>
> This makes sense overall.  I'd like to do it a slightly different way
> though.

I'm open to suggestions. Care to elaborate on that?

> Could we add an additional check here to see if page_size !=3D 4096, and
> print a loud warning with the page size that is actually being used and
> suggest the --pagesize option if that isn't what is desired?
>
> It's not that we have tons of systems using a page size different than
> 4KiB, but it's a change in behavior for those that do and I'd like to
> at least warn users about it.  Otherwise the patch looks fine.

I guess you are considering the case of making a file system on a host=20
with a page size of !=3D 4096 for a target system with 4096 byte pages. Goo=
d=20
point, I hadn't thought of that.

I was very much into the 'my host is x86 and my target is something else'=
=20
train of though; in this case it wouldn't be much of a problem, as the=20
user would be supplying a --pagesize anyway to get the correct page size=20
for the target.

I'll get back with a new patch as soon as possible.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
