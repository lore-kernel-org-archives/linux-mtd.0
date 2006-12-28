Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GzsPa-0008Ek-I4
	for linux-mtd@lists.infradead.org; Thu, 28 Dec 2006 05:23:01 -0500
Subject: Re: [PATCH] NAND: nandsim bad block injection
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vijay Kumar <vijaykumar@bravegnu.org>
In-Reply-To: <17810.36897.44930.853654@vaishnavi.localdomain>
References: <17810.36897.44930.853654@vaishnavi.localdomain>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Dec 2006 12:22:21 +0200
Message-Id: <1167301341.4217.30.camel@sauron>
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

Vijay,

On Wed, 2006-12-27 at 20:54 +0530, Vijay Kumar wrote:
> Adds support for bad block creation on block erase and page program,
> by returning erase/program failed in the status byte. The probability
> of fault occurrence can be specified through module parameters.

the patch looks fine, and it is useful for debugging. But I have few
concerns.

1. Suppose we decided to emulate an erase failure for a certain
eraseblock. Then the MTD user re-tries the operation and succeeds.
Shouldn't we start always returning erase errors for this eraseblock
instead?

2. In case of I/O errors, the correct MTD user should mark the bogus
eraseblock bad. So, after some time we end up with most of our
eraseblocks marked bad which is not very nice.

How would you comment this?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
