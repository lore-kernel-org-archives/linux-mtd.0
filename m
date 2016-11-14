Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6Fx4-0008I4-Kh
 for linux-mtd@lists.infradead.org; Mon, 14 Nov 2016 12:01:33 +0000
Subject: Re: [PATCH 00/29] UBIFS File Encryption v1
To: Theodore Ts'o <tytso@mit.edu>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, jaegeuk@kernel.org,
 david@sigma-star.at, wd@denx.de, sbabic@denx.de, dengler@linutronix.de,
 ebiggers@google.com, mhalcrow@google.com, hch@infradead.org
References: <1479072072-6844-1-git-send-email-richard@nod.at>
 <20161114030548.eils5al7ugfhlqwg@thunk.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <79c00da2-0840-a94f-a9cd-d571b8ad4cad@nod.at>
Date: Mon, 14 Nov 2016 13:01:02 +0100
MIME-Version: 1.0
In-Reply-To: <20161114030548.eils5al7ugfhlqwg@thunk.org>
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

Ted,

On 14.11.2016 04:05, Theodore Ts'o wrote:
> Richard,
> 
> Your fscrypt patches look good.  I've created an fscrypt branch on the
> ext4.git tree which contains your changes as well as Eric Bigger's
> recent fspatch cleanups changes.  If you want to base your ubifs
> changes on that branch, that would be great.  The ext4 dev branch will
> be including that fscrypt branch, so it will be feeding into
> linux-next that way.  If you also base your patches on that, it will
> avoid duplicate patches in linux-next and in Linus's tree when he
> pulls them.

Will do!

> One quick question.  When ubifs uses subpage blocks, can you assume that
> they are always powers of two?  Or more to the point, can you assume
> that it will always be a multiple of the cipher's blocksize?

Yes, UBIFS takes care about that. Subpage blocks are always a multiple of
FS_CRYPTO_BLOCK_SIZE.

Thanks,
//richard
