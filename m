Received: from an-out-0708.google.com ([209.85.132.243])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Iutnw-0001VQ-2P
	for linux-mtd@lists.infradead.org; Wed, 21 Nov 2007 12:56:10 -0500
Received: by an-out-0708.google.com with SMTP id c3so456722ana
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Nov 2007 09:56:03 -0800 (PST)
Message-ID: <acd2a5930711210956p5fe8e4dbx271d4e821c4fa9e6@mail.gmail.com>
Date: Wed, 21 Nov 2007 20:56:03 +0300
From: "Vitaly Wool" <vitalywool@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: Some news for this: [PATCH] [MTD] BLOCK_RO: Readonly Block Device
	Layer Over MTD ?
In-Reply-To: <20071121174541.GF20871@lazybastard.org>
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
Cc: linux-mtd@lists.infradead.org, Gregory CLEMENT <gclement00@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Nov 21, 2007 8:45 PM, J=F6rn Engel <joern@logfs.org> wrote:
> > Because we were explicitly directed by David to do so.
>
> And David has gone fishing.  Did he tell you why?

He didn't want to add confusion, that's what he said. He directed us
to make it a separate translation layer an have a separate device
major (which we did get BTW :) ).

If there's no objections, I can rediff/repost against the current MTD
git. I'll also add some comments about the limitations of this
approach (still it's viable enough within a real environment if
there's an application which just reads the whole partition say once
in a week and rewrites it as soon as it detects bit error corrections;
that's what we did for emo BTW).

Vitaly
