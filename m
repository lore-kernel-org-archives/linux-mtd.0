Received: from albatross-ext.wise.edt.ericsson.se ([193.180.251.49]
	helo=albatross.wise.edt.ericsson.se)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1945hc-00053S-2J
	for <linux-mtd@lists.infradead.org>; Fri, 11 Apr 2003 22:04:52 +0100
From: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>
To: "Marc D'Anjou" <marcd@amperion.com>
In-Reply-To: <C6D44AA99ECEB540A5498F15F92DA07D89227F@amperion01>
References: <C6D44AA99ECEB540A5498F15F92DA07D89227F@amperion01>
Date: 11 Apr 2003 23:04:52 +0200
Message-Id: <1050095092.1007.35.camel@spawn>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
cc: Mtd <linux-mtd@lists.infradead.org>
Subject: Re: Long JFFS2 Mount time?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-04-11 at 15:49, Marc D'Anjou wrote:

> our log grows, the JFFS mount time appears to be growing quite a bit. It
> went from less than 1 second when we first started, to up to 7 or more
> minutes over days.=20

>=20
> Is there newer JFFS2 software available that minimize this behavior?

I do not know I have never had a problem with long mount times on any of
the versions I used. I did however test 2.4.21-pre6 and creating a file
by appending data (512 bytes/write) did not result in any longer mount
time.=20

Creating the file on the other hand was not exactly speedy. =20

--=20
Kenneth Johansson=09
Ericsson AB                       Tel: +46 8 719 70 20
Tellusborgsv=E4gen  90              Fax: +46 8 719 29 45
126 25 Stockholm                  ken@switchboard.ericsson.se
