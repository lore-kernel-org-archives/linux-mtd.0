Received: from lgeamrelo12.lge.com ([156.147.23.52])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFX2p-00064M-UO
 for linux-mtd@lists.infradead.org; Tue, 30 May 2017 02:38:05 +0000
Date: Tue, 30 May 2017 11:37:40 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, kernel-team@lge.com,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] ubifs: Add freeze support
Message-ID: <20170530023740.GA15808@sebu>
References: <1495755004-17036-1-git-send-email-hyc.lee@gmail.com>
 <20170527082338.GC32125@infradead.org>
 <20170529004346.GA10215@sebu> <20170529022444.GA11814@sebu>
 <8e61baf3-a78e-d17f-ebe2-cd56d6c52259@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e61baf3-a78e-d17f-ebe2-cd56d6c52259@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 29, 2017 at 10:42:37AM +0200, Richard Weinberger wrote:
> Hyunchul,
> 
> Am 29.05.2017 um 04:24 schrieb Hyunchul Lee:
> >>> This is just broken.  First ubifs should still properly propagate
> >>> the errors, and second freezing/unfreezing read only file systems is
> >>> perfectly valid, 
> >>
> >> it is right.
> > 
> > if updating TNC is failed, ubifs might become inconsistant and be switched to 
> > read-only mode. for example, when ubifs_jnl_update is called to create a file, 
> > if inserting a znode for new inode is failed, TNC has only a znode for 
> > new dentry. and this can be only recoverd by replay.
> > 
> > is it required to fix this?
> 
> UBIFS is designed to be power-cut tolerant.
> So, UBIFS must not corrupt in any case.
> 
> Which failure are you facing?
> 
> I have the feeling that you try to paper over some other issue. :-)

The failure hasn't happened. I wondered the following situation
should be handled.

ubifs_create
  ubifs_jnl_update
    write_head
    ubifs_tnc_add_nm  /* (1) add dentry to TNC */
    ubifs_tnc_add     /* (2) add new inode to TNC */
    ubifs_tnc_add     /* (3) add parent inode to TNC */

If ubifs_tnc_add(2) fails, TNC would have the index of a dentry 
which points to an invalid inode. So, though ubifs_readdir
emits the dentry, this inode cannot be accessed. Becasue
there isn't the index of the inode.

I know this situation is hardly probable. But UBIFS would
be read-only and inconsitant in this situation, until replay
is completed.

> 
> Thanks,
> //richard

-- 

Thanks,
Hyunchul
