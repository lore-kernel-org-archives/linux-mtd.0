Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RFPK7-0000Vv-IJ
	for linux-mtd@lists.infradead.org; Sun, 16 Oct 2011 11:56:12 +0000
Received: by bkbc12 with SMTP id c12so6487518bkb.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 16 Oct 2011 04:56:10 -0700 (PDT)
Subject: Re: Make phram work with kernel cmdline args when built-in
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Fache, Herve" <h-fache@ti.com>
Date: Sun, 16 Oct 2011 14:55:43 +0300
In-Reply-To: <CA+Xn3W0DenmzGsnZURbRO=jHJBEJBPk8R55O=H=_geSfe3ew-A@mail.gmail.com>
References: <CA+Xn3W3-JCqMKjiXi2cLCGm_bHtRx8RPsc9P5BoOS6YmbGZmHw@mail.gmail.com>
	<20111012164837.GA13691@logfs.org>
	<CA+Xn3W18bwZWzdjmRzEDUCqe3bVHnmW-7bJ_wvaoXpJxO1KmjQ@mail.gmail.com>
	<1318597412.12351.124.camel@sauron>
	<CA+Xn3W0DenmzGsnZURbRO=jHJBEJBPk8R55O=H=_geSfe3ew-A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1318766150.2935.13.camel@sauron>
Mime-Version: 1.0
Cc: Joern Engel <joern@lazybastard.org>,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-10-14 at 15:44 +0200, Fache, Herve wrote:
> Hi Artem,
> 
> 2011/10/14 Artem Bityutskiy <dedekind1@gmail.com>
> > Please, send patches inline. Also, try to make sure you do not
> > have many of these #ifdef MODULE sections.
> 
> I am sorry but AIUI my company's e-mail system does not seem to allow
> me to set patches the proper way. Is there any chance that you can
> accept it inline for this time? Or can I have an account on
> infradead.org, in which case I'll just push a git tree?

Not sure about infradead.org, you should ask David Woodhouse, not me. 
Just create gmail.com account and use ssh tunneling via your home
machine or some other host, or use your corporate proxy if it allows
smtp/imap traffic. Note, infradead.org account is not easier to used
than gmail.com.

-- 
Best Regards,
Artem Bityutskiy
