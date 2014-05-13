Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wk8dH-0007Oj-DX
 for linux-mtd@lists.infradead.org; Tue, 13 May 2014 09:04:21 +0000
Message-ID: <1399971821.1797.24.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: add a ubi forced detach ioctl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Luka Perkov <luka@openwrt.org>
Date: Tue, 13 May 2014 12:03:41 +0300
In-Reply-To: <20140512104400.GA24995@w500.lan>
References: <1399850250-24616-1-git-send-email-luka@openwrt.org>
 <CAFLxGvy+5udxOnRmEeKbHGr=z3a0H+vK07r+PbQdHiUkcJivQA@mail.gmail.com>
 <53709292.6070600@phrozen.org> <20140512104400.GA24995@w500.lan>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 John Crispin <blogic@openwrt.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 John Crispin <john@phrozen.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-05-12 at 12:44 +0200, Luka Perkov wrote:
> When running ubi rootfs upgrade on nand based OpenWrt device after
> pivot_root init process is still "hooked" on the old file system. Thus,
> the old file system can not be umounted. If the filesystem is mounted it
> can not be upgraded with using for example ubiupdatevol or removed with
> ubirmvol. Forcing umount would allow to run the before mentioned
> commands.

Generally, a change like this may be fine, but I'd like to see more
detailed description and analysis, which points to how other kernel
subsystems deal with this.

-- 
Best Regards,
Artem Bityutskiy
