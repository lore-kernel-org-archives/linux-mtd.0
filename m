Received: from mail-it0-x232.google.com ([2607:f8b0:4001:c0b::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eNCy2-0006I2-8G
 for linux-mtd@lists.infradead.org; Fri, 08 Dec 2017 07:21:08 +0000
Received: by mail-it0-x232.google.com with SMTP id d137so2884179itc.2
 for <linux-mtd@lists.infradead.org>; Thu, 07 Dec 2017 23:20:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9ob8eG1yS=jkGHFnYDq+FtiJCP38CKpzUs0Z33R8_0Msw@mail.gmail.com>
References: <20171208013838.105034-1-ebiggers3@gmail.com>
 <CAHmME9ob8eG1yS=jkGHFnYDq+FtiJCP38CKpzUs0Z33R8_0Msw@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Fri, 8 Dec 2017 07:20:43 +0000
Message-ID: <CAKv+Gu85X5OZWhwQxNrc8RonPL3XdRhzK=JeWcWXLu=8KUsQAg@mail.gmail.com>
Subject: Re: [PATCH] fscrypt: add support for ChaCha20 contents encryption
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Eric Biggers <ebiggers3@gmail.com>, linux-fscrypt@vger.kernel.org,
 "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 Michael Halcrow <mhalcrow@google.com>, Paul Crowley <paulcrowley@google.com>,
 Martin Willi <martin@strongswan.org>, David Gstir <david@sigma-star.at>,
 Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8 December 2017 at 02:51, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Hi Eric,
>
> Nice to see more use of ChaCha20. However...
>
> Can we skip over the "sort of worse than XTS, but not having _real_
> authentication sucks anyway in either case, so whatever" and move
> directly to, "linux finally supports authenticated encryption for disk
> encryption!"?

Ehm, it doesn't? This is plain ChaCha20, not any AEAD variant.

> This would be a big deal and would actually be a
> noticeable security improvement, instead of a potentially dubious step
> sidewaysbackish.
>

It is actually dubious, given the large scale reuse of IVs with a
stream cipher. I do suppose though that using an AEAD variant would at
least catch any attacks involving flipping ciphertext bits resulting
in plaintext bits being flipped at the same offset (but file updates
would still be visible in the clear)

> Bcachefs supports ChaCha20Poly1305, which is pretty neat. From what
> I've read, performance is acceptable too.
> http://bcachefs.org/Encryption/
>
> Jason
