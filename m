Date: Wed, 16 Sep 2015 07:14:06 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Eric Van Hensbergen <ericvh@gmail.com>, Ron Minnich <rminnich@sandia.gov>,
 Latchesar Ionkov <lucho@ionkov.net>, v9fs-developer@lists.sourceforge.net
Subject: Re: [PATCH 3/5] 9p: Simplify the xattr handlers
Message-ID: <20150916141406.GA16005@infradead.org>
References: <1441367842-25079-1-git-send-email-agruenba@redhat.com>
 <1441367842-25079-4-git-send-email-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1441367842-25079-4-git-send-email-agruenba@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> +	const char *full_name = name - XATTR_SECURITY_PREFIX_LEN;

Please add something like an xattr_full_name() helper to xattr.h that
does this in one place and with proper documentation.

Otherwise looks fine.
