Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QAFnA-0001Qo-Tg
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2011 06:12:38 +0000
Received: by eyh6 with SMTP id 6so430261eyh.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Apr 2011 23:12:34 -0700 (PDT)
Subject: Re: mtd-utils: "flash_erase -j" failes with "unable to get NAND
	oobinfo" on large flash chips.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daid <daid303@gmail.com>
In-Reply-To: <BANLkTinozqCrqaDGsAX-gWWUg2G3bvg_Rg@mail.gmail.com>
References: <BANLkTinozqCrqaDGsAX-gWWUg2G3bvg_Rg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 14 Apr 2011 09:09:43 +0300
Message-ID: <1302761383.2796.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-04-12 at 11:58 +0200, Daid wrote:
> I've made a patch to fix flash_erase with large flash chips.
> flash_erase uses MEMGETOOBSEL which no longer works if the ECC area is
> larger then 32 bytes. ECCGETLAYOUT is the replacement ioctl.
> 
> This patch is based on the work of Stanley Miao, he made a patch in
> June 2010 for flash_eraseall.
> http://lists.infradead.org/pipermail/linux-mtd/2010-June/031981.html
> I've implemented the backwards compatibility differently, checking
> kernel versions doesn't feel correct.

Hi Daid, would you please use libmtd instead? If libmtd does not have
some functionality you need - just add it there.

The thing is that we are trying to unify this stuff a little.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
