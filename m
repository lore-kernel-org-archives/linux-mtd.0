Received: from fgwmail9.fujitsu.co.jp ([192.51.44.39])
	by casper.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LVOzp-00038R-LI
	for linux-mtd@lists.infradead.org; Fri, 06 Feb 2009 11:35:48 +0000
Received: from fgwmail6.fujitsu.co.jp (fgwmail6.fujitsu.co.jp [192.51.44.36])
	by fgwmail9.fujitsu.co.jp (Fujitsu Gateway) with ESMTP id
	n16B6Jpw001905 for <linux-mtd@lists.infradead.org> (envelope-from
	iram.shahzad@jp.fujitsu.com); Fri, 6 Feb 2009 20:06:19 +0900
Received: from m2.gw.fujitsu.co.jp ([10.0.50.72])
	by fgwmail6.fujitsu.co.jp (Fujitsu Gateway) with ESMTP id
	n16B5Prt026217 for <linux-mtd@lists.infradead.org> (envelope-from
	iram.shahzad@jp.fujitsu.com); Fri, 6 Feb 2009 20:05:26 +0900
Received: from smail (m2 [127.0.0.1])
	by outgoing.m2.gw.fujitsu.co.jp (Postfix) with ESMTP id 7E23D45DE55
	for <linux-mtd@lists.infradead.org>;
	Fri,  6 Feb 2009 20:05:25 +0900 (JST)
Received: from s2.gw.fujitsu.co.jp (s2.gw.fujitsu.co.jp [10.0.50.92])
	by m2.gw.fujitsu.co.jp (Postfix) with ESMTP id 4748445DE51
	for <linux-mtd@lists.infradead.org>;
	Fri,  6 Feb 2009 20:05:25 +0900 (JST)
Received: from s2.gw.fujitsu.co.jp (localhost.localdomain [127.0.0.1])
	by s2.gw.fujitsu.co.jp (Postfix) with ESMTP id 21047E38004
	for <linux-mtd@lists.infradead.org>;
	Fri,  6 Feb 2009 20:05:25 +0900 (JST)
Received: from m106.s.css.fujitsu.com (m106.s.css.fujitsu.com [10.249.87.106])
	by s2.gw.fujitsu.co.jp (Postfix) with ESMTP id CD64A1DB803B
	for <linux-mtd@lists.infradead.org>;
	Fri,  6 Feb 2009 20:05:24 +0900 (JST)
Message-ID: <D7819ED4DC5A46FDB0E7557B1ABBE32A@sky>
From: "Iram Shahzad" <iram.shahzad@jp.fujitsu.com>
To: "Ricard Wanderlof" <ricard.wanderlof@axis.com>
References: <4C336FC8FE0F441DA6FAB8337E58BB54@sky>
	<Pine.LNX.4.64.0902061056160.19761@lnxricardw.se.axis.com>
Subject: Re: cannot access NAND STL partition
Date: Fri, 6 Feb 2009 20:07:07 +0900
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=response
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I assume BML = Block Management Layer and STL = Sector Transition Layer?
> From an MTD and JFFS2 point of view the terminology sounds slightly odd, 
> exactly what type of file system are you using and exactly what type of 
> BML and STL are you referring to?

To simplify the problem, I have kept filesystem out of the discussion.
I am talking about raw read/write. In other words, I am reading the
NAND in the following two ways and then checking whether the read
data is expected data or not:

   From u-boot:
      onenand read 0x50000000 0x0c500000 0x20000

   From Linux:
     hexdump -C /dev/mtdblock0

Both ways I see the same data.

If I write the flash from u-boot or Linux using "onenand write", "dd" etc,
I can read the expected data in the above ways.

The problem starts when I write the flash with the flash writer.
The flash writer can write either in BML or STL details of which
I don't know. I guess the words refer to Block Management Layer and
Sector Translation Layer.

I also guess that when writing in BML, it writes raw data, so when read
from u-boot/Linux, the data is as expected; but when writing in STL,
it does some kind of translation for wear leveling etc. So I thought if
there is a similar kind of translation layer in Linux, then I can put it
on top of the raw Linux onenand driver to get the expected result.

Many thanks for the reply.

Best regards
Iram
