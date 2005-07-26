Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DxQ03-00081L-AE
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 10:01:59 -0400
Message-ID: <42E6432A.7030207@inf.u-szeged.hu>
Date: Tue, 26 Jul 2005 16:05:30 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Steven Scholz <steven.scholz@imc-berlin.de>
References: <dbl42b$hcn$1@sea.gmane.org>	<1121867130.12903.15.camel@localhost.localdomain>	<42E634D0.6090300@inf.u-szeged.hu>
	<42E63731.8010209@imc-berlin.de>
In-Reply-To: <42E63731.8010209@imc-berlin.de>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 garbage collector blocking for minutes after mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Steven Scholz wrote:

> Does writing "every relevant memory representation" significantly
> increase umount time?

It depends on many-many things. Just an example: with a 6M image (where
there is a lot of small file) it costs 75K to write out.

Ferenc
