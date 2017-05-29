Received: from lgeamrelo12.lge.com ([156.147.23.52])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFCUc-0002s3-SJ
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 04:41:25 +0000
Date: Mon, 29 May 2017 13:40:59 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, kernel-team@lge.com,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] ubifs: Add freeze support
Message-ID: <20170529044059.GA12991@sebu>
References: <1495755004-17036-1-git-send-email-hyc.lee@gmail.com>
 <2f3210d7-b0c3-f006-754e-ec4bae26454c@nod.at>
 <20170529011834.GB10215@sebu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170529011834.GB10215@sebu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


and I missed the following case.

in some embedded systems, clean-up for shutdown should be fast.
during this clean-up, freeze file system to guarantee integrity.
umount with MNT_DETACH is not suitable because of not killing tasks.

On Mon, May 29, 2017 at 10:18:34AM +0900, Hyunchul Lee wrote:
> Hi, Richard.
> 
> On Fri, May 26, 2017 at 11:52:42AM +0200, Richard Weinberger wrote:
> > Hyunchul,
> > 
> > Am 26.05.2017 um 01:30 schrieb Hyunchul Lee:
> > > From: Hyunchul Lee <cheol.lee@lge.com>
> > > 
> > > for un/freeze support, implement freeze_super and un/freeze_fs
> > > of super_operations.
> > > ubifs_freeze_super just calls freeze_super. because freeze_super always
> > > succeeds if file system is read-only,  UBIFS errors should be checked.
> > > if there are errors, UBIFS is switched to read-only mode.
> > > ubifs_freeze_fs runs commit if TNC/LPT isn't clean. though all writes
> > > are blocked and sync_fs is called before, if commit alreay was started
> > > before writes are blocked, TNC/LPT might have dirty COW nodes.
> > 
> > you explain how you implement that feature, but not why.
> > What is the use-case?
> > I always thought this interface is only being used by LVM.
> 
> Sorry, I forgot this. I implement this to make a backup of some files, and
> support fsfreeze utility and SysRq's freeze/thaw commmand.
> 
> > 
> > Thanks,
> > //richard
> > 
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> -- 
> 
> Thanks,
> Hyunchul
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 

Thanks,
Hyunchul
