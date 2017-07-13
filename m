Received: from mail.eperm.de ([89.247.134.16])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dVgp0-0007lH-2r
 for linux-mtd@lists.infradead.org; Thu, 13 Jul 2017 16:18:36 +0000
From: Stephan =?ISO-8859-1?Q?M=FCller?= <smueller@chronox.de>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Eric Biggers <ebiggers3@gmail.com>, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Alex Cope <alexcope@google.com>,
 Eric Biggers <ebiggers@google.com>
Subject: Re: [PATCH 3/6] fscrypt: use HKDF-SHA512 to derive the per-inode
 encryption keys
Date: Thu, 13 Jul 2017 18:18:02 +0200
Message-ID: <4273111.qD8qsi0XUh@tauon.chronox.de>
In-Reply-To: <20170713160753.GA25989@gondor.apana.org.au>
References: <20170712210035.51534-1-ebiggers3@gmail.com>
 <2034167.Brpu2WxA6s@tauon.chronox.de>
 <20170713160753.GA25989@gondor.apana.org.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Donnerstag, 13. Juli 2017, 18:07:54 CEST schrieb Herbert Xu:

Hi Herbert,

> Sure.  Though I'd like to see what it looks like before I commit :)

Naturally. :-)

The patches would create an RNG template support. KDFs are not more than 
special-purpose RNGs.

Ciao
Stephan
