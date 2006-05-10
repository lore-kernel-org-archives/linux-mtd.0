Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fdmjw-0005QY-Sk
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 07:20:34 -0400
Message-ID: <4461CC8C.6010105@ru.mvista.com>
Date: Wed, 10 May 2006 15:20:44 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>
References: <4461B7CD.9010100@ru.mvista.com>
	<625fc13d0605100400t458ab59enbd36f70c90e10b2e@mail.gmail.com>
In-Reply-To: <625fc13d0605100400t458ab59enbd36f70c90e10b2e@mail.gmail.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: [RFC] read-only filesystem support for NAND flash devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer wrote:
>> As a filesystem is read-only, wear-out can't occur during the normal
>> use, only on root filesystem upgrade. Therefore writing it using a tool
>> like nandwrite that bypasses bad blocks seems to be enough, and the only
>> thing needed is either an in-MTD layer that makes a partition look as if
>> there's no babd blocks, or  similar means within a filesystem.
> Not quite the case.  You need bad block skipping, yes.  But NAND can
> get bit flips in good blocks still.  How do you deal with that?  You
> can't leave the block in that state forever because it will continue
> to get bit flips and then your data will be unusable.
Yep, I know about the issue. The recommended way to go here AFAIK is to 
mark the block as bad and copy its contents to a free one.
However, this will make mapping a lot more complicated so I'd like to go 
another way, i. e. erasing and rewriting this very block, and if it 
wears out, cache the data read from it and schedule moving the data 
forward within the partition in a background. Does that make sense?

Vitaly
