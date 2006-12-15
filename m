Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GvAW7-0000ZG-KZ
	for linux-mtd@lists.infradead.org; Fri, 15 Dec 2006 05:42:18 -0500
Subject: Re: OneNAND: Update OOB free table
From: Artem Bityutskiy <dedekind@infradead.org>
To: kyungmin.park@samsung.com
In-Reply-To: <3761211.13011166150326518.JavaMail.weblogic@ep_ml08>
References: <3761211.13011166150326518.JavaMail.weblogic@ep_ml08>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 15 Dec 2006 12:41:53 +0200
Message-Id: <1166179313.18628.52.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Timo Teras <timo.teras@solidboot.com>
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

On Fri, 2006-12-15 at 02:38 +0000, Kyungmin Park wrote:
> How about the the change the JFFS2 logic to skip the eccpos in cleanmark =
check.
> In onenand_oob_64, it describes the eccpos. So the JFFS2 skip the eccpos

May you refine what is the problem please?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
