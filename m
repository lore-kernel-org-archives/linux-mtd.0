Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DWVfq-00009D-1C
	for linux-mtd@lists.infradead.org; Fri, 13 May 2005 04:37:34 -0400
Message-ID: <428467CD.5000902@inf.u-szeged.hu>
Date: Fri, 13 May 2005 10:39:41 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Niraj Maheshwari <niraj.maheshwari@gmail.com>
References: <f6d0cd0605051004524bab895b@mail.gmail.com>
In-Reply-To: <f6d0cd0605051004524bab895b@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: SUMMARY patch for JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Niraj,

We've tried to reproducate your problem but we was not succesfull yet.

Can you send us:
- a JFFS2 image before the things go wrong
- a JFFS2 image after went wrong (which cannot be mounted)
- the steps between these (commands you executed)

To make an image do "cat /dev/mtdblock0 >dump.jffs2" or similar.

Maybe it can be too big for mail, if you can put somewhere where we can
download from.

Thanks,
Ferenc
