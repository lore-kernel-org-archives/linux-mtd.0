Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DWVYW-0008QP-I5
	for linux-mtd@lists.infradead.org; Fri, 13 May 2005 04:30:01 -0400
Message-ID: <42846606.8070108@inf.u-szeged.hu>
Date: Fri, 13 May 2005 10:32:06 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Peter Grayson <pgrayson@realmsys.com>
References: <1115400358.4422.92.camel@pgrayson1.realmsys.com>
In-Reply-To: <1115400358.4422.92.camel@pgrayson1.realmsys.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Centralized Summary
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pete,

We updated the summary patches.

Erase block summary:
- fix a small bug, may cause problem only in debug mode

Centralized summary:
- fix a small bug, may cause problem only in debug mode
- fix locking problem on empty fs
- fix bad block size accounting (and counting free space)

You can download the patches from our site.

Bye,
Ferenc
