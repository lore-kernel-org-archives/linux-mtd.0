Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXQ16-0005Au-Ps
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 12:23:02 +0000
From: Richard Weinberger <richard@nod.at>
To: zhangjun <openzhangj@gmail.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Christoph Hellwig <hch@lst.de>, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: Fwd: ubifs: fix page_count in ->ubifs_migrate_page()
Date: Thu, 13 Dec 2018 13:22:48 +0100
Message-ID: <7521140.D8HW8ZckG7@blindfold>
In-Reply-To: <c4f70535-63ba-4c4b-9e79-3ec48a406f52@gmail.com>
References: <1544624037-3436-1-git-send-email-openzhangj@gmail.com>
 <3016163.RH3ZIBrMym@blindfold>
 <c4f70535-63ba-4c4b-9e79-3ec48a406f52@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Donnerstag, 13. Dezember 2018, 13:10:19 CET schrieb zhangjun:
> On 2018/12/13 =E4=B8=8B=E5=8D=884:30, Richard Weinberger wrote:
> > Am Donnerstag, 13. Dezember 2018, 03:59:50 CET schrieb zhangjun:
> >> hello
> >>       I test several kernel version from your commit
> >> 4ac1c17b2044a1b4b2fbed74451947e905fc2992,
> >> there is a bug when migrateing,the following fix i test ok and require
> >> your confirmation.
> > Please keep the CC list intact and give us at least some time to review
> > your patch.
> > Also explain what kind of problem you're facing.
> > In other words, is this a theoretical fix or not?
> >
> > Thanks,
> > //richard
>=20
> This's my first time to patch upstream,thank you very much for your=20
> suggestion.
> My problem is my driver to call alloc_cma(),it fail.
> But i find that memory and cma maxchunk is enougth.
> So i building environmentto find what the reason is,test and verify my=20
> guess.
> i think it not just a theoretical fix but i actually tested it.

Why are you sending this mail now for the third time?

Thanks,
//richard
