Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14urPt-0006jd-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 May 2001 08:51:21 +0100
Received: from mail.com1.fr ([62.161.40.252])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14urQM-0000JI-00
	for linux-mtd@lists.infradead.org; Wed, 02 May 2001 08:51:51 +0100
Received: from MSTEMPIN (ns.com1.fr [62.161.40.253])
	by mail.com1.fr (8.9.3/8.9.3) with SMTP id JAA19147
	for <mtd@infradead.org>; Wed, 2 May 2001 09:51:43 +0200
From: "Michel STEMPIN" <admin@com1.fr>
To: "mtd" <linux-mtd@lists.infradead.org>
Subject: RE: Is DOC Address 0xC8000 Something Special?
Date: Wed, 2 May 2001 09:52:59 +0200
Message-ID: <NEBBLPFMELCDALFMOJILCEICCFAA.admin@com1.fr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <004f01c0d188$4688c5e0$88b4b8d1@ShuhIII>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> The same problem (not recognizing DOC) occurs for both fixed address probe
> (C8000 in config) as well as autoprobe (0000 in config).  Strangely,
> docprobe works well (again, both fixed and auto probe) at two other DOC
> addresses: 0xD0000 and 0xD8000.
Just as a sanity check, make sure you don't have your video BIOS shadowed at
this address in you BIOS setup.

--
Michel Stempin
MIS
COM One SA, 11 parc de Marticot, 33610 CESTAS, FRANCE
Tel: +33(0)5 57 97 72 72
Fax: +33(0)5 56 78 84 78
Email: mstempin@com1.fr
