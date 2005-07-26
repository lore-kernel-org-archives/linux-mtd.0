Message-ID: <42E62275.2030804@yandex.ru>
Date: Tue, 26 Jul 2005 15:45:57 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Cal=F2_Massimo?= <m.calo@ctsgroup.it>
References: <001a01c591d5$6d2eeaa0$050213ac@MCaloMobile>
In-Reply-To: <001a01c591d5$6d2eeaa0$050213ac@MCaloMobile>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: "ucLinux-Mtd@Lists. Infradead. Org" <Linux-Mtd@Lists.Infradead.Org>
Subject: Re: I: Jffs2 space problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Cal=F2 Massimo wrote:
> 	Newly-erased block contained wod xxxx at offset xxxx
> 	Newly-erased block contained wod xxxx at offset xxxx

The messages mean that JFFS2 issued an flash_erase command,
then read the newly erased eraseblock and found out it does
not have all 0xFFs.

Check that you are able to erase your flash corre3ctly. Try to dump the=20
flash and see if it has all FFs just after you've erased it but before=20
you've mounted JFFS2.

--=20
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
