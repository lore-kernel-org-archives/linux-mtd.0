Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0tIH-00079l-Rs
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 17:21:32 +0000
Subject: Re: [PATCH] fscrypt: use 32 bytes of encrypted filename
To: Eric Biggers <ebiggers3@gmail.com>
References: <20170418210642.6039-1-gwendal@chromium.org>
 <20170418230136.GA96152@gmail.com>
 <CAFLxGvwtFQW=NL3NrNHx-vWR3wSUtewnBRy1XzMqRNTV8f5vwQ@mail.gmail.com>
 <20170419171633.GB89688@gmail.com>
Cc: Gwendal Grignou <gwendal@chromium.org>, hashimoto@chromium.org,
 Eric Biggers <ebiggers@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 kinaba@chromium.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <f415bfef-12d9-6444-9e94-9ae3e3363cfb@nod.at>
Date: Wed, 19 Apr 2017 19:21:05 +0200
MIME-Version: 1.0
In-Reply-To: <20170419171633.GB89688@gmail.com>
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

Am 19.04.2017 um 19:16 schrieb Eric Biggers:
> On Wed, Apr 19, 2017 at 03:40:13PM +0200, Richard Weinberger wrote:
>>> Strangely, f2fs and ubifs do not use the bytes from the filename at all when
>>> trying to find a specific directory entry in this case.  So this patch doesn't
>>> really affect them.  This seems unreliable; perhaps we should introduce a
>>> function like "fscrypt_name_matches()" which all the filesystems could call?
>>> Can any of the f2fs and ubifs developers explain why they don't look at any
>>> bytes from the filename?
>>
>> Not sure if I understand you correctly, but for long filenames UBIFS
>> does a lookup
>> by hash/cookie, not by filename.
>>
> 
> Well, like I said to Jaegeuk for F2FS, that's what the code does, but _why_?
> Like F2FS, it's probably not the case that the hash is sufficient to reliably
> identify a directory entry.  Granted, UBIFS does it a lot better than F2FS since
> UBIFS uses two 32-bit hashes rather than just one, but it seems the second hash
> may be neither necessary nor sufficient to identify a specific directory entry,
> and it should be looking at the bytes of ciphertext from the filename instead,
> like what ext4 does.  (Provided that is fixed to account for how CTS mode
> encryption works.)

Let me dig into this, maybe I made a boo boo.
The idea was looking up by the filename hash and resolving
possible collisions using the secondary hash.

Thanks,
//richard
