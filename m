Received: from nf-out-0910.google.com ([64.233.182.191])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fqj3q-0004kh-6h
	for linux-mtd@lists.infradead.org; Thu, 15 Jun 2006 00:02:34 -0400
Received: by nf-out-0910.google.com with SMTP id k27so21610nfc
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Jun 2006 21:02:23 -0700 (PDT)
Message-ID: <625fc13d0606142102j46277f81gf45a6bf784dc6c90@mail.gmail.com>
Date: Wed, 14 Jun 2006 23:02:23 -0500
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Linux-MTD Mailing List" <linux-mtd@lists.infradead.org>
Subject: [UBI] Remove autotools from ubi-utils
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>,
	Thomas Gleixner <tglx@linutronix.de>, haver@vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Take a look at the 'haver' branch of my mtd-utils tree.  It contains
the ubi-tools import that Frank did, and the start of removing the
autotools crap from them.

http://git.infradead.org/?p=users/jwboyer/mtd-utils;a=shortlog;h=haver

Next step would be to finish the standalone Makefiles, then add a
couple toplevel Makefiles so that the ubi tools get built with the
rest of the mtd-utils.

If this isn't the direction that people want to go with this, that's
fine.  But until someone comes up with something better, it's a start.

I'll be out of town for the next few days, so responses will be limited.

josh
