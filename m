Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JSTxJ-0002KE-QP
	for linux-mtd@lists.infradead.org; Fri, 22 Feb 2008 09:12:34 +0000
Subject: Re: [PATCH] ubi-utils: Fixup pddcustomize
From: Artem Bityutskiy <dedekind@infradead.org>
To: haver@vnet.ibm.com
In-Reply-To: <1203670055.8489.4.camel@august>
References: <1203670055.8489.4.camel@august>
Content-Type: text/plain; charset=utf-8
Date: Fri, 22 Feb 2008 10:51:17 +0200
Message-Id: <1203670277.3758.51.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Josh Boyer <jwboyer@linux.ibm.com>,
	Alexander Schmidt <alexs@linux.vnet.ibm.com>,
	"Monte K. Copeland" <catboat@texas.net>,
	MTD Mailinglist <linux-mtd@lists.infradead.org>,
	Andreas Arnez <arnez@de.ibm.com>, Thomas Gleixner <tglx@linutronix.de>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 2008-02-22 at 09:47 +0100, Frank Haverkamp wrote:
> Subject: ubi-utils: pddcustomize fixup update volume
> From: Frank Haverkamp <haver@vnet.ibm.com>
>=20
> Somehow calling ubi_update_start was forgotten and caused the
> tool not to write but silently ignore the write.
>=20
> Signed-off-by: Frank Haverkamp <haver@vnet.ibm.com>

[dedekind@golum mtd-utils.git]$ git-am haver.eml
Applying ubi-utils: pddcustomize fixup update volume
.dotest/patch:11: trailing whitespace.
 * Copyright (c) International Business Machines Corp., 2008
.dotest/patch:20: trailing whitespace.
 * Copyright (c) International Business Machines Corp., 2008
.dotest/patch:28: trailing whitespace.
 * 1.6 Fixed broken volume update
.dotest/patch:37: trailing whitespace.
#define PROGRAM_VERSION "1.6"
.dotest/patch:46: trailing whitespace.
        size_t nbytes;
error: patch failed: ubi-utils/src/bootenv.c:1
error: ubi-utils/src/bootenv.c: patch does not apply
error: patch failed: ubi-utils/src/pddcustomize.c:1
error: ubi-utils/src/pddcustomize.c: patch does not apply
Patch failed at 0001.
When you have resolved this problem run "git-am --resolved".
If you would prefer to skip this patch, instead run "git-am --skip".

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
