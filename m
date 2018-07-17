Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffPQE-0007Gu-TE
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 12:49:44 +0000
Date: Tue, 17 Jul 2018 14:49:30 +0200
From: Michal Hocko <mhocko@kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
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
Message-ID: <20180717124930.GB30926@dhcp22.suse.cz>
References: <20180424162712.GL17484@dhcp22.suse.cz>
 <20180424183536.GF30619@thunk.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180424183536.GF30619@thunk.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue 24-04-18 14:35:36, Theodore Ts'o wrote:
> On Tue, Apr 24, 2018 at 10:27:12AM -0600, Michal Hocko wrote:
> > fs/ext4/xattr.c
> > 
> > What to do about this? Well, there are two things. Firstly, it would be
> > really great to double check whether the GFP_NOFS is really needed. I
> > cannot judge that because I am not familiar with the code.
> 
> *Most* of the time it's not needed, but there are times when it is.
> We could be more smart about sending down GFP_NOFS only when it is
> needed.  If we are sending too many GFP_NOFS's allocations such that
> it's causing heartburn, we could fix this.  (xattr commands are rare
> enough that I dind't think it was worth it to modulate the GFP flags
> for this particular case, but we could make it be smarter if it would
> help.)

There still seem to be ext4_kvmalloc(NOFS) callers in the ext4 code. Do
you have any plans to get rid of those?
-- 
Michal Hocko
SUSE Labs
