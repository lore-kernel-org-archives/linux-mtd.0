Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14whvp-00087i-00
	for <linux-mtd@lists.infradead.org>; Mon, 07 May 2001 11:07:58 +0100
Received: from mail.com1.fr ([62.161.40.252])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14whwB-0004lk-00
	for linux-mtd@lists.infradead.org; Mon, 07 May 2001 11:08:20 +0100
Received: from MSTEMPIN (ns.com1.fr [62.161.40.253])
	by mail.com1.fr (8.9.3/8.9.3) with SMTP id MAA11647
	for <mtd@infradead.org>; Mon, 7 May 2001 12:08:10 +0200
From: "Michel Stempin" <mstempin@com1.fr>
To: "mtd" <linux-mtd@lists.infradead.org>
Subject: MTD/JFFS running on SBC-104
Date: Mon, 7 May 2001 12:09:17 +0200
Message-ID: <NEBBLPFMELCDALFMOJILOEJGCFAA.mstempin@com1.fr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit
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

OK, I've got MTD/JFFS running on an Arcom SBC-104 with kernel 2.2.17. I
compiled them built-in in the kernel, had to write the map for the SBC-104,
based on the sbc_mediagx, found a few glitches in cfi, but it works. I will
post the details when I am done.

Now, I want to put JFFS2 in the kernel instead of JFFS. How do you do that?
There is no config in the kernel for JFFS2. Do I have just to link into the
kernel with symlinks?

--
Michel Stempin
MIS
COM One SA, 11 parc de Marticot, 33610 CESTAS, FRANCE
Tel: +33(0)5 57 97 72 72
Fax: +33(0)5 56 78 84 78
Email: mstempin@com1.fr
