Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XbW6p-00075E-FQ
 for linux-mtd@lists.infradead.org; Tue, 07 Oct 2014 14:51:27 +0000
Date: Tue, 7 Oct 2014 11:49:41 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Andrew Murray <amurray@embedded-bits.co.uk>
Subject: Re: UBI_READWRITE constraint when opening volumes to rename
Message-ID: <20141007144940.GA13788@arch.hh.imgtec.org>
References: <CAPcvp5E=MgV0-f8q9SFuMCzCEt-WVQiEu4XGJXj2QLyf5L1ohw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPcvp5E=MgV0-f8q9SFuMCzCEt-WVQiEu4XGJXj2QLyf5L1ohw@mail.gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07 Oct 03:31 PM, Andrew Murray wrote:
> Hello,
> 
> I'd like to be able to safely rename a UBI volume that contains a
> mounted UBIFS volume.
> 
> This allows for firmware upgrade via the following steps:
> 
> - ubimkvol rootfs_new
> - ubiupdatevol rootfs_new
> - ubirename rootfs rootfs_old rootfs_new rootfs
> - reboot
> - ubirmvol rootfs_old
> 
> Such an approach makes upgrade of a root filesystem simple as there is
> no need to unmount the root filesystem. I believe this question has
> been asked before on this mailing list
> (http://lists.infradead.org/pipermail/linux-mtd/2012-February/039743.html).
> 
> This process isn't possible at the moment as 'rename_volumes' opens
> the UBI volume with UBI_READWRITE. Unfortunately UBIFS always opens
> UBI with UBI_READWRITE regardless to if the user mounts as read-only.
> If 'rename_volumes' is changed to UBI_READONLY then the above process
> works.
> 

Maybe there's some way to tell UBIFS to pause any writes and switch
to read-only temporarily, while the rename takes place?

Does this make any sense?

> I understand that this patch
> https://patchwork.ozlabs.org/patch/339711/ recently changed the first
> open restraint in 'rename_volumes' from UBI_EXCLUSIVE to
> UBI_READWRITE. I'd like to understand if there are any risks in
> changing it to UBI_READONLY?
> 

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
