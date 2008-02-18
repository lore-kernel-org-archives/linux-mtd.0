Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JR7oS-0004sh-3b
	for linux-mtd@lists.infradead.org; Mon, 18 Feb 2008 15:21:48 +0000
Subject: Re: [PATCH] ubi-utils: Move bin2nand and nand2bin to mtd-utils
	subdirectory
From: Artem Bityutskiy <dedekind@infradead.org>
To: haver@vnet.ibm.com
In-Reply-To: <1203341288.8085.5.camel@august>
References: <1203341288.8085.5.camel@august>
Content-Type: text/plain; charset=utf-8
Date: Mon, 18 Feb 2008 17:16:12 +0200
Message-Id: <1203347772.3758.1.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "Artem B. Bityutskiy" <dedekind@oktetlabs.ru>,
	Andreas Arnez <arnez@de.ibm.com>,
	MTD Mailinglist <linux-mtd@lists.infradead.org>,
	Alexander Schmidt1 <ALEXSCHM@de.ibm.com>,
	David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-02-18 at 14:28 +0100, Frank Haverkamp wrote:
> as discussed some time ago with Artem, we figured out that nand2bin and
> bin2nand are not directly UBI related. The tools are of general use to
> create data-images for burning directly into NAND chips e.g. for
> manufacturing purposes. Therefor I created a patch to move it to the
> top-level mtd-utils directory:

I'd suggest to also add a readme file and put the information about the
tools there - something similar to your commit message.

Otherwise the patch is OK with me - with dwmw2's ack I could push it.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
