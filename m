Received: from dsl-64-130-201-237.telocity.com ([64.130.201.237] helo=Dual166.localdomain)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16MA0u-0002Io-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 Jan 2002 15:42:40 +0000
Reply-To: <acurtis@onz.com>
From: "Allen Curtis" <acurtis@onz.com>
To: <sheela_kashyap@yahoo.com>
Cc: <linux-mtd@lists.infradead.org>
Subject: Re: (no subject)
Date: Thu, 3 Jan 2002 07:46:16 -0800
Message-ID: <NCBBIINEHIPFGJPLBEIFMECHDDAA.acurtis@onz.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

We had the same problem where the /dev/ entries where not included in the
JFFS image. In our case I ran MAKEDEV to recreate the missing devices.

The version of JFFS we are using came with HHL Professional 2.0. Based on
the CVS versions, it looks like it is the original code release.
