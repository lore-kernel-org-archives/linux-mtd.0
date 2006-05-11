Received: from ug-out-1314.google.com ([66.249.92.171])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FeGV1-0000F3-SX
	for linux-mtd@lists.infradead.org; Thu, 11 May 2006 15:07:03 -0400
Received: by ug-out-1314.google.com with SMTP id u40so197131ugc
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 May 2006 12:06:55 -0700 (PDT)
Message-ID: <f9d2a5e10605111206i4a5a425el17a28bb81989c6b6@mail.gmail.com>
Date: Thu, 11 May 2006 12:06:55 -0700
From: "Russ Dill" <russ.dill@gmail.com>
To: "Vitaly Wool" <vwool@ru.mvista.com>
In-Reply-To: <4461CC8C.6010105@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <4461B7CD.9010100@ru.mvista.com>
	<625fc13d0605100400t458ab59enbd36f70c90e10b2e@mail.gmail.com>
	<4461CC8C.6010105@ru.mvista.com>
Cc: Josh Boyer <jwboyer@gmail.com>,
	Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: [RFC] read-only filesystem support for NAND flash devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > Not quite the case.  You need bad block skipping, yes.  But NAND can
> > get bit flips in good blocks still.  How do you deal with that?  You
> > can't leave the block in that state forever because it will continue
> > to get bit flips and then your data will be unusable.
> Yep, I know about the issue. The recommended way to go here AFAIK is to
> mark the block as bad and copy its contents to a free one.
> However, this will make mapping a lot more complicated so I'd like to go
> another way, i. e. erasing and rewriting this very block, and if it
> wears out, cache the data read from it and schedule moving the data
> forward within the partition in a background. Does that make sense?

Then you'll run out of blocks. There are two seperate issues with NAND:

1) Bad blocks, NAND chips are shipped with a certain number of bad
blocks, during the chips life time, some of the other blocks will go
bad.

2) Reading from a sector degrades the data, but just a little tiny
bit. After several thousand reads, you may get a bit flip in your data
(which can be corrected by ECC). At this point, you do not have a bad
block, you just need to rewrite the data. You can't rewrite it to the
current block, because then a power loss would mean disaster. Also,
you can't mark the currently block as bad, because if you did, you
would decrease the usable life of your system (tons of good blocks
marked as bad)

So really,  for issue 2, you need some sort of free block list, so you
can reuse them. Which also means, you can expect the order of the
blocks on your filesystem to start to look more and more random as
time goes on. In other words, you also need some algorithm to find
which block is where.

Free block list? Bad block list? Tracking of block numbers? Sounds
like a full on FTL to me.
