Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 142AZu-0005ui-00
	for mtd-list@infradead.org; Sat, 02 Dec 2000 11:11:38 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 142AZo-0005uc-00
	for mtd@infradead.org; Sat, 02 Dec 2000 11:11:37 +0000
Date: Sat, 2 Dec 2000 11:10:14 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Ollie Lho <ollie@sis.com.tw>
cc: <mtd@infradead.org>,  <linuxbios@lanl.gov>
Subject: Re: DiskOnChip 2000/Millennium driver merge.
In-Reply-To: <3A28531C.4F5C8E14@sis.com.tw>
Message-ID: <Pine.LNX.4.30.0012021050140.22169-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sat, 2 Dec 2000, Ollie Lho wrote:

> David,
> 	I just tried the updated CVS version. The Millennium part of
> doc2000.c works for some extend. It has some bugs which will offset/lost
> 1 or 2 bytes at begin/end of each 512byte page. It is a common problem if
> you are not programming the chip fully comply to M-Systems Spec (actually
> you have to do some "undocumented" tricks too). I will review the new code
> next week possiblly after you get the SiS 630 LinuxBIOS demo/devel platform.

Thanks. I'll go through the driver and look for the remaining differences.
Were these changes made in doc2001.c since the Millennium support was
merged into doc2000.c, or did they get lost in the merge? If the former,
do you remember the entry in the CVS log that I should be looking for?

I note you changed DoC_Command() so it no longer finishes with
DoC_WaitReady(). Is there a situation in which DoC_Command shouldn't wait
for FR_B after sending the command? Does it do any harm to do so, or is
the removal just an optimisation?

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
