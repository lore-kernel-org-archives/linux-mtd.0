Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QHLtU-0002w2-R0
	for linux-mtd@lists.infradead.org; Tue, 03 May 2011 20:08:29 +0000
Received: by pwi8 with SMTP id 8so244528pwi.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 03 May 2011 13:08:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1303457781.2757.26.camel@localhost>
References: <BANLkTi=b6XGamVPAfuQZJo=sRQy286xh0g@mail.gmail.com>
	<1303457781.2757.26.camel@localhost>
Date: Tue, 3 May 2011 16:08:26 -0400
Message-ID: <BANLkTinscG0a3mOwvCwQOLKRNoabStkOYg@mail.gmail.com>
Subject: Re: JFFS2 loss of power expectations
From: Cliff Brake <cliff.brake@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 22, 2011 at 3:36 AM, Artem Bityutskiy <dedekind1@gmail.com> wro=
te:
> Hi,
>
> On Fri, 2011-04-22 at 01:05 -0400, Cliff Brake wrote:
>> I'm helping debug a system that is running the 2.6.27 kernel with
>> JFFS2 (with summary) on SLC NAND. =A0The CPU is a PXA270 (cm-x270), and
>> appears to be using NAND_ECC_SOFT. =A0We are experiencing some file
>> system corruption if we lose power when the system is booting up.
>> There is some amount of file system activity when udev and other
>> system components start, but overall there is not much that is being
>> written to the file system.
>>
>> A few questions:
>>
>> 1) should this combination be fairly robust to power failure (are
>> failures expected, or possible)?
>
> Probably, but you have to test this anyway.
>
> 1. Despite JFFS2 is considered old and robust - it is not maintained
> very well for the last couple of years.
> 2. SLC NANDs in the past were more robust than modern SLCs and new
> challenges like unstable bits may have changed the situation with JFFS2
> robustness.
>
> So - test it.
>
>> 2) any suggestions for debugging this?
>
> Some kind of device which may cut power is needed. Then you may write a
> test program or script, cut power at random point, boot up, make sure
> the FS look ok.

Yes, we have a programmable PS set up to cut power during boot, and we
can reproduce JFFS2 file system corruption with a day or so of
testing.  We are using a fairly old CPU board with a small SLC flash
(128MB).

Now, the question is how do we prevent it?

We are looking into mounting the root file system in RO and sync
modes, etc, but don't have test results yet.

So, just looking for general ideas how to improve this situation.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com
