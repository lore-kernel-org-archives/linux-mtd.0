Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by pentafluge.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EMRbP-00006b-Cs
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2005 15:47:40 +0100
Message-ID: <43414378.80005@yandex.ru>
Date: Mon, 03 Oct 2005 18:43:04 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <BAY17-F15F41E3E64959C3F1054D0E8800@phx.gbl>	<43413716.1040402@yandex.ru>
	<20051003142851.GE4639@wohnheim.fh-wedel.de>
In-Reply-To: <20051003142851.GE4639@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: zhao forrest <zhao_fusheng@hotmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH]erase block header(revision 4)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=F6rn Engel wrote:
> Bad suggestion then.  Try to draw a complete graph of all possible
> users to this static structure, the locking required to make it
> correct, then prove its correctness.
Oh, It is not constant anymore (we have the "erasecount" filed there).=20
Right. It must not be static. Zhao, I apologize for incorrect suggestion.=


>=20
> If that didn't already scare you to death, try to anticipate future
> code changes to such brittle code.
Yes, yuo could have just proved its incorrectnes in 2-3 words instead.

--=20
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
