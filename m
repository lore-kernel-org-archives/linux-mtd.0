Date: Sat, 27 May 2017 01:18:22 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, kernel-team@lge.com
Subject: Re: [PATCH] ubifs: Add freeze support
Message-ID: <20170527081822.GA32125@infradead.org>
References: <1495755004-17036-1-git-send-email-hyc.lee@gmail.com>
 <2f3210d7-b0c3-f006-754e-ec4bae26454c@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f3210d7-b0c3-f006-754e-ec4bae26454c@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, May 26, 2017 at 11:52:42AM +0200, Richard Weinberger wrote:
> Hyunchul,
> 
> Am 26.05.2017 um 01:30 schrieb Hyunchul Lee:
> > From: Hyunchul Lee <cheol.lee@lge.com>
> > 
> > for un/freeze support, implement freeze_super and un/freeze_fs
> > of super_operations.
> > ubifs_freeze_super just calls freeze_super. because freeze_super always
> > succeeds if file system is read-only,  UBIFS errors should be checked.
> > if there are errors, UBIFS is switched to read-only mode.
> > ubifs_freeze_fs runs commit if TNC/LPT isn't clean. though all writes
> > are blocked and sync_fs is called before, if commit alreay was started
> > before writes are blocked, TNC/LPT might have dirty COW nodes.
> 
> you explain how you implement that feature, but not why.
> What is the use-case?
> I always thought this interface is only being used by LVM.

It can also be used through the FIFREEZE ioctl, but without snapshots
underneath the fs it's not all that useful.
