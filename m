Received: from mail-ob0-x234.google.com ([2607:f8b0:4003:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VUl9B-0001NK-K8
 for linux-mtd@lists.infradead.org; Fri, 11 Oct 2013 22:25:26 +0000
Received: by mail-ob0-f180.google.com with SMTP id wn1so3224377obc.39
 for <linux-mtd@lists.infradead.org>; Fri, 11 Oct 2013 15:25:02 -0700 (PDT)
Date: Fri, 11 Oct 2013 15:24:59 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: "Shah, Minal" <minal.shah@ti.com>
Subject: Re: MTD utils v1.5.0: MEMERASE64 ioctl failed error
Message-ID: <20131011222459.GQ23337@ld-irv-0074.broadcom.com>
References: <566CE8F1DB913147957287757DA6396B3E9D5FD4@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <566CE8F1DB913147957287757DA6396B3E9D5FD4@DBDE04.ent.ti.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Mukherjee,
 Somnath" <somnath@ti.com>, Mike Frysinger <vapier@gentoo.org>, "Gupta,
 Pekon" <pekon@ti.com>, "Parikh, Urmil" <urmil@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Minal,

On Wed, Oct 09, 2013 at 05:05:11AM +0000, Shah, Minal wrote:
> I am using MTD utils version 1.5.0 for DRA7 (Vayu) platform.
> 
> I have bad blocks in some of my NAND partitions which I am not able to erase from linux kernel.

MTD does not allow erasing bad blocks. This is prohibited by NAND
datasheets. There are occasions where, for debugging purposes, one might
need to erase a "bad" block that is not actually bad, but MTD does not
provide an interface for doing this. An interface for doing so was
discussed a while back, but nothing was merged.

> Using "-N" option in flash_eraseall ideally should have allowed erasing the bad block but I land up in "MEMERASE64 ioctl failed" error. 

"-N" just means that the user-space tool (flash_erase) won't try to skip
bad blocks. But that doesn't circumvent the in-kernel protection that
prevents the erase from succeeding. So the "Input/output" error you see
is completely expected and currently unavoidable, unless you modify your
kernel to remove this protection.

[snip]

So why do you want to erase bad blocks?

Brian
