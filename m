Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HBPq0-0003fp-Qi
	for linux-mtd@lists.infradead.org; Mon, 29 Jan 2007 01:18:00 -0500
Subject: Re: [PATCH][UBI] remove __exit on functions referenced in '.text'
	or '.init.text'
From: Artem Bityutskiy <dedekind@infradead.org>
To: Benedikt Spranger <b.spranger@linutronix.de>
In-Reply-To: <20070122230954.1b7f77e6.b.spranger@linutronix.de>
References: <20070122230954.1b7f77e6.b.spranger@linutronix.de>
Content-Type: text/plain; charset=utf-8
Date: Mon, 29 Jan 2007 08:17:31 +0200
Message-Id: <1170051451.9477.44.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Benedikt,

On Mon, 2007-01-22 at 23:09 +0100, Benedikt Spranger wrote:
> linking the current ubi-2.6 git tree results in tons of "`.exit.text'
> referenced in section `.text'" or ".init.text". Solution is simple:
> remove all __exit in referenced function.

The __init/__exit attributes were indeed broken. I've removed them. I
didn't use your patch because I got rid of both __init and __exit, not
just __exit. The patch is in the git repository.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
