Received: from mx0b-00082601.pphosted.com ([67.231.153.30])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDg2Y-0006FD-PF
 for linux-mtd@lists.infradead.org; Tue, 20 Jan 2015 21:08:48 +0000
Message-ID: <54BEC3C2.7080906@fb.com>
Date: Tue, 20 Jan 2015 14:08:18 -0700
From: Jens Axboe <axboe@fb.com>
MIME-Version: 1.0
To: Christoph Hellwig <hch@lst.de>
Subject: Re: backing_dev_info cleanups & lifetime rule fixes V2
References: <1421228561-16857-1-git-send-email-hch@lst.de>
In-Reply-To: <1421228561-16857-1-git-send-email-hch@lst.de>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-nfs@vger.kernel.org, linux-mm@kvack.org,
 David Howells <dhowells@redhat.com>, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Tejun Heo <tj@kernel.org>,
 ceph-devel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/14/2015 02:42 AM, Christoph Hellwig wrote:
> The first 8 patches are unchanged from the series posted a week ago and
> cleans up how we use the backing_dev_info structure in preparation for
> fixing the life time rules for it.  The most important change is to
> split the unrelated nommu mmap flags from it, but it also remove a
> backing_dev_info pointer from the address_space (and thus the inode)
> and cleans up various other minor bits.
>
> The remaining patches sort out the issues around bdi_unlink and now
> let the bdi life until it's embedding structure is freed, which must
> be equal or longer than the superblock using the bdi for writeback,
> and thus gets rid of the whole mess around reassining inodes to new
> bdis.
>
> Changes since V1:
>   - various minor documentation updates based on Feedback from Tejun

I applied this to for-3.20/bdi, only making the change (noticed by Jan) 
to kill the extra WARN_ON() in patch #11.


-- 
Jens Axboe
