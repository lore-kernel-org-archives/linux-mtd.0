Received: from desire.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B78TL-00025F-Uv
	for linux-mtd@lists.infradead.org; Sat, 27 Mar 2004 07:43:16 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: David Updegraff <dave@cray.com>, llandre <r&d@wawnet.biz>
Date: Sat, 27 Mar 2004 19:52:21 +1200
References: <6.0.1.1.0.20040326125338.01f8bab8@dns.struinfo.it>
	<406456BC.1020802@cray.com>
In-Reply-To: <406456BC.1020802@cray.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20040327074312.2E932174C6@desire.actrix.co.nz>
cc: linux-mtd@lists.infradead.org
Subject: Re: Large block NANDs - preliminary diff (2)
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I agree with the concepts expressed here. Indeed, this is the approach I am 
taking with YAFFS2.

-- CHarles

On Saturday 27 March 2004 04:13, David Updegraff wrote:
> llandre.
>
> Thanks for your work and patch.  I may well be deluded, but aside from
> the large-page-inefficiencies vis.a.vis. file system allocations, it
> still seems to me we have some OOB troubles with the existing API.
> Because oob layout is exported, whereas I think oob layout should be
> hidden in the driver.
>
>  From what I see, there are three reasons for anyone outside the driver
> to know about oob: ecc, badblock and fs-specific data.
>
> For ecc, they only need to set ON or off for the whole chip, for
> badblock its a boolean per page or block.  And FSDATA is some stuff that
>   the filesystem wants to scribble on its own, that the driver does not
> interpret.
>
> For ecc, there is already an ioctl that can set it generically, if you
> ignore the .eccpos bytes.  And badblock also has a function pointer in
> the driver.
>
> What remains is a way for the filesystem drivers to scribble their own
> bytes of data per page or block.  IMHO they should be able to do this
> independently.  Perhaps that the officially PUBLISHED oobsize and
> oob_buf stuff currently in place should infact refer to those regions of
> the oob that are OUTSIDE of the internal-driver-managed oob regions
> dedicated to badblock marking or ecc tracking. The driver always does
> its own ecc calculations anyway: why even let anyone else see that area?
>
> But yes; I know; references to the oob stuff is sprinkled everywhere,
> and it'll probably be short-term easier to just add another case:
> here&there.
>
> -dbu.
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
