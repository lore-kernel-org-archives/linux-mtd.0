Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QN5dh-00064I-VJ
	for linux-mtd@lists.infradead.org; Thu, 19 May 2011 15:59:54 +0000
Received: by vws8 with SMTP id 8so2550887vws.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 May 2011 08:59:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTi=nmvdKNaNDCUUZQF3QX-jDydTSng@mail.gmail.com>
References: <1305196419.2713.84.camel@localhost>
	<1305751647-3122-1-git-send-email-bengardiner@nanometrics.ca>
	<BANLkTi=+V7PR_29pK3ooVggPmeicCG0eWg@mail.gmail.com>
	<BANLkTi=nmvdKNaNDCUUZQF3QX-jDydTSng@mail.gmail.com>
Date: Thu, 19 May 2011 11:59:52 -0400
Message-ID: <BANLkTimiELh42LKgjicvh7jvXVfHeFE6MA@mail.gmail.com>
Subject: Re: [PATCH] UBIFS: don't fail on -EBADMSG when fixing free space
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Adrian Hunter <adrian.hunter@nokia.com>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 19, 2011 at 9:28 AM, Ben Gardiner
<bengardiner@nanometrics.ca> wrote:
>
> So I guess my particular situation is a problem with the davinci nand
> driver's ECC for 0xFF data and is _not_ covered by the free space
> fixup?
>

Yeah, that's what it sounds like.

Can you reproduce the -EBADMSG with a simpler test case that leaves
UBI/UBIFS out of the equation?  Maybe enable write-verify in U-Boot
and try using "nand write" again, or use mtd-utils "nandwrite" from an
initramfs image then try to read back the data -- that should give a
simpler test case that shows whether the ECC handling of empty space
is wrong.

If so, that probably needs to be fixed at the MTD level, since it will
affect more than this particular UBIFS case.

-- 
Matthew L. Creech
