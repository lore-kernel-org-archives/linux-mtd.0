Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HCWoN-0001LJ-AA
	for linux-mtd@lists.infradead.org; Thu, 01 Feb 2007 02:56:53 -0500
Subject: RE: [RFC] [PATCH] JFFS2: use MTD_OOB_AUTO
From: Artem Bityutskiy <dedekind@infradead.org>
To: kmpark@infradead.org
In-Reply-To: <005801c745bf$feeccb70$c7a3580a@swcenter.sec.samsung.co.kr>
References: <1170242892.3635.13.camel@sauron>
	<005801c745bf$feeccb70$c7a3580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Feb 2007 09:56:24 +0200
Message-Id: <1170316584.6275.20.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: 'David Woodhouse' <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Kyungmin,

On Thu, 2007-02-01 at 14:15 +0900, Kyungmin Park wrote:
> After a minor MTD_OOB_AUTO in OneNAND, it's running.
> I'll check and test it more.=20
Thank you.

> I think that it changes the previous jffs2 format. it means it brakes the
> jffs2 backward compatibility.
Yes, but I suspect this should not be a problem. The worst thing that
should happen is that JFFS2 will just re-erase empty eraseblocks once.
We will test this.

> And one more.
> Please re-place the 'oob_cleanmarker' initialization like this. It's almo=
st
> constant variable.
> We don't need to re-init at every jffs2 mount time.
Good point, thanks. I'll re-send the patch.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
