Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DxMDz-0002q9-5L
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 05:59:58 -0400
Message-ID: <42E60A81.7070508@inf.u-szeged.hu>
Date: Tue, 26 Jul 2005 12:03:45 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: =?ISO-8859-2?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <BAY17-F12FDF887F077CD69ABB397E8D60@phx.gbl>	<20050722115939.GA941@wohnheim.fh-wedel.de>	<42E0E2C8.7090304@yandex.ru>
	<42E5E816.5090500@inf.u-szeged.hu>	<20050726074440.GB15903@wohnheim.fh-wedel.de>	<42E5ECE5.4010901@inf.u-szeged.hu>
	<42E5F474.7020003@imc-berlin.de>
	<20050726093624.GE15903@wohnheim.fh-wedel.de>
In-Reply-To: <20050726093624.GE15903@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Steven Scholz <steven.scholz@imc-berlin.de>
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
 block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel wrote:
>>Is there any chance to extend the code so that EBS will use the first m=
ount=20
>>to generate a summary instead having the need of a user space tool to=20
>>create an JFFS2 image with EBS?
>=20
> That's a lot of code for something inherently inefficient.  EBS should
> create summaries for *new* blocks that are written, sure.  But if you
> try to GC every single block without summary, your mount time will be
> well beyond it would have been without EBS.

I agree. It would be technically difficult to implement and would make=20
the first mount time very-very long.

Ferenc
