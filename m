Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f7cft-0006w9-2x
 for linux-mtd@lists.infradead.org; Sun, 15 Apr 2018 08:06:14 +0000
From: Richard Weinberger <richard@nod.at>
To: Matthew Wilcox <willy@infradead.org>
Cc: Souptick Joarder <jrdr.linux@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] fs: ubifs: Adding new return type vm_fault_t
Date: Sun, 15 Apr 2018 10:05:59 +0200
Message-ID: <3280744.7pfdJTsLab@blindfold>
In-Reply-To: <20180415012400.GD15294@bombadil.infradead.org>
References: <20180414201859.GA20327@jordon-HP-15-Notebook-PC>
 <CAFqt6zYcgj0HQ3Z+xyEstkMCdQ6gnLZ616FiypvM_cys1Fk9vw@mail.gmail.com>
 <20180415012400.GD15294@bombadil.infradead.org>
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

Am Sonntag, 15. April 2018, 03:24:00 CEST schrieb Matthew Wilcox:
> On Sun, Apr 15, 2018 at 02:17:46AM +0530, Souptick Joarder wrote:
> > On Sun, Apr 15, 2018 at 2:00 AM, Richard Weinberger <richard@nod.at> wrote:
> > > What is the target tree to carry this?
> > 
> > Target tree I am not sure.
> > We have plan to push it in 4.17 release.
> > I think Matthew is the right person to get this info.
> 
> Please merge it through your tree for 4.18.  Or earlier if you want.

Ok. Queued for 4.18.

Thanks,
//richard
