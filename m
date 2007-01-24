Received: from miranda.se.axis.com ([193.13.178.8])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H9h2E-0000A8-1C
	for linux-mtd@lists.infradead.org; Wed, 24 Jan 2007 12:15:30 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Subject: RE: What is ANAND header?
Date: Wed, 24 Jan 2007 13:14:55 +0100
Message-ID: <BFECAF9E178F144FAEF2BF4CE739C66803EAB0BB@exmail1.se.axis.com>
References: <20070113063629.GA13015@pooky.senux.com><1168794421.2941.70.camel@localhost.localdomain>
	<20070124054731.GA31267@pooky.senux.com>
From: =?Windows-1252?Q?Ricard_Wanderl=F6f?= <Ricard.Wanderlof@axis.com>
To: "Seongsu Lee" <senux@senux.com>, <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> How can I mount 'conventional filesystem' such as FAT, EXT{2,3}
> on NAND flash memory instead of mouting on mtdblock because of
> its poor functionality. (no wear-leveling)
>
> What I want to do in a final is to mount FAT filesystem on bare
> NAND flash memories without performance degradation.

Use UBI, then mount the filesystem on an UBI volume? (Check the mtd list =
archives or web pages for more info on UBI)

/Ricard
