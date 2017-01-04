Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241])
 by merlin.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cOrtr-0001M2-8o
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2017 20:11:07 +0000
Received: by mail-pg0-x241.google.com with SMTP id b1so38172295pgc.1
 for <linux-mtd@lists.infradead.org>; Wed, 04 Jan 2017 12:10:46 -0800 (PST)
Date: Wed, 4 Jan 2017 12:10:43 -0800
From: Eric Biggers <ebiggers3@gmail.com>
To: Theodore Ts'o <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 jaegeuk@kernel.org, hch@infradead.org, arnd@arndb.de,
 dedekind1@gmail.com, linux-mtd@lists.infradead.org,
 adrian.hunter@intel.com, linux-ext4@vger.kernel.org,
 ebiggers@google.com, rdunlap@infradead.org, david@sigma-star.at
Subject: Re: [PATCH v2] fscrypt: Factor out bio specific functions
Message-ID: <20170104201043.GA21696@gmail.com>
References: <20161219103929.GA16197@infradead.org>
 <20161219112532.18863-1-richard@nod.at>
 <20170101214725.g67msbedmpx27waz@thunk.org>
 <dd8b8365-e84a-7f8e-384d-4900523e761e@nod.at>
 <20170103142836.no7rp3hphj3czjto@thunk.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170103142836.no7rp3hphj3czjto@thunk.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 03, 2017 at 09:28:36AM -0500, Theodore Ts'o wrote:
> On Tue, Jan 03, 2017 at 10:49:26AM +0100, Richard Weinberger wrote:
> > Ted,
> > 
> > Am 01.01.2017 um 22:47 schrieb Theodore Ts'o:
> > > On Mon, Dec 19, 2016 at 12:25:32PM +0100, Richard Weinberger wrote:
> > >> That way we can get rid of the direct dependency on CONFIG_BLOCK.
> > >>
> > >> Reported-by: Arnd Bergmann <arnd@arndb.de>
> > >> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > >> Suggested-by: Christoph Hellwig <hch@infradead.org>
> > >> Fixes: d475a507457b ("ubifs: Add skeleton for fscrypto")
> > >> Signed-off-by: Richard Weinberger <richard@nod.at>
> > > 
> > > Applied, thanks.
> > 
> > Just to make sure, this fixes a build error and should
> > go into Linus' tree ASAP.
> 
> I didn't consider this a build error since it could be fixed via a
> config change.  And it is a pretty big patch, even if it is mostly
> moving (not that git recognized it as such)...
> 

I thought you're supposed to be able to build the kernel no matter how it's
configured.  If this patch is really too large for 4.10 then perhaps we should
make FS_ENCRYPTION select CONFIG_BLOCK instead?

Eric
