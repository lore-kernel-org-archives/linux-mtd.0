Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14ZG2m-0006wk-00
	for mtd-list@infradead.org; Sat, 03 Mar 2001 17:42:12 +0000
From: "Florian Schirmer / TayTron" <schirmer@taytron.net>
To: <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
Subject: AW: Some bugs
Date: Sat, 3 Mar 2001 18:41:35 +0100
Message-ID: <BKEKLBIBFPNGJKJDEODFCEBMEIAA.schirmer@taytron.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.30.0103031611200.6520-100000@imladris.demon.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi!

>> 3. Write support is broken on ppc because of endianess problem
>>
>> cat bla.img > /dev/mtd/0
>> cat /dev/mtd/0 > bla2.img
>>
>> Results in a swapped file. I can only _guess_ where the problem is
exactly.
>> Reading is done via read_fromio() while writing is done by using writew()
>> calls. One of these funtions seem to swapp the bytes. Maybe it isnt
really a
>> mtd isse. Maybe it's my fault. I've read something in one of the include
>> files about the endianess issue but did not find the information again.

[...]

>That's not a generic solution. There should be no byteswapping of data
>anywhere. What map driver are you using? It sounds like it's byteswapping
>on write8(), which is wrong. Make it stop doing that and define
>CFI_HOST_ENDIAN or CFI_BIG_ENDIAN in include/linux/mtd/cfi_endian.h

physmap.c. It isn't doing any byteswapping. Thats the point. Yes this was
the include file i was looking for. But it doesnt solve the problem. Since
physmap ist unsing it at all changing the mode to big_endian breaks the
whole thing. The chips wont be detected since their bytes are flipped :)

So the problem must be either in the mtd cfi_cmd_set module (not swapping
while writing data) or somethere in the kernel stuff. Any ideas? This is the
only true problem at the moment i dont know a good workaround for.

>> 4. Erase size is wrong
>>
>That is very very strange. Either something is changing EraseRegionInfo[0]
>or cfi->interleave, despite being an integer datatype, contains 1/16.
>Can you print the contents of EraseRegionInfo[0] at both locations?

Okay found the problem: EraseRegionInfo[0] is equal at both positions. And
it's already in correct byteorder in BOTH positions. Swapping the order
again in cfi_cmd_set_0001 causes the trouble. This results in erase size
0x200 instead of 0x20000. So please remove it.

So please can you commit the 3 solved issues to cvs?

Thanks a lot
   Florian Schirmer



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
