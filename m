Received: from [2a01:4f8:131:30e2::2] (helo=nbd.name)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wk8jD-0001h8-OR
 for linux-mtd@lists.infradead.org; Tue, 13 May 2014 09:10:28 +0000
Message-ID: <5371E156.1090200@phrozen.org>
Date: Tue, 13 May 2014 11:09:42 +0200
From: John Crispin <john@phrozen.org>
MIME-Version: 1.0
To: dedekind1@gmail.com, Luka Perkov <luka@openwrt.org>
Subject: Re: [PATCH] UBI: add a ubi forced detach ioctl
References: <1399850250-24616-1-git-send-email-luka@openwrt.org>	
 <CAFLxGvy+5udxOnRmEeKbHGr=z3a0H+vK07r+PbQdHiUkcJivQA@mail.gmail.com>	
 <53709292.6070600@phrozen.org> <20140512104400.GA24995@w500.lan>
 <1399971821.1797.24.camel@sauron.fi.intel.com>
In-Reply-To: <1399971821.1797.24.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 John Crispin <blogic@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 13/05/2014 11:03, Artem Bityutskiy wrote:
> On Mon, 2014-05-12 at 12:44 +0200, Luka Perkov wrote:
>> When running ubi rootfs upgrade on nand based OpenWrt device
>> after pivot_root init process is still "hooked" on the old file
>> system. Thus, the old file system can not be umounted. If the
>> filesystem is mounted it can not be upgraded with using for
>> example ubiupdatevol or removed with ubirmvol. Forcing umount
>> would allow to run the before mentioned commands.
> 
> Generally, a change like this may be fine, but I'd like to see
> more detailed description and analysis, which points to how other
> kernel subsystems deal with this.
> 

Hi Artem,

agreed, this patch is an interim hack we did to make a new piece of
code work that helps us to sysupgrade the ubi when a new openwrt
release is flashed. this tool is far from complete and is still
missing a lot of details. once we are done and know if this patch
makes sense in its current form we will let you know and resend this
or an alternate patch with a proper description.

Would that be ok with you ?

	John
