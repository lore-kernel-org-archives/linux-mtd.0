Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uqzO-0006eK-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 May 2001 08:23:58 +0100
Received: from mail.com1.fr ([62.161.40.252])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14uqzr-0000Cm-00
	for linux-mtd@lists.infradead.org; Wed, 02 May 2001 08:24:28 +0100
Received: from MSTEMPIN (ns.com1.fr [62.161.40.253])
	by mail.com1.fr (8.9.3/8.9.3) with SMTP id JAA17670
	for <mtd@infradead.org>; Wed, 2 May 2001 09:24:20 +0200
From: "Michel STEMPIN" <admin@com1.fr>
To: "mtd" <linux-mtd@lists.infradead.org>
Subject: RE: MTD compile on 2.2.17 kernel (compile syntax error)
Date: Wed, 2 May 2001 09:25:36 +0200
Message-ID: <NEBBLPFMELCDALFMOJILOEIACFAA.admin@com1.fr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <F1BD619B2A58D41197990050DA2C08E40258DE@SLINK12>
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

> one thing that I am sure of is a typo at line # 211 of cfi_cmdset_0002.c
> map->fldrv_destroy should be changed to map->fldrv->destroy .
Yes, I got the same, but I have seen it in some other places, too. Maybe
someone with CVS access could do a grep to fix this?

--
Michel Stempin
MIS
COM One SA, 11 parc de Marticot, 33610 CESTAS, FRANCE
Tel: +33(0)5 57 97 72 72
Fax: +33(0)5 56 78 84 78
Email: mstempin@com1.fr
