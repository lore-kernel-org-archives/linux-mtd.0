Received: from cluster-a.mailcontrol.com ([85.115.52.190])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MTWAF-00062G-8T
	for linux-mtd@lists.infradead.org; Wed, 22 Jul 2009 07:23:03 +0000
Received: from mailserver.mta.int (mail.mta.it [89.96.171.250])
	by rly09a.srv.mailcontrol.com (MailControl) with ESMTP id
	n6M7Mu3C030047
	for <linux-mtd@lists.infradead.org>; Wed, 22 Jul 2009 08:22:56 +0100
From: Canella Matteo <Matteo.Canella@mta.it>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Wed, 22 Jul 2009 09:22:52 +0200
Subject: RE: UBI FS mounting time
Message-ID: <BD9F3F3F5A6CCF4BA032B9FED4DD312E5D09531F02@mta-digimail.MTA.INT>
References: <531B6536C9F737458807DF75064873C8303DD7D768@mta-digimail.MTA.INT>
	<4A66B547.6020207@nokia.com>
In-Reply-To: <4A66B547.6020207@nokia.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Adrian Hunter wrote:
> c) Change UBI to write its mapping table when it is unloaded, so it can b=
e read quickly then loading (still have to scan if UBI was not unloaded cle=
anly).

This is quite interesting. Do you know if someone have already done this th=
ing? I can't find anything about that.

Thank you
Regards
Matteo Canella
