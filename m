Date: Tue, 23 May 2017 01:39:32 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, david@sigma-star.at, dedekind1@gmail.com,
 adrian.hunter@intel.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, adilger.kernel@dilger.ca,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org,
 bfields@redhat.com, marcus.folkesson@gmail.com, hyc.lee@gmail.com,
 rockdotlee@gmail.com, leon.pollak@gmail.com
Subject: Re: [PATCH 5/6] ubifs: Implement export_operations
Message-ID: <20170523083932.GC4107@infradead.org>
References: <1495398051-4604-1-git-send-email-richard@nod.at>
 <1495398051-4604-6-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1495398051-4604-6-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> +static struct inode *ubifs_nfs_get_inode(struct super_block *sb, uint64_t ino,
> +					 uint32_t generation)
> +{
> +	return ubifs_iget(sb, ino);
> +}

You need to maintain and check an inode generation counter for this
to be safe.
