Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SpnJc-0008Vb-BB
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2012 21:22:21 +0000
Received: by yenr9 with SMTP id r9so4401988yen.36
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2012 14:22:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACQ1gAjJbyymV=qfACE3Zh0nucO8R=W4vKVjC=_O-kj0P2HB=g@mail.gmail.com>
References: <CAN8TOE9RyUuRtEfyqBfxt0W3Cfg2_SD6Hp4rMS0S+MgKsPY9UQ@mail.gmail.com>
 <CACQ1gAjJbyymV=qfACE3Zh0nucO8R=W4vKVjC=_O-kj0P2HB=g@mail.gmail.com>
Date: Fri, 13 Jul 2012 14:22:17 -0700
Message-ID: <CAN8TOE-KCjTjCNmrCiHuvmaE4M3uAMVDwZ-3-_Z6H4n4Lz2ijQ@mail.gmail.com>
Subject: Re: MLC NAND: all 0xff after erase?
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
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

On Tue, Jul 10, 2012 at 11:41 PM, Richard Genoud
<richard.genoud@gmail.com> wrote:
> 2012/7/11 Brian Norris <computersforpeace@gmail.com>:
>> Hello all,
>>
>> I've seen some issues with MLC NAND and where I might erase a block,
>> read it back, and receive a few bitflips such that the data is not
>> entirely 0xff (i.e., a few bytes may be 0xfe, 0x7f, 0xf7, etc.).
>
> If you read the same block a few ms later, is the data the same or is
> it all 0xff or.. ?

Generally, the data is the same.

Brian
