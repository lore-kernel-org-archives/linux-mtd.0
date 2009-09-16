Received: from mail-yw0-f195.google.com ([209.85.211.195])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MnyOE-0000Yp-4T
	for linux-mtd@lists.infradead.org; Wed, 16 Sep 2009 17:34:03 +0000
Received: by ywh33 with SMTP id 33so75554ywh.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 16 Sep 2009 10:33:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <135822900926629194925601609215544403182-Webmail@me.com>
References: <135822900926629194925601609215544403182-Webmail@me.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 16 Sep 2009 13:33:36 -0400
Message-ID: <8bd0f97a0909161033n33183805q96f6da9d8796cf73@mail.gmail.com>
Subject: Re: use U-boot to Boot From a NAND Flash Memory Device
To: Thomas Jackson <penguinroot@mac.com>
Content-Type: text/plain; charset=UTF-8
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

On Wed, Sep 16, 2009 at 13:23, Thomas Jackson wrote:
> I understand NOR-based Flash memory devices have traditionally been used =
for non-volatile storage for a bootloader for various advantages
> including support for execute-in-place code, random access to memory, and=
 zero error rate. =C2=A0However, we have a project that we would like to us=
e U-boot to Boot From a NAND Flash Memory Device on a ARM926 based board. =
=C2=A0Does the community know of any existing mechanisms for this type of c=
onfiguration?

wouldnt it make more sense to ask on the u-boot list about u-boot
instead of asking on a linux list about an unrelated bootloader ?
-mike
