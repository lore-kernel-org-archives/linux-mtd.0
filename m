Received: from an-out-0708.google.com ([209.85.132.243])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IutbZ-0000Gz-Ih
	for linux-mtd@lists.infradead.org; Wed, 21 Nov 2007 12:43:23 -0500
Received: by an-out-0708.google.com with SMTP id c3so456080ana
	for <linux-mtd@lists.infradead.org>;
	Wed, 21 Nov 2007 09:43:14 -0800 (PST)
Message-ID: <acd2a5930711210943o2d0ff33an60f8dbf0c706088d@mail.gmail.com>
Date: Wed, 21 Nov 2007 20:43:14 +0300
From: "Vitaly Wool" <vitalywool@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: Some news for this: [PATCH] [MTD] BLOCK_RO: Readonly Block Device
	Layer Over MTD ?
In-Reply-To: <20071121171501.GE20871@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <305035a40711210627p1ea1f2c0me1ee1f8e8d124552@mail.gmail.com>
	<20071121160804.GC20871@lazybastard.org>
	<305035a40711210828k65174f44t3d64e9ee33fe26bf@mail.gmail.com>
	<20071121105817.3adbfbb5@weaponx>
	<20071121171501.GE20871@lazybastard.org>
Cc: linux-mtd@lists.infradead.org, Gregory CLEMENT <gclement00@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Nov 21, 2007 8:15 PM, J=F6rn Engel <joern@logfs.org> wrote:
> But why yet another mtdblock driver?  Is there a reason not to add the
> required bits to mtdblock_ro.c?

Because we were explicitly directed by David to do so.

Vitaly
