Received: from co202.xi-lite.net ([149.6.83.202])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P2kpu-0001jy-1b
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2010 13:12:10 +0000
Message-ID: <4CA9D2A0.6010508@parrot.com>
Date: Mon, 4 Oct 2010 15:12:00 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Subject: Re: RE : UBI/UBIFS interrupted write page handling
References: <4C88DDD5.4060507@parrot.com>	 <1284054669.11335.21.camel@brekeke>
	<1285006478.1762.1.camel@brekeke>	 <4C9B7CD8.4070806@parrot.com>,
	<1285266914.1766.1.camel@brekeke>	
	<F5C24FC168F95048BB6B9E0B13EB33152BA6F5304E@DIAMANT.xi-lite.lan>	
	<1285523911.1776.9.camel@brekeke>
	<1285657088.2437.23.camel@localhost>	 <4CA19DAE.7030402@parrot.com>
	<1285660934.2437.44.camel@localhost>
In-Reply-To: <1285660934.2437.44.camel@localhost>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy a écrit :
> On Tue, 2010-09-28 at 09:47 +0200, Matthieu CASTET wrote:
>> Artem Bityutskiy a écrit :
>>> On Sun, 2010-09-26 at 20:58 +0300, Artem Bityutskiy wrote:
>>>
>> That's better : interrupt erased page are not put anymore in corrupted list.
>> But I have problem with interrupt write :
>> this night the test crashed [1].
> 
> Yeah, this should be fixed by forcing LEB refresh for the last LEBs of
> journal heads. This problem exists long time. I'll work on this and send
> you patches.
UBI will need also some patch.
For example in case of wear leveling, ubi could move a leb from a peb to 
another and the write can be interrupted.


> 
> We also have the outstanding gc_lnum problem - did you see it in new
> ubifs?
No, I find the cause of that. I was missing a patch in my backport tree.

Matthieu
