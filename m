Received: from zeniv.linux.org.uk ([195.92.253.2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dFJU3-0004ZO-Od
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 12:09:18 +0000
Date: Mon, 29 May 2017 13:08:25 +0100
From: Al Viro <viro@ZenIV.linux.org.uk>
To: Richard Weinberger <richard@nod.at>
Cc: Rabin Vincent <rabin.vincent@axis.com>, dedekind1@gmail.com,
 adrian.hunter@intel.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rabin Vincent <rabinv@axis.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>
Subject: Re: Setting ->s_dev to a char device (Was: Re: [PATCH v2] ubifs:
 allow userspace to map mounts to volumes)
Message-ID: <20170529120818.GA6365@ZenIV.linux.org.uk>
References: <1496042533-17024-1-git-send-email-rabin.vincent@axis.com>
 <6737a526-18ba-6d8c-f6c8-03f03d74b90a@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6737a526-18ba-6d8c-f6c8-03f03d74b90a@nod.at>
Sender: Al Viro <viro@ftp.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 29, 2017 at 01:50:30PM +0200, Richard Weinberger wrote:
> CC'ing VFS folks
> 
> Am 29.05.2017 um 09:22 schrieb Rabin Vincent:
> > From: Rabin Vincent <rabinv@axis.com>
> > 
> > There currently appears to be no way for userspace to find out the
> > underlying volume number for a mounted ubifs file system, since ubifs
> > uses anonymous block devices.  The volume name is present in
> > /proc/mounts but UBI volumes can be renamed after the volume has been
> > mounted.
> > 
> > To remedy this, provide a directory in /sys/fs/ubifs named after the
> > underlying anonymous block device's number (obtainable by userspace via
> > stat(2)) and provide a link named "ubi" to the underlying UBI volume.
> 
> I wonder whether it would make more sense to just assign the character device
> number of the UBI volume to ->s_dev.
> Then userspace can query the underlying device without additional sysfs
> magic.
> 
> Sure if userspace expects a block number from UBIFS it will get confused.
> 
> Comments?

Userspace sure as hell does.  st_dev in stat(2) is a block device number;
moreover, there might _be_ a block device with the same number at the same
time - even mounted.  Why not make ->show_options() print the currently
valid volume name, anyway?  That would seem to be the obvious approach...
