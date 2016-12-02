Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCq7A-0004HP-0J
 for linux-mtd@lists.infradead.org; Fri, 02 Dec 2016 15:51:09 +0000
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 3/6] fscrypt: Cleanup fscrypt_{decrypt,encrypt}_page()
From: David Gstir <david@sigma-star.at>
In-Reply-To: <20161202081934.GC18690@google.com>
Date: Fri, 2 Dec 2016 16:50:41 +0100
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 tytso@mit.edu, dedekind1@gmail.com, mhalcrow@google.com,
 adrian.hunter@intel.com, linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, dengler@linutronix.de,
 sbabic@denx.de, wd@denx.de
Content-Transfer-Encoding: 7bit
Message-Id: <9B306A9D-C57C-4252-979B-C22B2F3AA9FB@sigma-star.at>
References: <1480630498-19201-1-git-send-email-richard@nod.at>
 <1480630498-19201-4-git-send-email-richard@nod.at>
 <20161202081934.GC18690@google.com>
To: Eric Biggers <ebiggers@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On 02.12.2016, at 09:19, Eric Biggers <ebiggers@google.com> wrote:
> 
> On Thu, Dec 01, 2016 at 11:14:55PM +0100, Richard Weinberger wrote:
>> + * @lblk_num:  Logical block number. This must be unique for multiple
>> + *             calls with same page.
> 
> Must be unique for all calls with the same *inode*, except when overwriting
> previously written data.

Yes, of course! Will fix that.

Thanks,
David
