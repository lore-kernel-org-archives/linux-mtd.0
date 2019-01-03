Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gf9nb-0003nH-Bi
 for linux-mtd@lists.infradead.org; Thu, 03 Jan 2019 20:41:04 +0000
From: Richard Weinberger <richard@nod.at>
To: Ron Bowes <ron@skullsecurity.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Having trouble with a UBI filesystem
Date: Thu, 03 Jan 2019 21:41:01 +0100
Message-ID: <11295148.y3O6aSSZPf@blindfold>
In-Reply-To: <CANNa7-WA3PQDQJr+OB1G1rf9rcRq50hH53_UXBwh8rEnFAv4oA@mail.gmail.com>
References: <CANNa7-XH1Qm8A5fzUM29pDsmLke4SP-+=PoJtumai8jv1nqFBg@mail.gmail.com>
 <7370989.dTfg6tCZom@blindfold>
 <CANNa7-WA3PQDQJr+OB1G1rf9rcRq50hH53_UXBwh8rEnFAv4oA@mail.gmail.com>
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

Ron,

Am Donnerstag, 3. Januar 2019, 21:35:46 CET schrieb Ron Bowes:
> I hadn't heard of nandsim, I'll take a look!
> 
> I was using -O for the VID header, but ubiattach was complaining about
> data_offset being unusual.

Yeah, I bet this was due to the simulated NOR chip. NOR does not have OOB.
 
> It's probably the OOB data, though, so nandsim may fix all my problems.

:-)

Thanks,
//richard
