Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Soqcp-0001t9-J3
 for linux-mtd@lists.infradead.org; Wed, 11 Jul 2012 06:42:16 +0000
Received: by weyr3 with SMTP id r3so597026wey.36
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jul 2012 23:42:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE9RyUuRtEfyqBfxt0W3Cfg2_SD6Hp4rMS0S+MgKsPY9UQ@mail.gmail.com>
References: <CAN8TOE9RyUuRtEfyqBfxt0W3Cfg2_SD6Hp4rMS0S+MgKsPY9UQ@mail.gmail.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 11 Jul 2012 08:41:52 +0200
Message-ID: <CACQ1gAjJbyymV=qfACE3Zh0nucO8R=W4vKVjC=_O-kj0P2HB=g@mail.gmail.com>
Subject: Re: MLC NAND: all 0xff after erase?
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Mike Dunn <mikedunn@newsguy.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, Kevin Cernekee <cernekee@gmail.com>,
 Jim Quinlan <jim2101024@gmail.com>, linux-mtd@lists.infradead.org,
 Al Viro <viro@zeniv.linux.org.uk>, Joel Reardon <reardonj@inf.ethz.ch>,
 David Woodhouse <dwmw2@infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/7/11 Brian Norris <computersforpeace@gmail.com>:
> Hello all,
>
> I've seen some issues with MLC NAND and where I might erase a block,
> read it back, and receive a few bitflips such that the data is not
> entirely 0xff (i.e., a few bytes may be 0xfe, 0x7f, 0xf7, etc.).
If you read the same block a few ms later, is the data the same or is
it all 0xff or.. ?

> [2] Counterexample: it seems NAND_ECC_SOFT actually corrects a single
> bitflip in 0xff data. Tested with nandsim and `nandwrite -n -o`.
If I recall correctly, is because the soft ECC of an FF page is
FFFFF.. and most (maybe all) hard ECC of FF page are not.


Richard.

-- 
for me, ck means con kolivas and not calvin klein... does it mean I'm a geek ?
