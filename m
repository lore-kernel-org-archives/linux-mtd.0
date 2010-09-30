Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P1D6H-0007hD-3X
	for linux-mtd@lists.infradead.org; Thu, 30 Sep 2010 06:58:42 +0000
Received: by bwz19 with SMTP id 19so1559404bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Sep 2010 23:58:39 -0700 (PDT)
Subject: Re: [PATCH 1/3] mtd-utils: new memory wrappers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <AANLkTin0Fxd+oSEMNNc6zdNusJUUPRaZ1vgPR1vvThXi@mail.gmail.com>
References: <1285803024-13572-1-git-send-email-vapier@gentoo.org>
	<1285822785.11684.11.camel@localhost>
	<AANLkTimzVA06P8GR4Gy_2PSFDXKnzTOHPj2qr+_X__zw@mail.gmail.com>
	<1285825735.11684.22.camel@localhost>
	<AANLkTi=E6qy2sBq1thXMUWfxSbCuNZDUOmmGT8o0j0hW@mail.gmail.com>
	<1285826499.11684.24.camel@localhost>
	<AANLkTin0Fxd+oSEMNNc6zdNusJUUPRaZ1vgPR1vvThXi@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 30 Sep 2010 09:56:32 +0300
Message-ID: <1285829792.11684.47.camel@localhost>
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

On Thu, 2010-09-30 at 02:18 -0400, Mike Frysinger wrote:
> issues (not good or bad, but just are):
>  - change "#define PROGRAM_NAME" to "const char program_name[]"
>  - errors thrown up by libraries would be flagged as part of the
> program, and not part of the library (i.e. libubifs)
>  - unused functions would take up space in final exe
> 
> the first is easy to change.  the 2nd i think is OK (and maybe even
> less confusing for the user when reviewing error output).  the 3rd i'd
> like to make sure we address.
> 
> two possible solutions to 3rd one.  one ugly but portable, one nice
> but gnu-specific.  although we already use gnu-specific code and
> flags, so maybe that isnt an issue (no one has complained yet).
> 
> ugly: create lib/common/ and put every function into its own file and
> merge into libmtd.a.  linker only pulls in objects (funcs) when
> needed.
> nice: use -ffunction-sections -fdata-sections -Wl,--gc-sections.
> additional advantage of saving space across all linked in library code
> and not just common.h stuff.

Sorry, I never dealt with -ffunction-sections stuff, I do not know the
price of this, so I basically cannot judge. But of course removing
unused code is a good thing to do. So you seem to be more competent in
these question, just go ahead with you nice cleanups!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
