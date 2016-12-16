Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cHzQu-0007Wb-9t
 for linux-mtd@lists.infradead.org; Fri, 16 Dec 2016 20:48:49 +0000
Subject: Re: [PATCH] fscrypt: Factor out bio specific functions
To: David Gstir <david@sigma-star.at>
References: <20161216105006.10207-1-richard@nod.at>
 <72D4D0FB-F56D-4457-9660-4CFF7B4CFB6E@sigma-star.at>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-kernel@vger.kernel.org, jaegeuk@kernel.org, tytso@mit.edu,
 hch@infradead.org, arnd@arndb.de, dedekind1@gmail.com,
 linux-mtd@lists.infradead.org, adrian.hunter@intel.com,
 linux-ext4@vger.kernel.org, ebiggers@google.com, rdunlap@infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <48d4de8e-6e57-cbad-7556-03aa788c815a@nod.at>
Date: Fri, 16 Dec 2016 21:48:19 +0100
MIME-Version: 1.0
In-Reply-To: <72D4D0FB-F56D-4457-9660-4CFF7B4CFB6E@sigma-star.at>
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

On 16.12.2016 16:37, David Gstir wrote:
>> @@ -349,33 +347,10 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
>> 		err = do_page_crypto(inode, FS_ENCRYPT, lblk,
>> 					ZERO_PAGE(0), ciphertext_page,
>> 					PAGE_SIZE, 0, GFP_NOFS);
>> +		err = fscrypt_bio_submit_page(inode, pblk, ciphertext_page);
> 
> Any specific reason why you didn't just move the whole fscrypt_zeroout_range() to bio.c?

The function depends other internal functions of crypto.c which I didn't want to
export.
At the end of the day it's a matter of taste. I found it less ugly to keep
fscrypt_zeroout_range() in crypto.c than exposing internal stuff.

Thanks,
//richard
