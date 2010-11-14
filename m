Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PHXLo-0005eE-JE
	for linux-mtd@lists.infradead.org; Sun, 14 Nov 2010 07:50:13 +0000
Received: by bwz5 with SMTP id 5so4471277bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Nov 2010 23:50:11 -0800 (PST)
Subject: Re: ubi deadlock on .36+
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Grazvydas Ignotas <notasas@gmail.com>
In-Reply-To: <AANLkTimOqCaPB2gyCaBS2DxFAnkD_rGv+R=p5pD5c2hX@mail.gmail.com>
References: <AANLkTimKc_EtT6NEwbga8g7AKoGnDSt7UMQwgou_jCXD@mail.gmail.com>
	<1288855749.2075.7.camel@localhost>
	<AANLkTim-+_98Ezcn3dG5g0mzNLNVrkDKC2f_34A_n2pE@mail.gmail.com>
	<1289651831.2218.48.camel@localhost>
	<1289654101.2218.51.camel@localhost>
	<AANLkTimOqCaPB2gyCaBS2DxFAnkD_rGv+R=p5pD5c2hX@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 14 Nov 2010 09:50:07 +0200
Message-ID: <1289721007.1978.1.camel@koala>
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

On Sat, 2010-11-13 at 16:23 +0200, Grazvydas Ignotas wrote:
> On Sat, Nov 13, 2010 at 3:15 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > While trying to figure out what is happening in your system, I realized
> > one possible scenario which may confuse UBI. I've added a patch below.
> > This probably won't fix your issue (but you could try), I need more time
> > to think about what was happening. But a log with all messages (not only
> > I/O) would help. Thanks.
> 
> Well I think I already know what's wrong with my driver - it has
> subpage reads broken. So UBI tries to read a subpage, driver fails
> there, then it runs a torture test on full PEB that passes (because
> page reads work right), marks that PEB as good and retries the subpage
> read that fails again, and the story repeats. Does that sound like
> reasonable scenario, or do you still want more debugging logs?

Yaeah, obviously you have driver problems, I'm just interested to
improve UBI's resilience.
 
-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
