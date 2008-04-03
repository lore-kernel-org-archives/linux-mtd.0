Received: from kuumail.barco.com ([32.58.34.195])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JhLLl-00068n-K9
	for linux-mtd@lists.infradead.org; Thu, 03 Apr 2008 09:03:14 +0000
Content-Class: urn:content-classes:message
Subject: Re: [PATCH] [JFFS2] Fix free space leaking
From: "Martin Creutziger" <martin.creutziger@barco.com>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
In-Reply-To: <1203593969.15409.45.camel@shinybook.infradead.org>
References: <20071113102323.GA5933@damir.rnd.local>
	<1202293219.25864.45.camel@gentoo-jocke.transmode.se>
	<20080221111148.GA10791@lazybastard.org>
	<1203593969.15409.45.camel@shinybook.infradead.org>
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Apr 2008 11:03:04 +0200
Message-ID: <1207213384.6161.4.camel@KARCLT0275>
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 2008-02-21 at 20:39 +0900, an unknown sender wrote:
> On Thu, 2008-02-21 at 12:11 +0100, J?rn Engel wrote:
> > No idea, but it might help to add dwmw2 to Cc:.
>=20
> dwmw2 moderately confused by it. I don't see why it's correct to =
account
> for the space as 'free' when it isn't really. If it's causing a
> persistent leak, shouldn't we deal with that when the block is erased
> instead?

Hi,=20

I am currently testing the patch on 2.6.24.2 (as a result of
http://lists.infradead.org/pipermail/linux-mtd/2008-March/021024.html),
and so far it seems to at least cure the symptoms, as in: The partition
does not "fill up" any more so far.=20
But: For later production use I would certainly prefer a patch that also
dwmw2 agrees being a cure to the _cause_, not just the symptoms.
Any suggestions?

Greetings . . . Martin



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
