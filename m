Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGPtO-00065m-Qm
 for linux-mtd@lists.infradead.org; Wed, 09 May 2018 14:16:33 +0000
Date: Wed, 9 May 2018 16:13:34 +0200
From: David Sterba <dsterba@suse.cz>
To: Michal Hocko <mhocko@kernel.org>
Cc: "Theodore Y. Ts'o" <tytso@mit.edu>, LKML <linux-kernel@vger.kernel.org>,
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
Message-ID: <20180509141333.onn7rbaitzspjmsa@twin.jikos.cz>
Reply-To: dsterba@suse.cz
References: <20180424162712.GL17484@dhcp22.suse.cz>
 <20180424183536.GF30619@thunk.org>
 <20180424192542.GS17484@dhcp22.suse.cz>
 <20180509134222.GU32366@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180509134222.GU32366@dhcp22.suse.cz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 09, 2018 at 03:42:22PM +0200, Michal Hocko wrote:
> On Tue 24-04-18 13:25:42, Michal Hocko wrote:
> [...]
> > > As a suggestion, could you take
> > > documentation about how to convert to the memalloc_nofs_{save,restore}
> > > scope api (which I think you've written about e-mails at length
> > > before), and put that into a file in Documentation/core-api?
> > 
> > I can.
> 
> Does something like the below sound reasonable/helpful?

Sounds good to me and matches how we've been using the vmalloc/nofs so
far.
