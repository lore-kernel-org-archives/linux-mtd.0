Received: from na3sys009aog105.obsmtp.com ([74.125.149.75])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REi4I-0005IH-Nq
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 13:44:59 +0000
Received: by bkat2 with SMTP id t2so3319646bka.32
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 06:44:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1318597412.12351.124.camel@sauron>
References: <CA+Xn3W3-JCqMKjiXi2cLCGm_bHtRx8RPsc9P5BoOS6YmbGZmHw@mail.gmail.com>
	<20111012164837.GA13691@logfs.org>
	<CA+Xn3W18bwZWzdjmRzEDUCqe3bVHnmW-7bJ_wvaoXpJxO1KmjQ@mail.gmail.com>
	<1318597412.12351.124.camel@sauron>
Date: Fri, 14 Oct 2011 15:44:49 +0200
Message-ID: <CA+Xn3W0DenmzGsnZURbRO=jHJBEJBPk8R55O=H=_geSfe3ew-A@mail.gmail.com>
Subject: Re: Make phram work with kernel cmdline args when built-in
From: "Fache, Herve" <h-fache@ti.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Joern Engel <joern@lazybastard.org>,
	=?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

2011/10/14 Artem Bityutskiy <dedekind1@gmail.com>
> Please, send patches inline. Also, try to make sure you do not
> have many of these #ifdef MODULE sections.

I am sorry but AIUI my company's e-mail system does not seem to allow
me to set patches the proper way. Is there any chance that you can
accept it inline for this time? Or can I have an account on
infradead.org, in which case I'll just push a git tree?

Also, I have tried to make my patch look like the other patch to
block2mtd, as asked by J=C3=B6rn, which explains the number of #ifdef
MODULE sections...

Regards,
Herv=C3=A9
--
Texas Instruments France SA, 821 Avenue Jack Kilby, 06270 Villeneuve
Loubet. 036 420 040 R.C.S Antibes. Capital de EUR 753.920
