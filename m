Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Gsams-0001QE-O9
	for linux-mtd@lists.infradead.org; Fri, 08 Dec 2006 03:08:57 -0500
Subject: Re: Eraseblocks torture: OneNAND results
From: Artem Bityutskiy <dedekind@infradead.org>
To: kyungmin.park@samsung.com
In-Reply-To: <6640129.409201165563759259.JavaMail.weblogic@ep_ml20>
References: <6640129.409201165563759259.JavaMail.weblogic@ep_ml20>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 Dec 2006 10:08:48 +0200
Message-Id: <1165565328.20337.115.camel@sauron>
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

On Fri, 2006-12-08 at 07:42 +0000, Kyungmin Park wrote:
> Yes I already modified the source for my environment. and also add check =
initial bad block.

Ah, indeed, thanks. I will add bad block checking. Also, I am
re-structuring the test now to make it baster and more torturous. I am
going to do erase/write/operations with the whole group, not with each
eraseblock separately. HW guys think it should cause more trouble for
flash. I will notify you when to update.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
