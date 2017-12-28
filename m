Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eUV4a-0005Vt-72
 for linux-mtd@lists.infradead.org; Thu, 28 Dec 2017 10:06:34 +0000
From: Richard Weinberger <richard@nod.at>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: xxhash ?
Date: Thu, 28 Dec 2017 11:06:25 +0100
Message-ID: <2450093.pHMqlGidjZ@blindfold>
In-Reply-To: <1514454242.5843.4.camel@infinera.com>
References: <1514441615.4759.12.camel@infinera.com>
 <CAFLxGvyDWQCwUpGcn+9ZbSXKxfXpMBT5WpCjA5NZ1GR+ueSUVQ@mail.gmail.com>
 <1514454242.5843.4.camel@infinera.com>
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

Am Donnerstag, 28. Dezember 2017, 10:44:05 CET schrieb Joakim Tjernlund:
> On Thu, 2017-12-28 at 10:38 +0100, Richard Weinberger wrote:
> 
> > CAUTION: This email originated from outside of the organization. Do not
> > click links or open attachments unless you recognize the sender and know
> > the content is safe.
 
> > 
> > Joakim,
> > 
> > On Thu, Dec 28, 2017 at 7:13 AM, Joakim Tjernlund
> > <Joakim.Tjernlund@infinera.com> wrote:
> > 
> > > Now that xxhash is in the tree one could look at replacing
> > > crc32 in JFFS2/UBI. This would make checksumming much faster.
> > 
> > 
> > Since this will require a change of the on-disk format we have to be
> > very careful.
> > Do you have a use-case where crc32 is the bottle neck?
> 
> 
> Not directly, I remember the good old days when mounting took forever,
> mostly
 due to crc32. I then optimized crc32(the big tables you have today)
> and some other JFFS2 optimizations. Since crc32 is used everywhere in JFFS2
> I figure xxhash would help, especially on low end CPUs

Unless this gives a decent speedup I don't think we should add new features to 
JFFS2.
For UBI/UBIFS it is a different story. Did you also tests with UBI?

Thanks,
//richard
