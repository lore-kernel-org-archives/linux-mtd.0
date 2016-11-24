Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9y3Z-0001Yn-An
 for linux-mtd@lists.infradead.org; Thu, 24 Nov 2016 17:43:34 +0000
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 02/29] fscrypt: Allow fscrypt_decrypt_page() to function
 with non-writeback pages
From: David Gstir <david@sigma-star.at>
In-Reply-To: <20161115181939.GB127180@google.com>
Date: Thu, 24 Nov 2016 18:43:14 +0100
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, wd@denx.de, sbabic@denx.de, dengler@linutronix.de,
 mhalcrow@google.com, hch@infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E2F636AB-62AA-4043-856E-7FDFF46DB7B8@sigma-star.at>
References: <1479072072-6844-1-git-send-email-richard@nod.at>
 <1479072072-6844-3-git-send-email-richard@nod.at>
 <20161115181939.GB127180@google.com>
To: Eric Biggers <ebiggers@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Eric,

> On 15.11.2016, at 19:19, Eric Biggers <ebiggers@google.com> wrote:
>=20
> On Sun, Nov 13, 2016 at 10:20:45PM +0100, Richard Weinberger wrote:
>> /**
>>  * f2crypt_decrypt_page() - Decrypts a page in-place
>> - * @page: The page to decrypt. Must be locked.
>> + * @inode: The encrypted inode to decrypt.
>> + * @page:  The page to decrypt. Must be locked.
>=20
> Strictly speaking, it's not the inode itself being decrypted, but =
rather the
> data associated with it.  Could this be better expressed as something =
like
> "The inode to which the page belongs"?

Yes, you're right. Will address that!

Thanks,
David=
