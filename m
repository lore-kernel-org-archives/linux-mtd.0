Subject: Re: [PATCH] NAND hardware ECC controller on at91sam9263 / at91sam9260
From: David Woodhouse <dwmw2@infradead.org>
To: Richard Genoud <richard.genoud@gmail.com>
In-Reply-To: <80b317760804230431w46f4f6a2wd761a2949dc3b27c@mail.gmail.com>
References: <47BABA0C.8070500@gmail.com>
	<1208889653.9212.641.camel@pmac.infradead.org>
	<80b317760804230237n188bd989oc28a5ed60e615d88@mail.gmail.com>
	<1208946137.9212.778.camel@pmac.infradead.org>
	<80b317760804230431w46f4f6a2wd761a2949dc3b27c@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 23 Apr 2008 16:29:16 +0100
Message-Id: <1208964556.9212.809.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Brownell <david-b@pacbell.net>, linux-mtd@lists.infradead.org,
	Haavard Skinnemoen <hskinnemoen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-04-23 at 13:31 +0200, Richard Genoud wrote:
> > Hm, that's true. There seem to have been changes since 2.6.25 which
> >  cause the conflicts. Please could you make it apply to the current git
> >  tree?
> >
> >  Thanks.
> 
> I'm firewalled for the moment (I can't use git), I'll try to do this at home.

Try http://git.infradead.org/mtd-2.6.git?a=snapshot;h=HEAD;sf=tgz or
http://git.infradead.org/mtd-2.6.git?a=commitdiff_plain;h=HEAD;hp=linus

-- 
dwmw2
