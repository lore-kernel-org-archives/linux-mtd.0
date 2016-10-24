Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byZFF-0004EY-9y
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 07:00:30 +0000
Subject: Re: [PATCH 15/26] ubifs: Implement encrypt/decrypt for all IO
To: Eric Biggers <ebiggers@google.com>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
 <1477054121-10198-16-git-send-email-richard@nod.at>
 <20161021182559.GB90712@google.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dedekind1@gmail.com, adrian.hunter@intel.com,
 tytso@mit.edu, jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de,
 sbabic@denx.de, dengler@linutronix.de
From: Richard Weinberger <richard@nod.at>
Message-ID: <ad408dbe-db9a-05f5-b3ee-8a650aceafb3@nod.at>
Date: Mon, 24 Oct 2016 09:00:03 +0200
MIME-Version: 1.0
In-Reply-To: <20161021182559.GB90712@google.com>
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

Eric,

On 21.10.2016 20:25, Eric Biggers wrote:
> On Fri, Oct 21, 2016 at 02:48:30PM +0200, Richard Weinberger wrote:
>> +
>> +	if (ubifs_crypt_is_encrypted(inode)) {
>> +		int clen = le16_to_cpu(dn->compr_size);
>> +
>> +		if (clen <= 0 || clen > UBIFS_BLOCK_SIZE || clen > dlen)
>> +			goto dump;
>> +
>> +		ubifs_assert(dlen <= UBIFS_BLOCK_SIZE);
>> +		err = fscrypt_decrypt_buffer(inode, &dn->data, &dn->data, dlen, block, GFP_NOFS);
>> +		if (err) {
>> +			ubifs_err(c, "fscrypt_decrypt_buffer failed: %i", err);
>> +			return err;
>> +		}
>> +
>> +		ubifs_assert(clen <= dlen);
>> +		dlen = clen;
>> +	}
>> +
> 
> There are several code blocks like this, calling either fscrypt_decrypt_buffer()
> or fscrypt_encrypt_buffer(), which seem to be mostly duplicated.  Is it possible
> to refactor them into helper functions?  There are also some lines well over 80
> characters.

Yes, that's already on my TODO.

Thanks,
//richard
