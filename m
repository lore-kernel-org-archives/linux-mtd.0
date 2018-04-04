Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f3r0r-0006ib-Kv
 for linux-mtd@lists.infradead.org; Wed, 04 Apr 2018 22:36:19 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Frank Erdrich <frank@erdrich.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: UBIFS - ubifs_get_pnode.part.4: error -22 reading pnode
Date: Thu, 05 Apr 2018 00:36:01 +0200
Message-ID: <1874641.K4bY7NcptO@blindfold>
In-Reply-To: <fac82fd0-1c68-8ea7-d066-65c5901ff539@erdrich.net>
References: <95F51F4B902CAC40AF459205F6322F01B80E921AE3@BMK019S01.emtrion.local>
 <4391036.Fuyg1DPom3@blindfold>
 <fac82fd0-1c68-8ea7-d066-65c5901ff539@erdrich.net>
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

Frank,

Am Mittwoch, 4. April 2018, 06:58:40 CEST schrieb Frank Erdrich:
> > Can you reproduce the issue?
> > If so, please retry with the attached patches.
> > They will not fix your already broken UBIFS but they (hopefully) will
> > make sure that the accounting problem will not happen again.
> 
> That's the biggest problem. There is no way to reproduce it on a proper 
> way. The only thing I can do at the moment is to write to the partition 
> and do random power-cuts.
> 
> I will try the patches you have provided an will check if the error 
> comes up with them or not. Unluckily I'm out of office for today, so I 
> can start testing tomorrow.
> 
> > Can you also share me the broken UBIFS image?
> 
> I have to talk to our customer if that is ok for him, but I think that 
> will not be a big problem. Can you give me a command line to extract 
> that image from the flash in a way, that it is directly usable by you 
> without do conversion stuff?.

In this case I'm just interested in UBIFS itself.
So you can directly dd/cat from /dev/ubiX_Y.

Thanks,
//richard

-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
