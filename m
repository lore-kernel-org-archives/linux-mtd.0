Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4gnp-0007Wj-5P
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 11:23:10 -0400
Message-ID: <4300B335.6050006@yandex.ru>
Date: Mon, 15 Aug 2005 19:22:29 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <20050815115943.GD27229@wohnheim.fh-wedel.de>
	<43008A7D.2060302@inf.u-szeged.hu> <43008CD5.1000006@yandex.ru>
	<20050815125254.GA32209@wohnheim.fh-wedel.de>
	<430099D1.8000801@inf.u-szeged.hu> <43009BDB.1040108@yandex.ru>
	<20050815134813.GC3829@wohnheim.fh-wedel.de>
	<43009FFC.3090200@yandex.ru>
	<20050815140530.GE3829@wohnheim.fh-wedel.de>
	<1124115547.6148.17.camel@sauron.oktetlabs.ru>
	<20050815143241.GA7045@wohnheim.fh-wedel.de>
In-Reply-To: <20050815143241.GA7045@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
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
> How about encapsulating all the page handling code in - say -
> mm/slab.c and just handling single objects? ;)
>
Well, after thinking for the second time - yes, slab does the same, and=20
even better If we remember about the colouring. Forget about my offer.
:-)

--=20
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
