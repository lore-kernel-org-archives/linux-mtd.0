Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q2Rvo-0000m8-QA
	for linux-mtd@lists.infradead.org; Wed, 23 Mar 2011 17:33:18 +0000
Received: by wwc33 with SMTP id 33so7264630wwc.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Mar 2011 10:33:14 -0700 (PDT)
Subject: Re: [RFC] Handling of errors for AMD NOR (cfi_cmdset_0002) chips
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Detlev Zundel <dzu@denx.de>
In-Reply-To: <m27hbpyh36.fsf@ohwell.denx.de>
References: <4D797E23.6070409@emcraft.com> <4D79DC90.6070600@aimvalley.nl>
	<m27hbpyh36.fsf@ohwell.denx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 23 Mar 2011 19:33:11 +0200
Message-ID: <1300901591.2257.3.camel@koala>
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

On Wed, 2011-03-23 at 16:47 +0100, Detlev Zundel wrote:
> Hi Norbert,
> 
> > What issue you have with NOR flash and UBIFS ?
> 
> We're still working on the issue initially reported by Anatolij here:
> 
> http://thread.gmane.org/gmane.linux.drivers.mtd/33832

Note, I've started implementing the power cut emulation in UBI to
emulate power cuts and unstable bits. It is work in progress, I keep it
in the 'devel' branch of ubi-2.6.git tree.

The plan is then to implement user-space test, probably improving the
integck test, and then start fixing the issues.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
