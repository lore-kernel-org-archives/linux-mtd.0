Received: from anchor-post-35.mail.demon.net ([194.217.242.85])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 195TE3-0001kT-A8
	for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2003 17:24:03 +0100
Date: Tue, 15 Apr 2003 17:23:59 +0100
Mime-Version: 1.0 (Apple Message framework v552)
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
From: Jasmine Strong <jasmine@regolith.co.uk>
In-Reply-To: <20030415161442.GF7721@wohnheim.fh-wedel.de>
Message-Id: <A97C8A02-6F5E-11D7-B468-000393AD6294@regolith.co.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
cc: Holger Schurig <h.schurig@mn-logistik.de>
cc: linux-mtd@lists.infradead.org
cc: Esben Nielsen <esn@cotas.dk>
Subject: Re: Database on JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tuesday, Apr 15, 2003, at 17:14 Europe/London, J=F6rn Engel wrote:

> On Tue, 15 April 2003 17:11:44 +0100, Jasmine Strong wrote:
>> Unless it would cause many erases, which would slow things down a=20
>> lot...
> Erases get triggered by garbage collection, which depends on the
> amount of data written, not the chunk size.

yes.  I think my two points were actually the same point taken twice :-)
If you're only updating a few bytes of data you will end up writing
a large proportion of log control data.  That'll end up being
responsible for most of the erase traffic.

Still, if you need to be powerfail-safe, I can't see any way of not
doing this.

-Jas.=
