Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uqp1-0006cD-00
	for <linux-mtd@lists.infradead.org>; Wed, 02 May 2001 08:13:15 +0100
Received: from mail.com1.fr ([62.161.40.252])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14uqpU-00009U-00
	for linux-mtd@lists.infradead.org; Wed, 02 May 2001 08:13:45 +0100
Received: from MSTEMPIN (ns.com1.fr [62.161.40.253])
	by mail.com1.fr (8.9.3/8.9.3) with SMTP id JAA17141
	for <mtd@infradead.org>; Wed, 2 May 2001 09:13:36 +0200
From: "Michel STEMPIN" <admin@com1.fr>
To: "mtd" <linux-mtd@lists.infradead.org>
Subject: RE: MTD and 2.4
Date: Wed, 2 May 2001 09:14:52 +0200
Message-ID: <NEBBLPFMELCDALFMOJILEEIACFAA.admin@com1.fr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <NEBBIDMHCLDPHDHEGDMLGEFCCBAA.jasonw@uswo.net>
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

> I *suspect* they used the kernel patxches from
> M-systems, but I am not positive.
If it is the case, you should see a copyright message both during the boot
process and in /proc/kmsg
Then, you will need to figure out if its built in the kernel (in which case
your linux is not redistributable), or as a separate module loaded in the
initrd (do a lsmod and check for a doc module).

--
Michel Stempin
MIS
COM One SA, 11 parc de Marticot, 33610 CESTAS, FRANCE
Tel: +33(0)5 57 97 72 72
Fax: +33(0)5 56 78 84 78
Email: mstempin@com1.fr
