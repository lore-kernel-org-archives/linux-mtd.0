Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1IzDBi-0004BW-6J
	for linux-mtd@lists.infradead.org; Mon, 03 Dec 2007 15:26:32 +0000
Date: Mon, 3 Dec 2007 16:20:53 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Matt Reimer <mattjreimer@gmail.com>
Subject: Re: [PATCH] MTD: fix s3c2410 error correction
Message-ID: <20071203152049.GA15000@lazybastard.org>
References: <1192755764-26269-1-git-send-email-mattjreimer@gmail.com>
	<f383264b0711291110k6e61ec29n212be5d4b059833e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f383264b0711291110k6e61ec29n212be5d4b059833e@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 29 November 2007 11:10:41 -0800, Matt Reimer wrote:
> On Oct 18, 2007 5:02 PM, Matt Reimer <mattjreimer@gmail.com> wrote:
> > From: Matt Reimer <mreimer@vpop.net>
> >
> > The single-bit error correction was, well, incorrect. For determing which
> > bit to correct it was using P1' P2' P4' P8' instead of P1 P2 P4 P8, and
> > it was using P16' P32' P64' P128' P256' P512' P1024' P2048' instead of
> > P16 P32 P64 P128 P256 P512 P1024 P2048.
> 
> Is there any chance of this getting committed? It has been confirmed
> to be needed on s3c2440 and s3c2412.

Ok, I'm getting sick of this.  Even though I didn't fully review the
patch, I'll gladly take the chances of breaking something and
complaining to Matt afterwards.  Certainly beats ignoring this patch for
all eternity.

Acked-by: Joern Engel <joern@logfs.org>

Jörn

-- 
You ain't got no problem, Jules. I'm on the motherfucker. Go back in
there, chill them niggers out and wait for the Wolf, who should be
coming directly.
-- Marsellus Wallace
