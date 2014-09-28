Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XY2Lt-0001MS-D9
 for linux-mtd@lists.infradead.org; Sun, 28 Sep 2014 00:28:38 +0000
Received: by mail-pa0-f42.google.com with SMTP id bj1so5038582pad.29
 for <linux-mtd@lists.infradead.org>; Sat, 27 Sep 2014 17:28:16 -0700 (PDT)
Date: Sat, 27 Sep 2014 17:28:13 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V2] mtd: spi-nor: add Kconfig option to disable 4K sectors
Message-ID: <20140928002813.GP7362@norris-Latitude-E6410>
References: <1408220271-21455-1-git-send-email-zajec5@gmail.com>
 <1408267646-6643-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1408267646-6643-1-git-send-email-zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 17, 2014 at 11:27:26AM +0200, Rafał Miłecki wrote:
> Current situation with 4K sectors is quite messy. First of all, some
> MTD "users" don't work with such small size. An example may be UBIFS
> which requires 15 KiB erase blocks as a minimum. In theory spi-nor
> should provide multiple erase regions and MTD "users" should use the
> one they need. Unforunately that is not implemented.
> 
> In the result our flashes database in spi-nor is hackish. For some
> flashes we pretend they don't support 4K sectors just because some
> distribution uses UBIFS on it. This ofc leads to conflicts, like
> Samsung using w25q128 with 4K sectors vs. OpenWrt requiring it to
> pretend it's 64 KiB blocks only.
> 
> My idea (plan?) for fixing this situation:
> 1) Use real hw info (this requires a way for disabling 4K for now)
> 2) Provide detailed info about erase regions
> 3) Make UBIFS work with devices that support 4K sectors
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> ---
> V2: Add extra info about performance in Kconfig. Thanks Kevin.
>     Fix typo s/users/uses/ in commit message.

Pushed to l2-mtd.git. Thanks!

Now we should probably try to handle (1), at least, so that the data
table holds fully accurate info about the flash.

Brian
