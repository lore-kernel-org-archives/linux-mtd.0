Received: from rv-out-0910.google.com ([209.85.198.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Iva6X-0007LR-BF
	for linux-mtd@lists.infradead.org; Fri, 23 Nov 2007 10:06:11 -0500
Received: by rv-out-0910.google.com with SMTP id c24so2731196rvf
	for <linux-mtd@lists.infradead.org>;
	Fri, 23 Nov 2007 07:06:04 -0800 (PST)
Message-ID: <305035a40711230706nd9290d9h44d15b90a75976d2@mail.gmail.com>
Date: Fri, 23 Nov 2007 16:06:04 +0100
From: "Gregory CLEMENT" <gclement00@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: Some news for this: [PATCH] [MTD] BLOCK_RO: Readonly Block Device
	Layer Over MTD ?
In-Reply-To: <20071123144500.GB1239@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <305035a40711210627p1ea1f2c0me1ee1f8e8d124552@mail.gmail.com>
	<20071121160804.GC20871@lazybastard.org>
	<305035a40711210828k65174f44t3d64e9ee33fe26bf@mail.gmail.com>
	<20071121105817.3adbfbb5@weaponx>
	<20071121171501.GE20871@lazybastard.org>
	<acd2a5930711210943o2d0ff33an60f8dbf0c706088d@mail.gmail.com>
	<20071121174541.GF20871@lazybastard.org>
	<acd2a5930711210956p5fe8e4dbx271d4e821c4fa9e6@mail.gmail.com>
	<305035a40711230635j6e9b2082l2d610040256b9088@mail.gmail.com>
	<20071123144500.GB1239@lazybastard.org>
Cc: linux-mtd@lists.infradead.org, Vitaly Wool <vitalywool@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2007/11/23, J=F6rn Engel <joern@logfs.org>:
> On Fri, 23 November 2007 15:35:17 +0100, Gregory CLEMENT wrote:
> >
> >  As it seems that there is no objections on it, can you push the patch =
in mtd ?
>
> I do object against your patch on formal grounds.  It lacks:
> o a useful description,
> o Signed-off-by:,
> o diffstat,
> o diff -up (you just had -u),
> and maybe some more.

In fact this patch was not aimed to be directly included in mtd, but
just to help Vitaly to generate his patch as he offered to generate it
with git. It also seems that he know this patch pretty well and he
could make a better description than me!

>
> Also please fix your mailer so it doesn't word-wrap the patch.  I won't
> read it in its current state.

I hopped that google mail was more patch friendly, I was wrong. So I
can't send it inline before tonight at home, but if you don't mind I
can attach it.

>
> You might want to start reading Documentation/Submit* about now. ;)


>
> J=F6rn
>
> --
> Don't worry about people stealing your ideas. If your ideas are any good,
> you'll have to ram them down people's throats.
> -- Howard Aiken quoted by Ken Iverson quoted by Jim Horning quoted by
>    Raph Levien, 1979
>


--=20
Gregory CLEMENT
Adeneo
Adetel Group
2, chemin du Ruisseau
69134 ECULLY - FRANCE
T=E9l. : +33 (0)4 72 18 08 40 - Fax : +33 (0)4 72 18 08 41

www.adetelgroup.com
