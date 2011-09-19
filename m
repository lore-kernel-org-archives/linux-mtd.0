Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R5iv2-0002d2-IK
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2011 18:50:17 +0000
Received: by wyh11 with SMTP id 11so7098871wyh.22
	for <linux-mtd@lists.infradead.org>;
	Mon, 19 Sep 2011 11:50:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMjpGUcO1+F_2dX0hvy4FGq-d4V+eSJLC=NV=ANX_Tm=0z3Svw@mail.gmail.com>
References: <1314820839-7107-1-git-send-email-computersforpeace@gmail.com>
	<1314820839-7107-4-git-send-email-computersforpeace@gmail.com>
	<CAMjpGUc4WemgB6sWeChR3dp2mWsaSQUDKmKOfE=C9FBdzfuc1w@mail.gmail.com>
	<CAN8TOE8JOLPeHn6m9cfQbisuBT2mJVeTAw6ONiF=pTKGSufgPg@mail.gmail.com>
	<CAMjpGUcO1+F_2dX0hvy4FGq-d4V+eSJLC=NV=ANX_Tm=0z3Svw@mail.gmail.com>
Date: Mon, 19 Sep 2011 11:50:14 -0700
Message-ID: <CAN8TOE82sudcyUc7RTxLT4UrDXQzKSpX6MSw-FD9WqNEfy33Ng@mail.gmail.com>
Subject: Re: [PATCH 03/10] nandwrite: consolidate buffer usage
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: b35362@freescale.com, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Sep 17, 2011 at 7:53 PM, Mike Frysinger <vapier.adi@gmail.com> wrote:
> if the useless memcpy is removed by way of future patches, then this is fine

It's not completely removed. Please see patch 07.

I'll summarize: the memcpy is moved out of the main code path so that
if ioctl(MEMWRITE) is supported in your kernel, you have no extra
memcpy's. However, I didn't optimize the original code, which uses the
standard write+ioctl(MEMWRITEOOB[64]); it still has the useless memcpy
that we are discussing.

I'm not sure if/how your solution can work embedded at that level of
libmtd. Perhaps some functions I moved around need to be restructured
a bit.

Brian
