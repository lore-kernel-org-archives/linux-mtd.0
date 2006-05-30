Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fl6Ke-0007Z7-9l
	for linux-mtd@lists.infradead.org; Tue, 30 May 2006 11:41:26 -0400
Message-ID: <447C6747.2080104@yandex.ru>
Date: Tue, 30 May 2006 19:39:51 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <20060530152406.GA15284@wohnheim.fh-wedel.de>
In-Reply-To: <20060530152406.GA15284@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH,RFC] [MTD] replace MTD_NORFLASH with MTD_GENERIC_TYPE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel wrote:
> This patch is 90% uncontroversial.  The remaining 10% introduce a new
> field to struct mtd_info.  Looks like we need something similar to
> this patch, but probably not identical to it.

Please, explain what does this MTD_GENERIC_TYPE mean? MTD_NORFLASH means =

that this is NOR flash. What's MTD_GENERIC_TYPE?

And why it "looks like we need something similar to this patch"?

--=20
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
