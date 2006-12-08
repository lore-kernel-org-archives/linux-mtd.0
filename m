Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GsZ5J-0007ty-7j
	for linux-mtd@lists.infradead.org; Fri, 08 Dec 2006 01:19:53 -0500
Subject: Re: Eraseblocks torture: OneNAND results
From: Artem Bityutskiy <dedekind@infradead.org>
To: kyungmin.park@samsung.com
In-Reply-To: <19898399.377451165543227681.JavaMail.weblogic@ep_ml03>
References: <19898399.377451165543227681.JavaMail.weblogic@ep_ml03>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 Dec 2006 08:19:43 +0200
Message-Id: <1165558783.20337.112.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kyungmin,

On Fri, 2006-12-08 at 02:00 +0000, Kyungmin Park wrote:
> Okay, I also try to test attached program for this weekend.
If you use it (which would _very_ be nice!), please, take the latest
version from git. Also, take into account the following notes:

1. Although the documented eraseblock lifetime is about 100000, we
started getting errors after about 6 million erase cycles. May be
because our test is not torturous enough.

2. There is a "check" module option which is enabled by default. It
slows the test down considerably. So I recommend to disable checking at
first, run the test for, say 4 million erase cycles, then re-run it with
checking enabled. So that you first screw up the eraseblocks, then you
start checking data. There is a handy "cycles_count" option.

3. By default the test tortures 32 eraseblocks. You may configure this
via a module parameter. Just glance inside of the torture.c.

> However, I have a question
> There's some strange pattern in log.
> In any case. it can't occur from 0xaa(0b1010) to 0x55(0b0101) since it's =
impossible to change from 0 to 1 even though it's possible from 1 to 0
Yeah, no idea. We didn't check that eraseblock contains all 0xFF bytes
after erase. May be erase operation left some garbage? In the newer
version we do check this.

> Anyway, I also ask the hardware team to check this problem.
Would be cool!

> And also could you send the chip dump data to me? since it takes a long t=
ime to worn-out. I first analyze the worn-out chip data.
I will send you more data.

> If you have any issues or updated news. please let me know.=20
Sure.

P.S.: Test git: git://git.infradead.org/~dedekind/torture.git
Web snout for the Git tree:=20
http://git.infradead.org/?p=3Dusers/dedekind/torture.git;a=3Dsummary

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
