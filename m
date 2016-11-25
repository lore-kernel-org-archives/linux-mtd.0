Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cABiV-0006LV-KQ
 for linux-mtd@lists.infradead.org; Fri, 25 Nov 2016 08:18:45 +0000
Subject: Re: [PATCH 00/29] UBIFS File Encryption v1
To: Theodore Ts'o <tytso@mit.edu>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, jaegeuk@kernel.org,
 david@sigma-star.at, wd@denx.de, sbabic@denx.de, dengler@linutronix.de,
 ebiggers@google.com, mhalcrow@google.com, hch@infradead.org
References: <1479072072-6844-1-git-send-email-richard@nod.at>
 <20161114030548.eils5al7ugfhlqwg@thunk.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <34885683-a40f-eaff-b99d-b11fc68803f7@nod.at>
Date: Fri, 25 Nov 2016 09:18:12 +0100
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

Do you want us to address Eric's review comments on top of the fscrypt
branch or shall we rebase?
I'd suggest the former.

Thanks,
//richard
