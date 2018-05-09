Received: from mail-it0-x22e.google.com ([2607:f8b0:4001:c0b::22e])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGRv2-0000z1-2S
 for linux-mtd@lists.infradead.org; Wed, 09 May 2018 16:26:22 +0000
Received: by mail-it0-x22e.google.com with SMTP id p3-v6so21129691itc.0
 for <linux-mtd@lists.infradead.org>; Wed, 09 May 2018 09:26:09 -0700 (PDT)
Subject: Re: make a few block drivers highmem safe
To: Christoph Hellwig <hch@lst.de>
Cc: "Ed L. Cashin" <ed.cashin@acm.org>, Geoff Levand <geoff@infradead.org>,
 Maxim Levitsky <maximlevitsky@gmail.com>, linux-block@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org,
 sparclinux@vger.kernel.org
References: <20180509135948.20329-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <36768a62-1b72-d7a8-8c4d-2ec66f314824@kernel.dk>
Date: Wed, 9 May 2018 10:26:05 -0600
MIME-Version: 1.0
In-Reply-To: <20180509135948.20329-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/9/18 7:59 AM, Christoph Hellwig wrote:
> Hi all,
> 
> this series converts a few random block drivers to be highmem safe,
> in preparation of eventually getting rid of the block layer bounce
> buffering support.

Series looks good to me.

-- 
Jens Axboe
