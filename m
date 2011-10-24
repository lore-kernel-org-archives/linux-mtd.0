Received: from arroyo.ext.ti.com ([192.94.94.40])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RICge-0007I7-Hl
	for linux-mtd@lists.infradead.org; Mon, 24 Oct 2011 05:03:01 +0000
From: "Kumar, Goutam" <goutam.kumar@ti.com>
To: "dedekind1@gmail.com" <dedekind1@gmail.com>
Date: Mon, 24 Oct 2011 10:32:51 +0530
Subject: RE: ubifs not working with 3.1 kernel and MT29F2G08ABAEAWP NAND Flash.
Message-ID: <0680EC522D0CC943BC586913CF3768C00590504FCD@dbde02.ent.ti.com>
References: <0680EC522D0CC943BC586913CF3768C0059050481E@dbde02.ent.ti.com>
	<4E9EEBDC.5000002@st.com> <20111019154913.GA18674@parrot.com>
	<0680EC522D0CC943BC586913CF3768C00590504990@dbde02.ent.ti.com>
	<1319227591.10043.0.camel@golum>
In-Reply-To: <1319227591.10043.0.camel@golum>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Angus CLARK <angus.clark@st.com>, Ivan Djelic <ivan.djelic@parrot.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ivan,

Are you referring MTD Tests as NAND Write and Read back test?

Regards,
Goutam

-----Original Message-----
From: Artem Bityutskiy [mailto:dedekind1@gmail.com]=20
Sent: Saturday, October 22, 2011 1:36 AM
To: Kumar, Goutam
Cc: Ivan Djelic; Angus CLARK; linux-mtd@lists.infradead.org
Subject: RE: ubifs not working with 3.1 kernel and MT29F2G08ABAEAWP NAND Fl=
ash.

On Thu, 2011-10-20 at 12:17 +0530, Kumar, Goutam wrote:
> Hi Ivan,
>=20
> Thanks for the input. Can you share the patches, which I can apply and te=
st.
>=20

Even when you have all the patches, please, do not forget to validate
your flash using the mtd tests.

--=20
Best Regards,
Artem Bityutskiy
