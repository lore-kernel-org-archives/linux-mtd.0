Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rlp9s-0000A6-Hv
 for linux-mtd@lists.infradead.org; Fri, 13 Jan 2012 21:59:37 +0000
Received: by eeke50 with SMTP id e50so392050eek.36
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2012 13:59:34 -0800 (PST)
Subject: Re: [PATCH] libmtd: Variable name same as function name causing
 compile to fail (Android)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Thomas Cannon <mail@thomascannon.net>
Date: Fri, 13 Jan 2012 23:59:32 +0200
In-Reply-To: <CAGaKrsmCb6jHZ+oYjQiV8kU63-DQMpzwTG4pR-Jf_aTE1K2=NQ@mail.gmail.com>
References: <CAGaKrsmCb6jHZ+oYjQiV8kU63-DQMpzwTG4pR-Jf_aTE1K2=NQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1326491973.2258.1.camel@koala>
Mime-Version: 1.0
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

On Mon, 2012-01-09 at 16:20 +0000, Thomas Cannon wrote:
> When compiling mtd-utils against Android's bionic libc using the
> supplied cross compiler environment it errors:
> 
> lib/libmtd.c: In function 'dev_node2num':
> lib/libmtd.c:444: error: called object 'major' is not a function
> lib/libmtd.c:445: error: called object 'minor' is not a function
> lib/libmtd.c: In function 'mtd_probe_node':
> lib/libmtd.c:1384: error: called object 'major' is not a function
> lib/libmtd.c:1385: error: called object 'minor' is not a function
> 
> This patch updates the variable names for "major" and "minor" in two
> places. It then compiles cleanly.

I've tweaked the patch a bit and picked different names: mjr and mnr
instead of strange majorx and minorx. I've also re-named major1 and
minor1 variables for consistency.

Pushed to mtd-utils.git, thanks!

Artem.
