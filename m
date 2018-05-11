Received: from mail-pl0-x232.google.com ([2607:f8b0:400e:c01::232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fHFHQ-0005d0-Mj
 for linux-mtd@lists.infradead.org; Fri, 11 May 2018 21:08:46 +0000
Received: by mail-pl0-x232.google.com with SMTP id 59-v6so3921821plc.13
 for <linux-mtd@lists.infradead.org>; Fri, 11 May 2018 14:08:34 -0700 (PDT)
Subject: Re: make a few block drivers highmem safe
To: Christoph Hellwig <hch@lst.de>
Cc: "Ed L. Cashin" <ed.cashin@acm.org>, Geoff Levand <geoff@infradead.org>,
 Maxim Levitsky <maximlevitsky@gmail.com>, linux-block@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org,
 sparclinux@vger.kernel.org
References: <20180509135948.20329-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <e5f3ffef-4fa3-50d3-4fbe-d67ba2a85bd8@kernel.dk>
Date: Fri, 11 May 2018 15:08:26 -0600
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

Applied, thanks.

-- 
Jens Axboe
