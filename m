Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DJFBu-0005Bt-3C
	for linux-mtd@lists.infradead.org; Wed, 06 Apr 2005 14:23:50 -0400
Message-ID: <42542926.9040209@nrl.navy.mil>
Date: Wed, 06 Apr 2005 14:23:34 -0400
From: Dan Brown <dan.brown@nrl.navy.mil>
MIME-Version: 1.0
To: Zeri Virgo <zerivirgo@infocell-its.com>
References: <4249C357.2040600@ieee.org>	<424C1C58.3000905@infocell-its.com>	<424C5F16.8010809@ieee.org>	<424CA4EA.8090904@infocell-its.com>	<424CAE31.8040302@ieee.org>	<425157C5.4040007@infocell-its.com>	<425181A7.2010809@ieee.org>	<42527DD5.4080009@infocell-its.com>	<4252EC5D.4090806@ieee.org>	<4253D280.6090308@infocell-its.com>	<4253D61C.6010109@infocell-its.com>	<4253E056.5050603@ieee.org>
	<4253F6C2.1080105@infocell-its.com> <42540E53.8080109@ieee.org>
In-Reply-To: <42540E53.8080109@ieee.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
	linux-mtd@lists.infradead.org
Subject: Re: [UPDATE] DOCBoot support for NFTL-based DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dan Brown wrote:
> Zeri Virgo wrote:
> 
>>   OOB Data: 36 7f eb 1f 3b aa ff ff ff ff ff ff ff ff ff ff
> 
> Sounds right, at first glance.  The OOB data actually follows each block 
> (perhaps that's just a terminology issue :) )

Ah, I see it!  That OOB data is actually wrong, it should be:

?? ?? ?? ?? ?? ?? 55 55 ff ff ff ff ff ff ff ff

Here's the whole sordid story:

1) The only reason DOCBoot has been working for *me* lately is because 
I've been lazy/stupid.

2) Specifically, although I've been updating my copies of the kernel 
code to keep pace with CVS changes, I have *failed* to update my 
mtd/utils subdirectory.

3) Thomas recently made a modification to nandwrite.  It forces all OOB 
bytes not designated as "free" to 0xff.  Perfectly sensible.

4) There is apparently a long-standing oddity in diskonchip.c, in which 
I set the number of ECC bytes to 6, and designate the last 8 bytes as 
"free" bytes.  This leaves two bytes (right after the ECC) unaccounted for.

5) DOCBoot puts magic numbers in those exact two OOB bytes.

6) As a result, recent versions of nandwrite will erase the information 
DOCBoot needs to identify kernel pages.  I've been blissfully unaware of 
this because I've been using an older version.

7) So, I've changed diskonchip.c to designate all of the last 10 bytes 
as "free".  It seems like the right thing to do, since only the first 6 
bytes are used by the hardware itself.  BUT ....

8) I have this nagging feeling there was a reason for 4).

9) I think this may break compatibility with any jffs2 filesystems 
written before the change, because the cleanmarker will be in the wrong 
place.  Hmm... maybe I should back out the change.  David? Thomas? Opinions?

10) AAAARRRGGGHHHH!!!!

	-Dan
