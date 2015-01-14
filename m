Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBTTc-0007II-NV
 for linux-mtd@lists.infradead.org; Wed, 14 Jan 2015 19:19:38 +0000
Received: by mail-pd0-f178.google.com with SMTP id r10so11432896pdi.9
 for <linux-mtd@lists.infradead.org>; Wed, 14 Jan 2015 11:19:10 -0800 (PST)
Date: Wed, 14 Jan 2015 11:19:07 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Daniel Ehrenberg <dehrenberg@google.com>
Subject: Re: [PATCH] mtd: Add config option to skip scanning bad blocks in
 partitions
Message-ID: <20150114191907.GX9759@ld-irv-0074>
References: <1421206498-28826-1-git-send-email-dehrenberg@chromium.org>
 <alpine.DEB.2.02.1501140846310.27318@lnxricardw1.se.axis.com>
 <CAAK6Zt29rv0CSC42BbpULP=rwzSGUWcxBC=ewg5aX03JoCjzCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAK6Zt29rv0CSC42BbpULP=rwzSGUWcxBC=ewg5aX03JoCjzCg@mail.gmail.com>
Cc: "grundler@chromium.org" <grundler@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "gwendal@chromium.org" <gwendal@chromium.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 "ezequiel@vanguardiasur.com.ar" <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 14, 2015 at 10:08:51AM -0800, Daniel Ehrenberg wrote:
> To initialize the partitions, it takes me 3.5s with this config option
> turned on and .2s with the config option turned off. So a large
> proportion of the NAND startup time (not counting ubi coming up) is
> comes from this bad block scan. It takes about 1.87s to scan over the
> device, and I have my partitioning set up so there's an extra
> partition covering the whole device in addition to the individual
> partitions.

Why don't you have BBT enabled? Even if it's just in-memory (not
on-flash), you should only have to scan the entire flash once (not once
for each partition), after which every subsequent lookup should only be
a memory access. That'd cut your time in half already, I expect. But if
you use the on-flash BBT (NAND_BBT_USE_FLASH), then you should only have
to scan the flash once per flash lifetime, after which the bad block
information will be stored in just a few pages, and should take only a
millisecond or two to read.

(There are other reasons for using on-flash BBT, but I won't detail them
here.)

I also recall the bad block scanning process will read not just the
spare area, but actually the full 1st page. So that might cause a little
unnecessary slowness.

All in all, I think it's highly unlikely that your patch is necessary.
There are much better ways to get you a faster boot time.

Brian
