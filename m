Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cAFJw-0007wv-Cj
 for linux-mtd@lists.infradead.org; Fri, 25 Nov 2016 12:09:41 +0000
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 01/29] fscrypt: Add in-place encryption mode
From: David Gstir <david@sigma-star.at>
In-Reply-To: <20161115181455.GA127180@google.com>
Date: Fri, 25 Nov 2016 13:09:05 +0100
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, wd@denx.de, sbabic@denx.de, dengler@linutronix.de,
 mhalcrow@google.com, hch@infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C622816B-E69F-4B81-9F37-E04E06CDC591@sigma-star.at>
References: <1479072072-6844-1-git-send-email-richard@nod.at>
 <1479072072-6844-2-git-send-email-richard@nod.at>
 <20161115181455.GA127180@google.com>
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

> On 15.11.2016, at 19:14, Eric Biggers <ebiggers@google.com> wrote:
>=20
> Hi,
>=20
> On Sun, Nov 13, 2016 at 10:20:44PM +0100, Richard Weinberger wrote:
>> From: David Gstir <david@sigma-star.at>
>>=20
>> ext4 and f2fs require a bounce page when encrypting pages. However, =
not
>> all filesystems will need that (eg. UBIFS). This is handled via a
>> flag on fscrypt_operations where a fs implementation can select =
in-place
>> encryption over using a bounce page (which is the default).
>>=20
>> Signed-off-by: David Gstir <david@sigma-star.at>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>=20
> The comment for fscrypt_encrypt_page() still says the following:
>=20
> * Called on the page write path.  The caller must call
> * fscrypt_restore_control_page() on the returned ciphertext page to
> * release the bounce buffer and the encryption context.
>=20
> It seems this isn't correct anymore. =20

Yes, this is not true in all cases anymore. Will fix that.

> It also looks like the fscrypt_context
> never gets released in the case where the page is encrypted in-place.

You're right. I've already fixed that locally and will include it in the =
next patch set.

> Additionally, after this change the name of the flag FS_WRITE_PATH_FL =
is
> misleading, since it now really indicates the presence of a bounce =
buffer rather
> than the "write path".

I can see no use case for FS_WRITE_PATH_FL other than to indicate that =
the bounce buffer has to be free'd. Is there any reason why we should =
not just remove it and check the presence of a bounce buffer by a simple =
"if (ctx->w.bounce_page)" ?

Thanks,
David
