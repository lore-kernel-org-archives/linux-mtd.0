Received: from gate.aminocom.com
	([193.132.141.181] helo=aminocom.com ident=0)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16w0zR-0001BK-00
	for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2002 14:21:21 +0100
Received: from aminocom.com (eclarke@eclarke.aminocom.com [10.171.23.32])
	by aminocom.com (8.11.6/8.11.6) with ESMTP id g3CDLLO08272
	for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2002 14:21:21 +0100
Message-ID: <3CB6DF08.D1438B22@aminocom.com>
Date: Fri, 12 Apr 2002 14:20:08 +0100
From: Elizabeth Clarke <eclarke@aminocom.com>
MIME-Version: 1.0
To: "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: Writing JFFS2 image to Nand flash
References: <541025071C7AC24C84E9F82296BB9B952CF6@OPTEX1.optex.local>
Content-Type: text/plain; charset=us-ascii
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

John Hall wrote:
> This image should then be written to the device with cp or dd.
> However, if I have bad blocks on the device then dd fails.

Not sure about dd, I've just been using cp. But the main issue...

> I'm not using the jffs2_nand_branch - I had not realised there was one.

...is that. Get that branch and it should work. At least, it works here
:)


> I have the latest CVS code from the trunk. What changes are there to
> support nand flash - is it just limiting the number of writes to a page,
> or are there other things?

Lots of things!

Beth
