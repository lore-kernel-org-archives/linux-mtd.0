Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EuUZa-00017z-Bv
	for linux-mtd@lists.infradead.org; Thu, 05 Jan 2006 07:50:34 -0500
Message-ID: <43BD15F0.4040004@yandex.ru>
Date: Thu, 05 Jan 2006 15:49:52 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?UTF-8?B?SnVoYSBZcmrQlmzQlA==?= <juha.yrjola@nokia.com>
References: <1136235272.8963.21.camel@two.research.nokia.com>
In-Reply-To: <1136235272.8963.21.camel@two.research.nokia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] [JFFS2] Make NAND OOB usage more flexible
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Juha Yrj=C3=B6l=C3=A4 wrote:
> Many (if not all) OneNAND devices have the free OOB bytes scattered
> around the whole OOB area in blocks of 2 or 3 bytes.  To work around
> this, the JFFS2 wbuf code needs to consider _all_ the free OOB bytes
> specified by the oobfree array.

Hello Juha,

actually, Vitaly recently sent a patch wich handles this more=20
gracefully. It basically adds an MTD interface which presents free OOB=20
bytes to users as a (virtually) contiguous buffer.

--=20
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
