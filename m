Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wjnij-0003Zg-AQ
 for linux-mtd@lists.infradead.org; Mon, 12 May 2014 10:44:35 +0000
Date: Mon, 12 May 2014 12:44:00 +0200
From: Luka Perkov <luka@openwrt.org>
To: John Crispin <john@phrozen.org>
Subject: Re: [PATCH] UBI: add a ubi forced detach ioctl
Message-ID: <20140512104400.GA24995@w500.lan>
References: <1399850250-24616-1-git-send-email-luka@openwrt.org>
 <CAFLxGvy+5udxOnRmEeKbHGr=z3a0H+vK07r+PbQdHiUkcJivQA@mail.gmail.com>
 <53709292.6070600@phrozen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53709292.6070600@phrozen.org>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 John Crispin <blogic@openwrt.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 12, 2014 at 11:21:22AM +0200, John Crispin wrote:
> This is a ugly temporary patch that we carry around in openwrt until we
> have a real fix. why are you trying to upstream this ?

I didn't think this is a hack, other file systems can force umount as
well. What are you proposing as a real fix?
 
> Additionally the patch was written by Daniel and not me so the SoB is
> wrong.

I took it from OpenWrt and it was commited there with your SoB and
Daniel was not mentioned there.

> On 12/05/2014 09:14, Richard Weinberger wrote:
> > On Mon, May 12, 2014 at 1:17 AM, Luka Perkov <luka@openwrt.org> 
> > wrote:
> >> From: John Crispin <blogic@openwrt.org>
> >> 
> >> Signed-off-by: John Crispin <blogic@openwrt.org> Tested-by: Luka 
> >> Perkov <luka@openwrt.org> CC: Artem Bityutskiy 
> >> <dedekind1@gmail.com>
> > 
> > The changelog fails to describe why you need this new ioctl() and 
> > what problem this patch is solving.

When running ubi rootfs upgrade on nand based OpenWrt device after
pivot_root init process is still "hooked" on the old file system. Thus,
the old file system can not be umounted. If the filesystem is mounted it
can not be upgraded with using for example ubiupdatevol or removed with
ubirmvol. Forcing umount would allow to run the before mentioned
commands.

Luka
