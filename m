Received: from userp1040.oracle.com ([156.151.31.81])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U8epD-0007NG-OF
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2013 22:41:12 +0000
Date: Thu, 21 Feb 2013 14:40:44 -0800
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 6/6] ubifs: Wait for page writeback to provide stable pages
Message-ID: <20130221224044.GB4055@blackbox.djwong.org>
References: <20130119011231.20902.55954.stgit@blackbox.djwong.org>
 <20130119011316.20902.56721.stgit@blackbox.djwong.org>
 <20130123134312.b69c53cd.akpm@linux-foundation.org>
 <20130221034834.GA4055@blackbox.djwong.org>
 <20130221143243.099bef3c.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130221143243.099bef3c.akpm@linux-foundation.org>
Cc: lucho@ionkov.net, jack@suse.cz, neilb@suse.de, david@fromorbit.com,
 Adrian Hunter <adrian.hunter@intel.com>, adilger.kernel@dilger.ca,
 jlayton@samba.org, hch@infradead.org, gnehzuil.liu@gmail.com,
 bharrosh@panasas.com, linux-ext4@vger.kernel.org, ericvh@gmail.com,
 viro@zeniv.linux.org.uk, rminnich@sandia.gov, hirofumi@mail.parknet.co.jp,
 axboe@kernel.dk, tytso@mit.edu, martin.petersen@oracle.com,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 21, 2013 at 02:32:43PM -0800, Andrew Morton wrote:
> On Wed, 20 Feb 2013 19:48:34 -0800
> "Darrick J. Wong" <darrick.wong@oracle.com> wrote:
> 
> > > I grabbed the patches.  They should appear in linux-next tomorrow if I
> > > can get the current pooppile to build.
> > 
> > Well... these patches have been banging around in -next for a month or so now.
> > As far as I know there haven't been any complaints.  Can we push these for 3.9?
> 
> yup.  You can normally assume that this is the case, unless the patches have
> 
> a) been causing bugs or
> 
> b) been getting rude review comments or
> 
> c) been getting a great string of fix-fix-fix-fix patches in -mm or
> 
> d) acquired rude akpm comments or unresolved questions against them
>    in http://ozlabs.org/~akpm/mmots/series

I was simply making sure that I hadn't missed anything. :)
 
--D
> --
> To unsubscribe from this list: send the line "unsubscribe linux-fsdevel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
