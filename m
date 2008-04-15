Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JlnKQ-00053Y-3G
	for linux-mtd@lists.infradead.org; Tue, 15 Apr 2008 15:44:14 +0000
Subject: Re: Is there possible to integrate mtd ubi ubifs latest version in
	one git tree?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20080415152104.GA8513@shareable.org>
References: <bae050c10804102348sceaef1bh557ecce22a96b03f@mail.gmail.com>
	<1207994233.5965.124.camel@sauron> <1207995042.5965.136.camel@sauron>
	<bae050c10804132146t284e9a3pd3952c30a7e892c7@mail.gmail.com>
	<1208163958.5965.158.camel@sauron>
	<20080415114135.GA3556@shareable.org>
	<1208259858.5965.220.camel@sauron>
	<20080415152104.GA8513@shareable.org>
Content-Type: text/plain; charset=utf-8
Date: Tue, 15 Apr 2008 18:41:17 +0300
Message-Id: <1208274077.5965.246.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Nancy <nancydreaming@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

n Tue, 2008-04-15 at 16:21 +0100, Jamie Lokier wrote:
> It would be good if the erase-counters (and indeed metadata needed for
> fast mounting) were also records in the log/trees held in other
> blocks, but I guess you'd need to closely couple with the filesystems
> logging.  And that would be a layer violation, tricky and ugly in the
> UBI API.

Yeah, that would be nice. Well, if one really wants it is possible to
teach UBI to save erase-counter somewhere else before erasing. Should
not be difficult. UBI has general mechanism of so-called "internal
volumes" which may be added and used for that purposes. But it does not
sound worth the trouble for me :-)

But fast mounting is a separate area which would need full re-design and
many additional complications. As I said before, we are planning to at
lease create a short document about the possible UBI2 design.

The strength of current UBI is its relative simplicity, thus robustness.
It does not have any on-flash trees. UBIFS does - and the complexity is
an order of magnitude higher then UBI's complexity :-)

Imagine you would store some kind of logs and trees on the flash in UBI.
You would refer physical eraseblock from these trees by numbers, surely?
Think about difficulties introduced by randomly distributed bad
eraseblocks. With current UBI, one can prepare an image and send it to
factory, where it will be flashed to all devices. The same image,
irrespectively on how bad blocks are distributed. Simple. But in case
UBI2 (imaginable) which would have some trees, where a tree could refer,
say, an eraseblock 1006, things would have been much more difficult.
This eraseblock 1006 could be a bad block for example. This is only one
example.

But that stuff is doable I believe, although trickier that current UBI.
And we hope, once UBI/UBIFS gets stabilized and used, we or someone else
may do the tricks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
