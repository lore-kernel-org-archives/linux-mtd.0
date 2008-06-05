Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K47hU-0000DI-79
	for linux-mtd@lists.infradead.org; Thu, 05 Jun 2008 05:07:49 +0000
Subject: Re: Cannot write to ubi volume
From: Artem Bityutskiy <dedekind@infradead.org>
To: "iw3gtf@tiscali.it" <iw3gtf@tiscali.it>
In-Reply-To: <25645542.1212594582569.JavaMail.root@ps23>
References: <25645542.1212594582569.JavaMail.root@ps23>
Content-Type: text/plain; charset=utf-8
Date: Thu, 05 Jun 2008 08:08:04 +0300
Message-Id: <1212642484.14566.52.camel@sauron>
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

Hi,

On Wed, 2008-06-04 at 17:49 +0200, iw3gtf@tiscali.it wrote:
> according to the ubi documentation it should be possible to 'write' in=20
> a, say, /dev/ubi1_0 (dynamic) volume device.

Could you please point where exactly you have read this - these docs.
should be fixed.

Direct writes like you tried are prohibited and you have to use volume
update operation, or ubiupdatevol utility instead of dd:

ubiupdatevol /dev/ubi1_0 /usr/local/tftp_root/k

> Am I completely wrong trying to write with a 'dd' ?
Yes.

> How should I proceed to write something into the volume ?

ubiupdatevol

> Is it possible to write something 'directly' in an ubi volume without=20
> explicitly formatting an image file (with 'ubinize' for example) ?

ubinize is needed if you want to pre-create a _raw_ flash image and
write it to _raw_ flash (e.g., /dev/mtd0). If you already have UBI
running and want to put arbitrary contents from file 'x' to the volume,
then you use 'ubiupdatevol <UBI volume device> x'. Or you may use thr
corresponding ioctl from your programs.

Direct writes with dd and the like are prohibited by design, mostly to
protect UBI from dumb users (and dumb users from themselves). Indeed,
direct writes are tricky and the user has to be very careful. However,
if you show the reasons why you have to have direct writes and cannot
live with volume update, we may allow them.

> Excuse me if my questions are a bit silly or naive and thank you for=20
> your explanations.

No problem.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
