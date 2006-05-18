Received: from nf-out-0910.google.com ([64.233.182.185])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fgdve-0001Om-MU
	for linux-mtd@lists.infradead.org; Thu, 18 May 2006 04:32:31 -0400
Received: by nf-out-0910.google.com with SMTP id a27so213607nfc
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 May 2006 01:32:16 -0700 (PDT)
Message-ID: <fe810cf0605180132t6de024d8mea9db6faaba6ac16@mail.gmail.com>
Date: Thu, 18 May 2006 12:32:15 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
In-Reply-To: <fe810cf0605180105y2f9652b8q1ec4f44b1228dbd0@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <fe810cf0605170811i2229c718mbe6a69155f82c0ae@mail.gmail.com>
	<1147881431.3875.22.camel@pmac.infradead.org>
	<20060517160029.GA26351@wohnheim.fh-wedel.de>
	<1147881919.3875.24.camel@pmac.infradead.org>
	<fe810cf0605180105y2f9652b8q1ec4f44b1228dbd0@mail.gmail.com>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>,
	=?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Subject: Re: [PATCH] MTD: mtdconcat NAND/Sibley support (rev.2)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/18/06, Alexander Belyakov <abelyako@googlemail.com> wrote:
>
> David, here is the same patch but without "writesize" usage for alignment=
 check.
>

Just looked at the git tree and saw you have already fixed the problem.

Thanks,
Alexander
