Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cI0qZ-0008Tq-Ue
 for linux-mtd@lists.infradead.org; Fri, 16 Dec 2016 22:19:24 +0000
Subject: Re: [PATCH] fscrypt: Factor out bio specific functions
To: Eric Biggers <ebiggers3@gmail.com>
References: <20161216105006.10207-1-richard@nod.at>
 <72D4D0FB-F56D-4457-9660-4CFF7B4CFB6E@sigma-star.at>
 <48d4de8e-6e57-cbad-7556-03aa788c815a@nod.at>
 <20161216221428.GC14264@gmail.com>
Cc: David Gstir <david@sigma-star.at>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-kernel@vger.kernel.org,
 jaegeuk@kernel.org, tytso@mit.edu, hch@infradead.org, arnd@arndb.de,
 dedekind1@gmail.com, linux-mtd@lists.infradead.org, adrian.hunter@intel.com,
 linux-ext4@vger.kernel.org, ebiggers@google.com, rdunlap@infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <ed44777e-96a1-bfd6-d07d-5c1ca231086a@nod.at>
Date: Fri, 16 Dec 2016 23:18:57 +0100
MIME-Version: 1.0
In-Reply-To: <20161216221428.GC14264@gmail.com>
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

On 16.12.2016 23:14, Eric Biggers wrote:
> On Fri, Dec 16, 2016 at 09:48:19PM +0100, Richard Weinberger wrote:
>> On 16.12.2016 16:37, David Gstir wrote:
>>>> @@ -349,33 +347,10 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
>>>> 		err = do_page_crypto(inode, FS_ENCRYPT, lblk,
>>>> 					ZERO_PAGE(0), ciphertext_page,
>>>> 					PAGE_SIZE, 0, GFP_NOFS);
>>>> +		err = fscrypt_bio_submit_page(inode, pblk, ciphertext_page);
>>>
>>> Any specific reason why you didn't just move the whole fscrypt_zeroout_range() to bio.c?
>>
>> The function depends other internal functions of crypto.c which I didn't want to
>> export.
>> At the end of the day it's a matter of taste. I found it less ugly to keep
>> fscrypt_zeroout_range() in crypto.c than exposing internal stuff.
>>
> 
> Hmm, it still seems weird to define fscrypt_zeroout_range() when it can't
> actually be used.  It looks like the problem is specifically the use of
> alloc_bounce_page() and do_page_crypto().  Would it be that bad to make those
> available in fscrypt_internal.h (not exported to filesystems)?

We can also hide it under a #ifdef CONFIG_BLOCK.

Exporting internal functions is also an option. As I said, I found the current
variant the least ugly one.

Thanks,
//richard
