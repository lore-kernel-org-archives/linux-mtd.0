Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIKUL-0002tN-Nl
 for linux-mtd@lists.infradead.org; Mon, 02 Feb 2015 17:08:42 +0000
Message-ID: <54CFAF1C.4050104@fb.com>
Date: Mon, 2 Feb 2015 10:08:44 -0700
From: Jens Axboe <axboe@fb.com>
MIME-Version: 1.0
To: Christoph Hellwig <hch@lst.de>, Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: backing_dev_info cleanups & lifetime rule fixes V2
References: <1421228561-16857-1-git-send-email-hch@lst.de>
 <54BEC3C2.7080906@fb.com> <20150201063116.GP29656@ZenIV.linux.org.uk>
 <20150202080635.GB9851@lst.de>
In-Reply-To: <20150202080635.GB9851@lst.de>
Content-Type: text/plain; charset="windows-1252"
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

On 02/02/2015 01:06 AM, Christoph Hellwig wrote:
> On Sun, Feb 01, 2015 at 06:31:16AM +0000, Al Viro wrote:
>> And at that point we finally can make sb_lock and super_blocks static in
>> fs/super.c.  Do you want that in your tree, or would you rather have it
>> done via vfs.git during the merge window after your tree goes in?  It's
>> as trivial as this:
>>
>> Make super_blocks and sb_lock static
>>
>> The only user outside of fs/super.c is gone now
>>
>> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> 
> I'd say merge it through the block tree..
> 
> Acked-by: Christoph Hellwig <hch@lst.de>

Added to for-3.20/bdi


-- 
Jens Axboe
