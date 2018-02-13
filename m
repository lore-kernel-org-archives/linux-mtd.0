Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1elZu0-0004QJ-Cb
 for linux-mtd@lists.infradead.org; Tue, 13 Feb 2018 12:41:42 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: Timo Ketola <timo@exertus.fi>
Cc: linux-mtd@lists.infradead.org
Subject: Re: UBI assert failed in ubi_wl_init
Date: Tue, 13 Feb 2018 13:42:43 +0100
Message-ID: <63275670.WCUj5TjS3v@blindfold>
In-Reply-To: <b5eb17b7-14f1-7ec4-a590-d486dd0b89b6@exertus.fi>
References: <50443554-3f18-ce1b-70e7-a8092b39f5f5@exertus.fi>
 <2543021.LZhlqz2gkU@blindfold>
 <b5eb17b7-14f1-7ec4-a590-d486dd0b89b6@exertus.fi>
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

Timo,

Am Dienstag, 13. Februar 2018, 12:58:50 CET schrieb Timo Ketola:
> On 13.02.2018 00:49, Richard Weinberger wrote:
> > I meant the image _after_ UBI failed to place the fastmap. :)
> 
> Argh, sorry, shame on me.
> 
> https://drive.google.com/open?id=1t-auduKG2bwzpzZf09rV4O9F7GUN2viJ

This image contains no fastmap at all.
 
> https://drive.google.com/open?id=1ahKl8pf3svKQSvz6VQ-7xUQsyfkVuO7k
> 
> The first one is taken after the first boot and the second after the
> second boot.

This one a good fastmap (full scan comes to the same result).
The UBIFS seems good but contains no files/dirs.

So, this is not what you have described in your problem report.
Can you please double check?

Thanks,
//richard

-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
