Received: from mx3-rdu2.redhat.com ([66.187.233.73] helo=mx1.redhat.com)
 by casper.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eoY3C-00042c-Vs
 for linux-mtd@lists.infradead.org; Wed, 21 Feb 2018 17:19:28 +0000
Subject: Re: [Cluster-devel] a few I_DIRTY* related cleanups
To: Christoph Hellwig <hch@lst.de>, viro@zeniv.linux.org.uk
Cc: linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-ntfs-dev@lists.sourceforge.net
References: <20180221155449.25542-1-hch@lst.de>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <20cda37f-d7a1-b186-d9c2-afaa673b2738@redhat.com>
Date: Wed, 21 Feb 2018 17:18:56 +0000
MIME-Version: 1.0
In-Reply-To: <20180221155449.25542-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 21/02/18 15:54, Christoph Hellwig wrote:
> Move I_DIRTY_INODE to fs.h, and use the I_DIRTY* defines more consistently.
>
Thanks - looks good to me:
Acked-by: Steven Whitehouse <swhiteho@redhat.com>

Steve.
