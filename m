Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OhIev-0005At-Rz
	for linux-mtd@lists.infradead.org; Fri, 06 Aug 2010 08:52:10 +0000
Received: by iwn3 with SMTP id 3so1200019iwn.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 Aug 2010 01:52:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTilQGyVU4-_ipLDN3p5B6856jvugY9mKq9feWr9G@mail.gmail.com>
References: <AANLkTinAXEkD4_sYtGAojAuecpkiTlxyylxLlQP2i_9D@mail.gmail.com>
	<AANLkTilQGyVU4-_ipLDN3p5B6856jvugY9mKq9feWr9G@mail.gmail.com>
Date: Fri, 6 Aug 2010 10:52:08 +0200
Message-ID: <AANLkTik3emBFUbohWqjjBcuKWJFYDs8CDYiV+SJiO4Ro@mail.gmail.com>
Subject: Re: uncorrectable error :
From: Arno Steffen <arno.steffen@googlemail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/7/6 Arno Steffen <arno.steffen@googlemail.com>:
> I know this is not a good solution but for now I decided to do a
> reboot, when this by "incorrectable error" occurs, as it will
> disappear than.
> Nevertheless I would be happy if one of the experts here could give me
> some advice.
>

Solved the issue, timing problem in OMAP. There is a kernel patch available.
NAND timing violation: Specific patch that address the NAND timing
issue is available as part of PSP 03.00.01.06
(http://arago-project.org/git/people/?p=sriram/ti-psp-omap.git;a=commit;h=d04b6a46438de949570bf490089266192fa725c2)
