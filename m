Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dD5Nz-000455-TH
 for linux-mtd@lists.infradead.org; Tue, 23 May 2017 08:41:49 +0000
Subject: Re: [PATCH 5/6] ubifs: Implement export_operations
To: Christoph Hellwig <hch@infradead.org>
References: <1495398051-4604-1-git-send-email-richard@nod.at>
 <1495398051-4604-6-git-send-email-richard@nod.at>
 <20170523083932.GC4107@infradead.org>
Cc: linux-mtd@lists.infradead.org, david@sigma-star.at, dedekind1@gmail.com,
 adrian.hunter@intel.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, adilger.kernel@dilger.ca,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org, bfields@redhat.com,
 marcus.folkesson@gmail.com, hyc.lee@gmail.com, rockdotlee@gmail.com,
 leon.pollak@gmail.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <04af5127-e8f3-a2e9-4d2f-af5ef9fc1531@nod.at>
Date: Tue, 23 May 2017 10:41:16 +0200
MIME-Version: 1.0
In-Reply-To: <20170523083932.GC4107@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Christoph,

Am 23.05.2017 um 10:39 schrieb Christoph Hellwig:
>> +static struct inode *ubifs_nfs_get_inode(struct super_block *sb, uint64_t ino,
>> +					 uint32_t generation)
>> +{
>> +	return ubifs_iget(sb, ino);
>> +}
> 
> You need to maintain and check an inode generation counter for this
> to be safe.

UBIFS has no inode generations, inodes simply can't wrap around.
We "handle" it like JFF2 does, we assumes that the NAND is long dead
before we reach the maximum inode number.

Thanks,
//richard
