Received: from mail.linuxfoundation.org ([140.211.169.12])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TYMaX-0002RT-3L
 for linux-mtd@lists.infradead.org; Tue, 13 Nov 2012 19:56:01 +0000
Date: Tue, 13 Nov 2012 11:55:57 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Akinobu Mita <akinobu.mita@gmail.com>
Subject: Re: [PATCH v3 00/11] rename random32 to prandom and introduce
 prandom_bytes()
Message-Id: <20121113115557.9b573359.akpm@linux-foundation.org>
In-Reply-To: <1352813830-4624-1-git-send-email-akinobu.mita@gmail.com>
References: <1352813830-4624-1-git-send-email-akinobu.mita@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Michel Lespinasse <walken@google.com>, Theodore Ts'o <tytso@mit.edu>,
 Artem Bityutskiy <dedekind1@gmail.com>, netdev@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, devel@open-fcoe.org,
 Robert Love <robert.w.love@intel.com>, David Woodhouse <dwmw2@infradead.org>,
 Eilon Greenstein <eilong@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 13 Nov 2012 22:36:59 +0900
Akinobu Mita <akinobu.mita@gmail.com> wrote:

> This patchset introduces new functions into random32 library for
> getting the requested number of pseudo-random bytes.
> 
> Before introducing these new functions into random32 library,
> rename all random32 functions to have 'prandom_' prefix.  As a result
> the function prototypes are as follows:
> 
> void prandom_seed(u32 seed);	/* rename from srandom32() */
> u32 prandom_u32(void);		/* rename from random32() */
> void prandom_bytes(void *buf, int nbytes);
> 
> void prandom_seed_state(struct rnd_state *state, u64 seed);
> 				/* rename from prandom32_seed() */
> u32 prandom_u32_state(struct rnd_state *state);
> 				/* rename from prandom32() */
> void prandom_bytes_state(struct rnd_state *state, void *buf, int nbytes);
> 
> The purpose of this renaming is to prevent some kernel developers
> from assuming that prandom32() and random32() might imply that only
> prandom32() was the one using a pseudo-random number generator by
> prandom32's "p", and the result may be a very embarassing security
> exposure.  This concern was expressed by Theodore Ts'o.

There were a large number of rejects in MTD code, due to pending
changes in linux-next.  It's all quite mechanical stuff which I
fixed up.  Please check the result.
