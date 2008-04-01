Received: from kndmail.barco.com ([32.58.34.227])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JgbQ9-0008NF-PR
	for linux-mtd@lists.infradead.org; Tue, 01 Apr 2008 08:00:42 +0000
Subject: Re: JFFS2: Kernel 2.6.24.2 Ooops during excessive write test
From: "Martin Creutziger" <martin.creutziger@barco.com>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
Content-class: urn:content-classes:message
In-Reply-To: <679044850803310823x10ac1f9dg7de6ed531c7d01b6@mail.gmail.com>
References: <1206973072.6190.16.camel@KARCLT0275>
	<679044850803310823x10ac1f9dg7de6ed531c7d01b6@mail.gmail.com>
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Apr 2008 09:36:11 +0200
Message-ID: <1207035371.6252.7.camel@KARCLT0275>
MIME-Version: 1.0
Cc: Damir Shayhutdinov <lost404@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-03-31 at 19:23 +0400, Damir Shayhutdinov wrote:
> Hi!
>=20
> 2008/3/31, Martin Creutziger wrote:
> >  I did some searching in the archive already and did not find =
anything,
> >  so I just post it myself in the hope that somebody can help me.
> >
> >  I am doing some excessive write tests on a PPC405EP running kernel
> >  2.6.24.2 at the moment. At irregular intervals, the "space =
accounting
> >  superblock info" gets "screwed" and I'd like to know why this =
happens
> >  and if it is fixable. And if not, that information might help me to
> >  decide whether or not this affects the planned application.
> >
> >  Thanks for the help,
>=20
> Can you test this patch with your system?
> =
http://lists.infradead.org/pipermail/linux-mtd/2007-November/019866.html

Yes, will do that. I also activated verbose info on BUG() now, maybe
that gives additional information in case it goes wrong again.

I have to add, however, that it can take up to a week until the oops
occurs again, so be patient :)

Thanks so far,
Martin


DISCLAIMER:
Unless indicated otherwise, the information contained in this message is =
privileged and confidential, and is intended only for the use of the =
addressee(s) named above and others who have been specifically =
authorized to receive it. If you are not the intended recipient, you are =
hereby notified that any dissemination, distribution or copying of this =
message and/or attachments is strictly prohibited. The company accepts =
no liability for any damage caused by any virus transmitted by this =
email. Furthermore, the company does not warrant a proper and complete =
transmission of this information, nor does it accept liability for any =
delays. If you have received this message in error, please contact the =
sender and delete the message. Thank you.
