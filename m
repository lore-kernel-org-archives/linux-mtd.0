Date: Mon, 9 Jan 2017 05:33:49 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: Theodore Ts'o <tytso@mit.edu>, Eric Biggers <ebiggers3@gmail.com>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 jaegeuk@kernel.org, hch@infradead.org, arnd@arndb.de,
 dedekind1@gmail.com, linux-mtd@lists.infradead.org,
 adrian.hunter@intel.com, linux-ext4@vger.kernel.org,
 ebiggers@google.com, rdunlap@infradead.org, david@sigma-star.at
Subject: Re: [PATCH v2] fscrypt: Factor out bio specific functions
Message-ID: <20170109133349.GA19577@infradead.org>
References: <20161219103929.GA16197@infradead.org>
 <20161219112532.18863-1-richard@nod.at>
 <20170101214725.g67msbedmpx27waz@thunk.org>
 <dd8b8365-e84a-7f8e-384d-4900523e761e@nod.at>
 <20170103142836.no7rp3hphj3czjto@thunk.org>
 <20170104201043.GA21696@gmail.com>
 <20170107192406.56p7ppbdfkjii4vy@thunk.org>
 <21de1dd8-b491-8c59-e874-6834978f1e2e@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21de1dd8-b491-8c59-e874-6834978f1e2e@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jan 07, 2017 at 11:40:15PM +0100, Richard Weinberger wrote:
> Kconfig is tricky. We face a build error with CONFIG_BLOCK=n with UBIFS_FS_ENCRYPTION enabled.
> UBIFS file encryption does "select FS_ENCRYPTION" just like ext4 and f2fs.
> This will enable ENCRYPTION even when no block support is available.

It's the good old select vs depends mess once again.

> I can make UBIFS depend on BLOCK as intermediate fix.
> But the real fix is this patch.

And despite the diffstat it's simple and trivial as it just moves code.
There is no good reason not to take it for 4.10.
