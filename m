Received: from bay004-omc4s24.hotmail.com ([65.54.190.226])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cVwGq-00080L-TR
 for linux-mtd@lists.infradead.org; Tue, 24 Jan 2017 08:16:06 +0000
From: David Binderman <dcb314@hotmail.com>
To: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: fs/jffs2/readinode.c:189: faulty logic ?
Date: Tue, 24 Jan 2017 08:15:41 +0000
Message-ID: <VI1PR08MB1022F25C7F26E465355F07149C750@VI1PR08MB1022.eurprd08.prod.outlook.com>
Content-Language: en-GB
Content-Type: text/plain; charset="iso-8859-1"
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

Hello there,

fs/jffs2/readinode.c:189]: (style) Condition 'tn.fn.ofs>=3Doffset' is alway=
s true

Source code is

        if (tn->fn->ofs < offset)
            next =3D tn->rb.rb_right;
        else if (tn->fn->ofs >=3D offset)
            next =3D tn->rb.rb_left;
        else
            break;

Maybe better code

        if (tn->fn->ofs < offset)
            next =3D tn->rb.rb_right;
        else if (tn->fn->ofs > offset)
            next =3D tn->rb.rb_left;
        else
            break;

Regards

David Binderman=
