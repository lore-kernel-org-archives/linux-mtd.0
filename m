Received: from e6.ny.us.ibm.com ([32.97.182.146])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Dl9q2-0000pg-Jc
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2005 14:20:41 -0400
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e6.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j5MIKWMX010415
	for <linux-mtd@lists.infradead.org>; Wed, 22 Jun 2005 14:20:32 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j5MIKWZJ256194
	for <linux-mtd@lists.infradead.org>; Wed, 22 Jun 2005 14:20:32 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.13.3) with ESMTP id j5MIKLBO026705
	for <linux-mtd@lists.infradead.org>; Wed, 22 Jun 2005 14:20:21 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: Timofey Kutergin <tkutergin@mail.ru>
In-Reply-To: <E1Dl4hM-00094e-00.tkutergin-mail-ru@f21.mail.ru>
References: <E1Dl4hM-00094e-00.tkutergin-mail-ru@f21.mail.ru>
Content-Type: text/plain
Date: Wed, 22 Jun 2005 13:20:15 -0500
Message-Id: <1119464415.16063.22.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Re[2]: clean marker size for NOR w/ECC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-06-22 at 16:51 +0400, Timofey Kutergin wrote:
> yes, I agree - eccsize is smallest write size. Or size of region which
> can be written only once after block erase. What I meant was that if
> eccsize is greater than cleanmarker size, JFFS2 does not skip rest of
> first ECC region in block and tries to write data to it. This causes
> write failure. Therefore patch sets clean marker size to eccsize if
> eccsize is greater than 16.

IIRC, JFFS2 will pad the node to the correct size so write failure
shouldn't be an issue.  I could be mistaken, it's been a while.

Is this a problem you are currently seeing, or is this all just
theoretical?  To my knowledge, there are no other NOR ECC flash chips
out there.  Even if there were, support would need to be added to MTD
before they could be used.  We could adapt JFFS2 at that time if needs
be.

josh
