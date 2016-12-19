Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJ4Tz-0001vP-9K
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2016 20:24:28 +0000
Received: by mail-pg0-x244.google.com with SMTP id w68so3436361pgw.3
 for <linux-mtd@lists.infradead.org>; Mon, 19 Dec 2016 12:24:05 -0800 (PST)
Date: Mon, 19 Dec 2016 12:24:02 -0800
From: Eric Biggers <ebiggers3@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-fsdevel@vger.kernel.org, Eric Biggers <ebiggers@google.com>
Subject: Re: [PATCH] ubifs: remove redundant checks for encryption key
Message-ID: <20161219202402.GC37112@gmail.com>
References: <1482174948-104602-1-git-send-email-ebiggers3@gmail.com>
 <1fb1f6a6-1204-5013-6406-7305861fdc5b@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fb1f6a6-1204-5013-6406-7305861fdc5b@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 19, 2016 at 08:59:15PM +0100, Richard Weinberger wrote:
> On 19.12.2016 20:15, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > In several places, ubifs checked for an encryption key before creating a
> > file in an encrypted directory.  This was redundant with
> > fscrypt_setup_filename() or ubifs_new_inode(), and in the case of
> > ubifs_link() it broke linking to special files.  So remove the extra
> > checks.
> 
> Thanks for doing this. I assume same or similar changes were also needed
> for f2fs and ext4 since I've duplicated the logic from them? :-)
> 

Well all the filesystems are a little different, but I checked link, create,
mkdir, mknod, symlink, and tmpfile.  UBIFS generally seemed to be the odd one
out with regards to having these extra checks:

ext4_link(): relies on check in fscrypt_setup_filename()
ext4_create(): relies on check in __ext4_new_inode()
ext4_mkdir(): relies on check in __ext4_new_inode()
ext4_mknod(): relies on check in __ext4_new_inode()
ext4_symlink(): relies on __ext4_new_inode() preloading encryption info
		of new inode
ext4_tmpfile(): relies on check in __ext4_new_inode()

f2fs_link(): relies on check in fscrypt_setup_filename()
f2fs_create(): relies on check in fscrypt_setup_filename()
f2fs_mkdir(): relies on check in fscrypt_setup_filename()
f2fs_mknod(): relies on check in fscrypt_setup_filename()
f2fs_symlink(): has an explicit call to fscrypt_get_encryption_info() because
		f2fs_new_inode() doesn't preload encryption info of new inode.
		Check of fscrypt_has_encryption_key() appears unnecessary.
f2fs_tmpfile(): has an explicit load of encryption key with no check; it's
		unclear whether this is sufficient, since it never calls
		fscrypt_setup_filename()

So I am wondering why ext4 "preloads" encryption keys of new inodes but f2fs
doesn't, and whether f2fs_tmpfile() is doing the correct checks.  But neither fs
had all the redundant checks this patch removes from ubifs.

Eric
