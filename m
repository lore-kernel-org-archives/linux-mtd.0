Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePHfu-0004U7-77
 for linux-mtd@lists.infradead.org; Thu, 14 Dec 2017 00:47:01 +0000
Date: Thu, 14 Dec 2017 01:44:28 +0100
From: David Sterba <dsterba@suse.cz>
To: Adam Borowski <kilobyte@angband.pl>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Jan Kara <jack@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Eric Van Hensbergen <ericvh@gmail.com>, Ron Minnich <rminnich@sandia.gov>,
 Latchesar Ionkov <lucho@ionkov.net>, v9fs-developer@lists.sourceforge.net,
 David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org,
 "Yan, Zheng" <zyan@redhat.com>, Sage Weil <sage@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org,
 Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, Dave Kleikamp <shaggy@kernel.org>,
 jfs-discussion@lists.sourceforge.net, reiserfs-devel@vger.kernel.org,
 "Darrick J. Wong" <darrick.wong@oracle.com>, linux-xfs@vger.kernel.org
Subject: Re: [PATCH] fs/*/Kconfig: drop links to 404-compliant
 http://acl.bestbits.at
Message-ID: <20171214004428.GF3553@twin.jikos.cz>
Reply-To: dsterba@suse.cz
References: <20171213053825.10903-1-kilobyte@angband.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171213053825.10903-1-kilobyte@angband.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 13, 2017 at 06:38:25AM +0100, Adam Borowski wrote:
> This link is replicated in most filesystems' config stanzas.  Referring
> to an archived version of that site is pointless as it mostly deals with
> patches; user documentation is available elsewhere.
> 
> Signed-off-by: Adam Borowski <kilobyte@angband.pl>
> ---

>  fs/btrfs/Kconfig                   |  3 ---

Acked-by: David Sterba <dsterba@suse.com>
