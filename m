Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cZeBt-00036Z-2Q
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2017 13:46:19 +0000
Date: Fri, 3 Feb 2017 14:45:47 +0100
From: Jan Kara <jack@suse.cz>
To: Richard Weinberger <richard@nod.at>
Cc: Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, linux-block@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 22/24] ubifs: Convert to separately allocated bdi
Message-ID: <20170203134547.GA5844@quack2.suse.cz>
References: <20170202173422.3240-1-jack@suse.cz>
 <20170202173422.3240-23-jack@suse.cz>
 <26c70615-f98c-23a6-abb7-de675fb658b6@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26c70615-f98c-23a6-abb7-de675fb658b6@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu 02-02-17 21:34:32, Richard Weinberger wrote:
> Jan,
> 
> Am 02.02.2017 um 18:34 schrieb Jan Kara:
> > Allocate struct backing_dev_info separately instead of embedding it
> > inside the superblock. This unifies handling of bdi among users.
> > 
> > CC: Richard Weinberger <richard@nod.at>
> > CC: Artem Bityutskiy <dedekind1@gmail.com>
> > CC: Adrian Hunter <adrian.hunter@intel.com>
> > CC: linux-mtd@lists.infradead.org
> > Signed-off-by: Jan Kara <jack@suse.cz>
> 
> Is this series available at some git tree, please?

I've pushed it out to:

git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git bdi

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
