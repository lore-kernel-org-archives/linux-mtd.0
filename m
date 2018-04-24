Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fB3bt-0007BH-Ps
 for linux-mtd@lists.infradead.org; Tue, 24 Apr 2018 19:28:19 +0000
Date: Tue, 24 Apr 2018 13:28:03 -0600
From: Michal Hocko <mhocko@kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Steven Whitehouse <swhiteho@redhat.com>,
 Bob Peterson <rpeterso@redhat.com>,
 Trond Myklebust <trond.myklebust@primarydata.com>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Mikulas Patocka <mpatocka@redhat.com>,
 linux-mtd@lists.infradead.org, linux-ext4@vger.kernel.org,
 cluster-devel@redhat.com, linux-nfs@vger.kernel.org, linux-mm@kvack.org
Subject: Re: vmalloc with GFP_NOFS
Message-ID: <20180424192803.GT17484@dhcp22.suse.cz>
References: <20180424162712.GL17484@dhcp22.suse.cz>
 <3732370.1623zxSvNg@blindfold>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3732370.1623zxSvNg@blindfold>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue 24-04-18 21:03:43, Richard Weinberger wrote:
> Am Dienstag, 24. April 2018, 18:27:12 CEST schrieb Michal Hocko:
> > fs/ubifs/debug.c
> 
> This one is just for debugging.
> So, preallocating + locking would not hurt much.
> 
> > fs/ubifs/lprops.c
> 
> Ditto.
> 
> > fs/ubifs/lpt_commit.c
> 
> Here we use it also only in debugging mode and in one case for
> fatal error reporting.
> No hot paths.
> 
> > fs/ubifs/orphan.c
> 
> Also only for debugging.
> Getting rid of vmalloc with GFP_NOFS in UBIFS is no big problem.
> I can prepare a patch.

Cool!

Anyway, if UBIFS has some reclaim recursion critical sections in general
it would be really great to have them documented and that is where the
scope api is really handy. Just add the scope and document what is the
recursion issue. This will help people reading the code as well. Ideally
there shouldn't be any explicit GFP_NOFS in the code.

Thanks for a quick turnaround.

-- 
Michal Hocko
SUSE Labs
