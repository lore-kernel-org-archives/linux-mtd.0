Received: from imap.thunk.org ([2600:3c02::f03c:91ff:fe96:be03])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxdxX-0001WE-Cb
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 17:50:25 +0000
Date: Fri, 21 Oct 2016 13:47:59 -0400
From: Theodore Ts'o <tytso@mit.edu>
To: Michael Halcrow <mhalcrow@google.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, jaegeuk@kernel.org,
 david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, alexcope@google.com
Subject: Re: [PATCH 26/26] ubifs: Raise write version to 5
Message-ID: <20161021174758.wz7xrulokicuhlht@thunk.org>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
 <1477054121-10198-27-git-send-email-richard@nod.at>
 <20161021173154.GB17121@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161021173154.GB17121@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 21, 2016 at 10:31:54AM -0700, Michael Halcrow wrote:
> > diff --git a/fs/ubifs/ubifs-media.h b/fs/ubifs/ubifs-media.h
> > index bdc7935a5e41..e8c23c9d4f4a 100644
> > --- a/fs/ubifs/ubifs-media.h
> > +++ b/fs/ubifs/ubifs-media.h
> > @@ -46,7 +46,7 @@
> >   * UBIFS went into mainline kernel with format version 4. The older formats
> >   * were development formats.
> >   */
> > -#define UBIFS_FORMAT_VERSION 4
> > +#define UBIFS_FORMAT_VERSION 5
> 
> Alex Cope is working on a fix for file name encryption in ext4 so that
> common plaintext prefixes don't result in common ciphertext prefixes.
> Older kernels will not be able to read the new file names.

To be clear, this will be done in the context of a new encryption
mode.  In terms of how Ubifs will handle things, that's going to
depend on whether ubifs uses a single major version number or whether
they have a feature bitmask like other filesystems, including ext4.

This is better because if the user doesn't use a particular feature,
especially a feature like encryption which is optional, we don't want
the file system to reject the mount unnecessarily.  In the case of
encryption, where there may be new encryption algorithms used, or
maybe even hardware-specific encryption modes if you are using in-line
encryption where the encryption is done in hardware, the question is
whether you want to refuse the mount if you know it won't work, or
just throw an error when there is an attempt to access a directory or
file which is encrypted using an encryption algorithm which a
particular kernel version doesn't support.

We did leave some room in the ext4 superblock for an encryption format
version number, as ewll as an array of which encryption algorithsm are
in use in the superblock, but we haven't really decided which strategy
we want to use.

My current thinking is that there ought to be a warning at mount time
if there are some directories which the kernel being used won't be
able to access, but we should just fail the mount entirely, since
there might be a lot of unencrypted files that the user might want to access.

Cheers,

							- Ted
