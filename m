Received: from fmmailgate05.web.de ([217.72.192.243])
 by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RIS7J-0006Po-Ke
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2011 21:31:34 +0000
From: "Roland Kletzing" <devzero@web.de>
To: "Wolfram Sang" <w.sang@pengutronix.de>, dedekind1@gmail.com
Message-ID: <1410459321.1756342.1319491889412.JavaMail.fmail@mwmweb015>
Subject: Re: [BUG] Re: mtd_stresstest module bricked my dockstar
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Willy Tarreau <w@1wt.eu>, adrian.hunter@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Mon, 24 Oct 2011 21:31:34 -0000

>> > Anyway - what would people think if linux had a kernel module which wi=
pes
>> > /dev/sda1 when loaded ? :)
>
>Yeah, the tests are destructive and they start erasing and torturing
>your MTD device without preserving your data.
>
>And the bad thing is - if you do not pass any parameter, they will
>torture your mtd0.
>
>I am sorry that you bricked your device and I hope you will be able to
>resurrect it.

That will be an exercise....

>This was an oversight. The tests were written for
>validating new drivers and making sure they are robust. So we always
>assumed people run them on a development HW, not on a production HW.
>That was a false implicit assumption.

No problem, i think it will not beggar me. I was a little bit disappointed =
at=C2=A0
first, but when re-thinking i think it`s just a result of some carelessnes=
=C2=A0
of me (as the user) and also of you developers of that modules (as nobody
expected that it could be accidentally loaded or even exist because of some
foreign kernel .config). nice to see the positive reaction on my report.

>Yes, we should use -1 as the default value, and print a scary warning
>message when the module is inserted without a parameter. We should
>probably also put word "destructive" or something like this to the
>module description.

Great! That sounds good. I think i will happily test if a fix is working, b=
ut
most likely not on my other Dockstar. Maybe=C2=A0block2mtd on top of a file=
-backed
loopdevice will provide a safe test-environment on my x86 box..... :)

regards
Roland


___________________________________________________________
SMS schreiben mit WEB.DE FreeMail - einfach, schnell und
kostenguenstig. Jetzt gleich testen! http://f.web.de/?mc=3D021192
