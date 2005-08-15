Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4fJ7-0004VT-MG
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 09:47:30 -0400
Message-ID: <43009CC3.3030103@yandex.ru>
Date: Mon, 15 Aug 2005 17:46:43 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <20050801141841.GD32464@wohnheim.fh-wedel.de>
	<42FB68AE.6070805@inf.u-szeged.hu>
	<20050815094816.GA27229@wohnheim.fh-wedel.de>
	<43007773.2070602@yandex.ru> <43008129.2060303@inf.u-szeged.hu>
	<20050815115943.GD27229@wohnheim.fh-wedel.de>
	<43008A7D.2060302@inf.u-szeged.hu> <43008CD5.1000006@yandex.ru>
	<20050815125254.GA32209@wohnheim.fh-wedel.de>
	<430099D1.8000801@inf.u-szeged.hu>
	<20050815134355.GA3829@wohnheim.fh-wedel.de>
In-Reply-To: <20050815134355.GA3829@wohnheim.fh-wedel.de>
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
> One reason to aggregate physical blocks into virtual ones is to save
> memory.  The aggregation code makes sure that we never spend more than
> 128k on the array of struct erase_block.  Not sure if this is really a
> valid concern, though.  Once we have such a big flash, jffs2 will
> require tons of memory anyway.
Agree, I don't think this is important. I would just swith to firm 1:1.

--=20
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
