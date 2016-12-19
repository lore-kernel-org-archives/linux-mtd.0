Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJ48r-000580-Ex
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2016 20:02:38 +0000
Subject: Re: [RFC][PATCH 0/2] xfstests on ubifs
To: Eric Biggers <ebiggers3@gmail.com>
References: <1482173132-100690-1-git-send-email-ebiggers3@gmail.com>
 <74d2781e-e1db-7aa9-26d0-f1b3d473e064@nod.at>
 <20161219195918.GB37112@gmail.com>
Cc: fstests@vger.kernel.org, linux-mtd@lists.infradead.org,
 David Gstir <david@sigma-star.at>, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers <ebiggers@google.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <d1e4793b-d713-6d33-6054-412f7c03b2cf@nod.at>
Date: Mon, 19 Dec 2016 21:02:14 +0100
MIME-Version: 1.0
In-Reply-To: <20161219195918.GB37112@gmail.com>
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

On 19.12.2016 20:59, Eric Biggers wrote:
> On Mon, Dec 19, 2016 at 08:48:52PM +0100, Richard Weinberger wrote:
>>
>> BTW: Do you have a xfstests git tree with all your fscrypt related patches?
>>
> 
> No, I think you were Cc'ed on all the patches though.  My latest xfstests series
> is:
> 
> 	[PATCH v4 0/6] Add filesystem-level encryption tests
> 
> and it depends on the xfsprogs patch:
> 
> 	[PATCH v2] xfs_io: implement 'set_encpolicy' and 'get_encpolicy' commands

Yes, I was cc'ed but pulling from a git tree is still less work than picking
patches from my inbox. ;-)

Thanks,
//richard
