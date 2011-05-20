Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QNJGa-00046k-Um
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 06:32:57 +0000
Received: by ewy3 with SMTP id 3so1292673ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 19 May 2011 23:32:55 -0700 (PDT)
Subject: Re: [PATCH] UBIFS: don't fail on -EBADMSG when fixing free space
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
In-Reply-To: <BANLkTi=nmvdKNaNDCUUZQF3QX-jDydTSng@mail.gmail.com>
References: <1305196419.2713.84.camel@localhost>
	<1305751647-3122-1-git-send-email-bengardiner@nanometrics.ca>
	<BANLkTi=+V7PR_29pK3ooVggPmeicCG0eWg@mail.gmail.com>
	<BANLkTi=nmvdKNaNDCUUZQF3QX-jDydTSng@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 May 2011 09:29:05 +0300
Message-ID: <1305872945.2630.119.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Matthew L. Creech" <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-05-19 at 09:28 -0400, Ben Gardiner wrote:
> So, at least on my hardware, the -74 error is expected when the 0xff
> pages are not dropped and so without the 'err != -EBADMSG' exception
> the free space fixup will cause the volume to fail mount for me:

Still confused. If you have empty and erased flash, then you program it
with all 0xFFs, you should be able to read it with no errors. If this is
not the case for you, you should fix the driver. UBIFS cannot help in
this case - we consider it as "broken flash driver" case.

I have not read your e-mail carefully because of limited amount of time,
but with quick reading I became confused - too much information :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
