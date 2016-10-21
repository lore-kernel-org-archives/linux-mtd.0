Received: from mail-pf0-x230.google.com ([2607:f8b0:400e:c00::230])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxeQj-0003On-K9
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 18:20:34 +0000
Received: by mail-pf0-x230.google.com with SMTP id r16so60844052pfg.1
 for <linux-mtd@lists.infradead.org>; Fri, 21 Oct 2016 11:19:34 -0700 (PDT)
Date: Fri, 21 Oct 2016 11:19:31 -0700
From: Eric Biggers <ebiggers@google.com>
To: Theodore Ts'o <tytso@mit.edu>, Michael Halcrow <mhalcrow@google.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, jaegeuk@kernel.org,
 david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, alexcope@google.com
Subject: Re: [PATCH 26/26] ubifs: Raise write version to 5
Message-ID: <20161021181931.GA90712@google.com>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
 <1477054121-10198-27-git-send-email-richard@nod.at>
 <20161021173154.GB17121@google.com>
 <20161021174758.wz7xrulokicuhlht@thunk.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161021174758.wz7xrulokicuhlht@thunk.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 21, 2016 at 01:47:59PM -0400, Theodore Ts'o wrote:
> On Fri, Oct 21, 2016 at 10:31:54AM -0700, Michael Halcrow wrote:
> > > diff --git a/fs/ubifs/ubifs-media.h b/fs/ubifs/ubifs-media.h
> > > index bdc7935a5e41..e8c23c9d4f4a 100644
> > > --- a/fs/ubifs/ubifs-media.h
> > > +++ b/fs/ubifs/ubifs-media.h
> > > @@ -46,7 +46,7 @@
> > >   * UBIFS went into mainline kernel with format version 4. The older formats
> > >   * were development formats.
> > >   */
> > > -#define UBIFS_FORMAT_VERSION 4
> > > +#define UBIFS_FORMAT_VERSION 5
> > 
> > Alex Cope is working on a fix for file name encryption in ext4 so that
> > common plaintext prefixes don't result in common ciphertext prefixes.
> > Older kernels will not be able to read the new file names.
> 
> To be clear, this will be done in the context of a new encryption
> mode.  In terms of how Ubifs will handle things, that's going to
> depend on whether ubifs uses a single major version number or whether
> they have a feature bitmask like other filesystems, including ext4.
> 

I don't think it's reasonable to require require changes to filesystems whenever
someone introduces a new encryption mode --- contents, filenames, or both.
Filesystems need to be able to handle unsupported encryption modes in some way
that makes sense.  Currently, when it sees an unsupported encryption mode
fscrypto will behave as if the encryption key is not available and will also
print a one-time warning to the kernel log.  This happens when a file is
accessed, not when the filesystem is mounted.  As far as I can tell, ext4, f2fs,
and ubifs would all behave this way because this code is shared.  I think this
is probably the most realistic behavior.

Eric
