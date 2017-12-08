Received: from frisell.zx2c4.com ([192.95.5.64])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eN8lY-0002pr-4T
 for linux-mtd@lists.infradead.org; Fri, 08 Dec 2017 02:51:58 +0000
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58f236fe
 for <linux-mtd@lists.infradead.org>;
 Fri, 8 Dec 2017 02:44:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 70c94e10
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <linux-mtd@lists.infradead.org>;
 Fri, 8 Dec 2017 02:44:24 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id q3so8146224oth.2
 for <linux-mtd@lists.infradead.org>; Thu, 07 Dec 2017 18:51:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171208013838.105034-1-ebiggers3@gmail.com>
References: <20171208013838.105034-1-ebiggers3@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 8 Dec 2017 03:51:28 +0100
Message-ID: <CAHmME9ob8eG1yS=jkGHFnYDq+FtiJCP38CKpzUs0Z33R8_0Msw@mail.gmail.com>
Subject: Re: [PATCH] fscrypt: add support for ChaCha20 contents encryption
To: Eric Biggers <ebiggers3@gmail.com>
Cc: linux-fscrypt@vger.kernel.org, "Theodore Ts'o" <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 Michael Halcrow <mhalcrow@google.com>, Paul Crowley <paulcrowley@google.com>,
 Martin Willi <martin@strongswan.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 David Gstir <david@sigma-star.at>, Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Eric,

Nice to see more use of ChaCha20. However...

Can we skip over the "sort of worse than XTS, but not having _real_
authentication sucks anyway in either case, so whatever" and move
directly to, "linux finally supports authenticated encryption for disk
encryption!"? This would be a big deal and would actually be a
noticeable security improvement, instead of a potentially dubious step
sidewaysbackish.

Bcachefs supports ChaCha20Poly1305, which is pretty neat. From what
I've read, performance is acceptable too.
http://bcachefs.org/Encryption/

Jason
