Received: from smtp.hotbox.ru ([80.68.244.50])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19XnwN-00040e-V1
	for <linux-mtd@lists.infradead.org>; Wed, 02 Jul 2003 21:10:56 +0100
Message-ID: <002201c340d6$0180c0a0$1a00a8c0@itc.intrinsyc.com>
From: "Alex Samoutin" <samoutin@hotbox.ru>
To: "Jasmine Strong" <jasmine@regolith.co.uk>
References: <092C59AE-ACB6-11D7-81FB-000393AD6294@regolith.co.uk>
Date: Wed, 2 Jul 2003 13:10:30 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Fw: corrupt my NAND flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>




>On Wednesday, Jul 2, 2003, at 18:43 Europe/London, Alex Samoutin wrote:
>> Sorry for big delay with answer – I had no hardware to test. Now I got
>> my
>> CerfCube 405ep back and can play with it.
>>
>> - NAND chip Toshiba TC58256AFT
>

>The timings for the 405 EBIU bus do not match the required timings for
>the Toshiba chip's read cycle.

Why not? For any CS line you can configure timings as you want. Could you
explain what exatly dosn't much the Toshiba chip's read cycle.?

>We ended up putting the !RE pin onto a GPIO, but this caused (huge)
>problems with interrupts and so forth.

Sorry But I don't undestand it.  You can just disable interrupts for this
line.

Alex Samoutin
Intrinsyc Software
