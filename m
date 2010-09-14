Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OvK8u-0000N1-Ri
	for linux-mtd@lists.infradead.org; Tue, 14 Sep 2010 01:17:07 +0000
Received: by vws11 with SMTP id 11so5928125vws.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Sep 2010 18:17:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1284359140.27765.156.camel@localhost>
References: <70E876B0EA86DD4BAF101844BC814DFE0903E3E3DD@Cloud.RL.local>
	<1284359140.27765.156.camel@localhost>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Mon, 13 Sep 2010 21:16:39 -0400
Message-ID: <AANLkTim=Fi_-kwaHSpF1OXMVv79xugnigMK7=bzQmE=s@mail.gmail.com>
Subject: Re: linux equivalent of u-boot's "nand scrub" (erasing blocks even
	whenOOB says "bad")
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: Jon Povey <Jon.Povey@racelogic.co.uk>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 13, 2010 at 02:25, Artem Bityutskiy wrote:
> On Mon, 2010-09-13 at 06:54 +0100, Jon Povey wrote:
>> Mike Frysinger wrote:
>> > ive come across a situation where it would have been invaluable to
>> > have the ability to "scrub" the nand flash while running linux.
>>
>> I would find this useful too, or more specifically I recently wanted to rewrite the BBT in software from linux (to change OOB layout), but those blocks are marked off-limits. Some way to force it would be nice.
>>
>> I am just rambling though, no real useful suggestion :) Sorry..
>>
>> As for clearing blocks marked bad, how about MEMSETGOODBLOCK as the inverse of the existing MEMSETBADBLOCK?
>
> So may be we need a separate ioctl for dealing with bad eraseblocks
> which will also include abilities to re-write BBT?

i dont have any devices that have dedicated software BBTs.  i'm
concerned with just the forced erasing of blocks since the rest works
for me already (forced reading and writing).  the ability to change
the definition of the OOB is apparently "deprecated" now, so i cant
fix things on the fly there.
-mike
