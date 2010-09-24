Received: from relay2.mail.timico.net ([62.121.20.90] helo=relay.timico.net)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Oz004-000252-Mn
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 04:35:09 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: Mike Frysinger <vapier@gentoo.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Content-Class: urn:content-classes:message
Date: Fri, 24 Sep 2010 05:35:05 +0100
Subject: RE: [PATCH 4/4] mtd-utils: unify flash_erase and flash_eraseall
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE093ED5FC9C@Cloud.RL.local>
In-Reply-To: <1285293221-25028-4-git-send-email-vapier@gentoo.org>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

linux-mtd-bounces@lists.infradead.org wrote:
> These have overlapping functionality, and while
> flash_eraseall supports
> newer 64bit ioctls, flash_erase does not.  So rather than
> graft support
> onto flash_erase, merge the functionality of two into
> flash_erase so we
> only have to support one util from now on.
>
> A simple wrapper is provided to ease old flash_eraseall users into the
> new combined flash_erase util.


> -TARGETS =3D ftl_format flash_erase flash_eraseall nanddump
> doc_loadbios \ +TARGETS =3D ftl_format flash_erase nanddump
>         doc_loadbios \ ftl_check mkfs.jffs2 flash_lock flash_unlock
>         flash_info \ flash_otp_info flash_otp_dump mtd_debug flashcp
> nandwrite nandtest \
>         jffs2dump \

Wow, my mailer really mangles patches.

But anyway; will the flash_eraseall script still get installed by
make install? it needs to.

--
Jon Povey
jon.povey@racelogic.co.uk

Racelogic is a limited company registered in England. Registered number 274=
3719 .
Registered Office Unit 10, Swan Business Centre, Osier Way, Buckingham, Buc=
ks, MK18 1TB .

The information contained in this electronic mail transmission is intended =
by Racelogic Ltd for the use of the named individual or entity to which it =
is directed and may contain information that is confidential or privileged.=
 If you have received this electronic mail transmission in error, please de=
lete it from your system without copying or forwarding it, and notify the s=
ender of the error by reply email so that the sender's address records can =
be corrected. The views expressed by the sender of this communication do no=
t necessarily represent those of Racelogic Ltd. Please note that Racelogic =
reserves the right to monitor e-mail communications passing through its net=
work
