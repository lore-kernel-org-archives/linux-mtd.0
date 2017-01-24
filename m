Received: from mail-dm3nam03on0081.outbound.protection.outlook.com
 ([104.47.41.81] helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cW2lU-0002vb-C2
 for linux-mtd@lists.infradead.org; Tue, 24 Jan 2017 15:12:11 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "dcb314@hotmail.com" <dcb314@hotmail.com>
Subject: Re: fs/jffs2/readinode.c:189: faulty logic ?
Date: Tue, 24 Jan 2017 15:11:41 +0000
Message-ID: <1485270700.4044.89.camel@infinera.com>
References: <VI1PR08MB1022F25C7F26E465355F07149C750@VI1PR08MB1022.eurprd08.prod.outlook.com>
 <8d72adf5-097f-0c72-edfc-d23d4199e9d4@gmail.com>
In-Reply-To: <8d72adf5-097f-0c72-edfc-d23d4199e9d4@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <026648D34F383C4A8E08724C85B68514@infinera.com>
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

On Tue, 2017-01-24 at 15:52 +0100, Marek Vasut wrote:
> On 01/24/2017 09:15 AM, David Binderman wrote:
> > Hello there,
> >=20
> > fs/jffs2/readinode.c:189]: (style) Condition 'tn.fn.ofs>=3Doffset' is a=
lways true
> >=20
> > Source code is
> >=20
> >         if (tn->fn->ofs < offset)
> >             next =3D tn->rb.rb_right;
> >         else if (tn->fn->ofs >=3D offset)
> >             next =3D tn->rb.rb_left;
> >         else
> >             break;
> >=20
> > Maybe better code
> >=20
> >         if (tn->fn->ofs < offset)
> >             next =3D tn->rb.rb_right;
> >         else if (tn->fn->ofs > offset)
> >             next =3D tn->rb.rb_left;
> >         else
> >             break;
>=20
> This changes the logic of the code for equality case, please elaborate
> why this is OK.

There is something odd with current code:
	next =3D tn_root->rb_node;

	while (next) {
		tn =3D rb_entry(next, struct jffs2_tmp_dnode_info, rb);

		if (tn->fn->ofs < offset)
			next =3D tn->rb.rb_right;
		else if (tn->fn->ofs >=3D offset)
			next =3D tn->rb.rb_left;
		else
			break;
	}

The else break; is never reached so the above change makes the break work f=
or =3D=3D
Weather this is correct or not I cannot say.

 Jocke=
