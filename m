Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eMgl2-0006zJ-QY
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 20:57:34 +0000
From: Richard Weinberger <richard@nod.at>
To: Manfred Spraul <manfred@colorfullife.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, linux-mtd@lists.infradead.org,
 boris.brezillon@free-electrons.com, david.oberhollenzer@sigma-star.at
Subject: Re: [PATCH 0/5] Add flight recorder to MTDRAM
Date: Wed, 06 Dec 2017 21:57:41 +0100
Message-ID: <1586330.7x2FQLeB9A@blindfold>
In-Reply-To: <1944158.Wp3g4lm68D@blindfold>
References: <20171206085039.27164-1-dirk.behme@de.bosch.com>
 <8663ba73-5159-d1ac-5a3b-6d158dcf9923@colorfullife.com>
 <1944158.Wp3g4lm68D@blindfold>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Manfred,

Am Mittwoch, 6. Dezember 2017, 20:59:43 CET schrieb Richard Weinberger:
> > I have uploaded the initial image, the final image and the flight
> > recording.
> > 
> > https://sourceforge.net/projects/calculix-rpm/files/ubifs/xattr/
> 
> Cool! I'll give it a try.

Hmm, I did:
./replay -e 131072 -w 2048 dump-before.bin record.bin 168167
 
This applies 168167 to dump-before.bin, right?
So I expect dump-before.bin to match the sha1sum of image-168167.bin.
But it doesn't.

Thanks,
//richard
