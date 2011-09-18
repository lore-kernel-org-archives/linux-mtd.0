Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R57WA-0001F2-7Y
	for linux-mtd@lists.infradead.org; Sun, 18 Sep 2011 02:54:06 +0000
Received: by bkat2 with SMTP id t2so5048227bka.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 17 Sep 2011 19:54:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE8JOLPeHn6m9cfQbisuBT2mJVeTAw6ONiF=pTKGSufgPg@mail.gmail.com>
References: <1314820839-7107-1-git-send-email-computersforpeace@gmail.com>
	<1314820839-7107-4-git-send-email-computersforpeace@gmail.com>
	<CAMjpGUc4WemgB6sWeChR3dp2mWsaSQUDKmKOfE=C9FBdzfuc1w@mail.gmail.com>
	<CAN8TOE8JOLPeHn6m9cfQbisuBT2mJVeTAw6ONiF=pTKGSufgPg@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Sat, 17 Sep 2011 22:53:43 -0400
Message-ID: <CAMjpGUcO1+F_2dX0hvy4FGq-d4V+eSJLC=NV=ANX_Tm=0z3Svw@mail.gmail.com>
Subject: Re: [PATCH 03/10] nandwrite: consolidate buffer usage
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, Sep 14, 2011 at 14:22, Brian Norris wrote:
> On Wed, Sep 14, 2011 at 1:15 AM, Mike Frysinger wrote:
>> On Wed, Aug 31, 2011 at 16:00, Brian Norris wrote:
>>> Instead of using two different output buffers for OOB data, let's just
>>> use the same one for all output. This adds an extra memcpy, but it
>>> simplifies some future work, so it's worth it.
>>
>> could it be done by pulling out the pointer ? =C2=A0make oobbuf a "char =
*",
>> rename existing oobbuf to like "char _oobbuf[]", and then assign
>> oobbuf to the relevant buffer and assume it's always set ...
>
> It could be done this way, but actually, this patch was not intended
> to stand alone; it was a precursor to removing one of the buffers from
> nandwrite.c

if the useless memcpy is removed by way of future patches, then this is fin=
e
-mike
