Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14urCr-0006h1-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 May 2001 08:37:54 +0100
Received: from mail.com1.fr ([62.161.40.252])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14urDK-0000GF-00
	for linux-mtd@lists.infradead.org; Wed, 02 May 2001 08:38:23 +0100
Received: from MSTEMPIN (ns.com1.fr [62.161.40.253])
	by mail.com1.fr (8.9.3/8.9.3) with SMTP id JAA18494
	for <mtd@infradead.org>; Wed, 2 May 2001 09:38:15 +0200
From: "Michel STEMPIN" <admin@com1.fr>
To: "mtd" <linux-mtd@lists.infradead.org>
Subject: RE: MTD compile on 2.2.17 kernel 
Date: Wed, 2 May 2001 09:39:31 +0200
Message-ID: <NEBBLPFMELCDALFMOJILIEIBCFAA.admin@com1.fr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <F1BD619B2A58D41197990050DA2C08E40258DF@SLINK12>
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

> If I change GNUmakefile
> ifeq ($(VERSION),2)
>  ifeq ($(PATCHLEVEL),0) <<<changed this to:>>>  ifeq ($(PATCHLEVEL),2)
>    obj-y += initcalls.o
>   endif
> endif
>
> Then it compiles.

Did the same... Be carefull, this fix should be up to 2.2.18 only. But I am
stuck at the point I cannot find the "cfi" module from my map init... It
looks like it is acting as if I compiled MTD with modules (which I didn't
considering the HOWTO recommandation), but I got "MODULES" defined. My
kernel is using modules, though. Is there a possible confusion here?

--
Michel Stempin
MIS
COM One SA, 11 parc de Marticot, 33610 CESTAS, FRANCE
Tel: +33(0)5 57 97 72 72
Fax: +33(0)5 56 78 84 78
Email: mstempin@com1.fr
