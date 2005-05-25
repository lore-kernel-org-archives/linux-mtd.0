Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Dar2O-00079k-UI
	for linux-mtd@lists.infradead.org; Wed, 25 May 2005 04:14:50 -0400
Message-ID: <429433EF.2050308@yandex.ru>
Date: Wed, 25 May 2005 12:14:39 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?ISO-8859-15?Q?=22David_M=FCller_=28ELSOFT_AG=29=22?=
	<d.mueller@elsoft.ch>
References: <429320D1.2060003@elsoft.ch>
	<1116944005.16577.23.camel@sauron.oktetlabs.ru>
	<429430F1.2080208@elsoft.ch>
In-Reply-To: <429430F1.2080208@elsoft.ch>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 access delay
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David M=FCller (ELSOFT AG) wrote:
> The JFFS2 partition has 126MiB, the whole NAND flash has a size of 128M=
iB.
The problem with JFFS2 is that is does not scale. 126 MiB is very large=20
partition for it. Read=20
http://www.linux-mtd.infradead.org/tech/JFFS3design/node3.html for more=20
details. JFFS2 was designed for small flashes and works perfectly with th=
em.

BTW, the flash file system for Large-scale flashes is rather challenging =

task.

--=20
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
