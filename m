Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HHGTu-0007lq-U4
	for linux-mtd@lists.infradead.org; Wed, 14 Feb 2007 04:31:32 -0500
Subject: Re: UBI bad block Management
From: Artem Bityutskiy <dedekind@infradead.org>
To: Brijesh Singh <brijesh.s.singh@gmail.com>
In-Reply-To: <6b5362aa0702140128h69cc8f11k48bec5b739640ded@mail.gmail.com>
References: <6b5362aa0702140128h69cc8f11k48bec5b739640ded@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 14 Feb 2007 11:31:10 +0200
Message-Id: <1171445470.8268.2.camel@sauron>
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

On Wed, 2007-02-14 at 14:58 +0530, Brijesh Singh wrote:
>    The flash devices are getting of bigger in Size.The Init Scan time
> will increase with bigger Size flash.How long are we going to rely on
> MTD for Bad block Management.

I hope forever. It is MTD's and only MTD's business to manage bad
blocks. Do not want MTD to do scanning? - Use on-flash BBT.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
