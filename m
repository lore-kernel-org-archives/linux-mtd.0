Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IVoYg-0002uh-GU
	for linux-mtd@lists.infradead.org; Thu, 13 Sep 2007 09:16:41 -0400
Subject: Re: UBI : Atomic change LEB
From: Artem Bityutskiy <dedekind@infradead.org>
To: Brijesh Singh <brijesh.s.singh@gmail.com>
In-Reply-To: <6b5362aa0709130602g61e9b6f0xa762be770e95a32b@mail.gmail.com>
References: <6b5362aa0709130102o5042412fgab0e0558edc895c0@mail.gmail.com>
	<1189682032.14370.117.camel@sauron>
	<6b5362aa0709130602g61e9b6f0xa762be770e95a32b@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 13 Sep 2007 16:16:28 +0300
Message-Id: <1189689388.14370.124.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-09-13 at 18:32 +0530, Brijesh Singh wrote:
> Thank you Artem.
> This seems like a good idea.This will certainly work
> .
> The only problem I see is
> * this will serialize  all the automic changes.If some device supports
> multiple writes in parrallel,we are locking it for no reason(We have
> reason but hope we can find another option).Also we won't need
> serialization when there are lots of spare blocks.

Well, this is not a big problem with the existing code base: mtd anyway
locks whole chip when doing I/O, and there are not users of this call
except of UBIFS which will not suffer much.

Also, if this is a problem for someone, we can always reserve N PEBs
for the atomic LEB change operation, and allow N tasks to do this
operation at a time. This is not difficult, we just need to use
something a bit more complex then a mutex.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
