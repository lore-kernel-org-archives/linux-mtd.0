Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fB6HE-0002Zg-1N
 for linux-mtd@lists.infradead.org; Tue, 24 Apr 2018 22:19:09 +0000
From: Richard Weinberger <richard@nod.at>
To: Michal Hocko <mhocko@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Theodore Ts'o <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Steven Whitehouse <swhiteho@redhat.com>, Bob Peterson <rpeterso@redhat.com>,
 Trond Myklebust <trond.myklebust@primarydata.com>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Mikulas Patocka <mpatocka@redhat.com>, linux-mtd@lists.infradead.org,
 linux-ext4@vger.kernel.org, cluster-devel@redhat.com,
 linux-nfs@vger.kernel.org, linux-mm@kvack.org
Subject: Re: vmalloc with GFP_NOFS
Date: Wed, 25 Apr 2018 00:18:40 +0200
Message-ID: <3894056.cxOY6eVYVp@blindfold>
In-Reply-To: <20180424192803.GT17484@dhcp22.suse.cz>
References: <20180424162712.GL17484@dhcp22.suse.cz>
 <3732370.1623zxSvNg@blindfold> <20180424192803.GT17484@dhcp22.suse.cz>
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

Am Dienstag, 24. April 2018, 21:28:03 CEST schrieb Michal Hocko:
> > Also only for debugging.
> > Getting rid of vmalloc with GFP_NOFS in UBIFS is no big problem.
> > I can prepare a patch.
> 
> Cool!
> 
> Anyway, if UBIFS has some reclaim recursion critical sections in general
> it would be really great to have them documented and that is where the
> scope api is really handy. Just add the scope and document what is the
> recursion issue. This will help people reading the code as well. Ideally
> there shouldn't be any explicit GFP_NOFS in the code.

So in a perfect world a filesystem calls memalloc_nofs_save/restore and
always uses GFP_KERNEL for kmalloc/vmalloc?

Thanks,
//richard
