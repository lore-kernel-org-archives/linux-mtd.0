Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRgKn-0001bt-0L
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 07:59:21 +0000
Received: by fxm14 with SMTP id 14so4778964fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 00:59:19 -0700 (PDT)
Subject: Re: -EBADMSG with free-space-fixup flag
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
In-Reply-To: <BANLkTimWafVH_bCJomN1uFW=t4+jRw1L9g@mail.gmail.com>
References: <BANLkTimWafVH_bCJomN1uFW=t4+jRw1L9g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Jun 2011 10:54:54 +0300
Message-ID: <1306914894.4405.56.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, "Matthew L. Creech" <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-05-27 at 17:47 -0400, Ben Gardiner wrote:
> Hi Matthew, Artem,
> 
> Following-up on my problems with the free-space-fixup no da850evm.
> 
> I have done lots of manual testing with u-boot and mtd-utils on-top-of
> 'c724452 UBIFS: switch to dynamic printks' to confirm that there isn't
> an 0xff ECC problem with davinci-nand.
> 
> I found that by the time the -74 is returned for PEB 18, the contents
> on NAND have been replaced.
> 
> I turned on lots of UBIFS debugging and saw that the PEB in question
> is in fact LEB 1; which is geting written to as part of the
> auto-resize of (master)

OK, so we missed the fact that we may have auto-resize before the
fix-up.

> NB: I have ubi attached with --vid-hdr-offset of 2048 because of the
> subpage writing limitations of davinci-nand.

Which means your driver may be incorrect - it should report that it does
not support sub-pages - does it do this? Then UBI will not even try to
use sub-pages and you won't need that option.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
