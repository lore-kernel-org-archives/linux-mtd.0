Received: from xerxes.tchmachines.com ([208.76.80.175])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JRzLi-0005U5-O4
	for linux-mtd@lists.infradead.org; Thu, 21 Feb 2008 00:31:42 +0000
Received: from localhost ([127.0.0.1] helo=architechnical.net)
	by xerxes.tchmachines.com with esmtpa (Exim 4.68)
	(envelope-from <linux01@architechnical.net>) id 1JRzLa-0002Ji-TR
	for linux-mtd@lists.infradead.org; Wed, 20 Feb 2008 19:31:34 -0500
Message-ID: <60098.69.30.58.166.1203553894.squirrel@architechnical.net>
Date: Wed, 20 Feb 2008 19:31:34 -0500 (EST)
Subject: Mark OneNAND bad block good again?
From: "Pete MacKay" <linux01@architechnical.net>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Does anyone with OneNAND savvy (KP?) know if a block that's marked bad can
be restored again somehow?  We've tried overwriting the OOB and erasing
but the controller always sets the ERROR bit without changing the BB
value.  We've got some boards with corrupted OneNANDs due to low-level
programming errors overwriting the BB byte, but I maintained a list of
factory-marked bad blocks for these units before they went out (having
made this mistake previously myself ;).

I know we've got a mix of rev M, A, and B chips, and I swear I remember
being able to do this on a prototype unit when the OneNAND first came out,
but maybe I'm just senile.

Thanks!
Pete
