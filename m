Received: from mail.thb.de ([62.225.75.172] helo=mail.bury.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHcD0-0005mX-FZ
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 15:42:47 +0000
Received: from [172.20.50.50] (port=39083)
 by mail.bury.com with esmtp (Exim 4.76)
 (envelope-from <brandt@bury.com>) id 1UHcCs-00058a-2Y
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 16:42:38 +0100
Message-ID: <514735EE.5050806@bury.com>
Date: Mon, 18 Mar 2013 16:42:38 +0100
From: Thomas Brandt <brandt@bury.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Master node recovery /corruption
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've a little question regarding the recovery of a master node.
In my case the first master node was corrupted and could not be recovered.

After taking a look to the code:
/fs/ubifs/recovery.c

int ubifs_recover_master_node(struct ubifs_info *c)
{
	void *buf1 = NULL, *buf2 = NULL, *cor1 = NULL, *cor2 = NULL;
	struct ubifs_mst_node *mst1 = NULL, *mst2 = NULL, *mst;
	const int sz = c->mst_node_alsz;
	int err, offs1, offs2;

	dbg_rcvry("recovery");

	err = get_master_node(c, UBIFS_MST_LNUM, &buf1, &mst1, &cor1);
	if (err)
		goto out_free;

	err = get_master_node(c, UBIFS_MST_LNUM + 1, &buf2, &mst2, &cor2);
	if (err)
		goto out_free;

I see that if getting the first master node fails the function returns
without trying to get the second master node, which should be as far as
I understand it, a mirror of the first master node?!.

Is there any reason why it must be handled in that way?
Because after I've done a little hack (don't care that first node fails)
ithe first master node was recovered from the second one and it could be
mounted without any errors.

At the moment it difficult for me to say whats right or wrong!?
Might there be a bug?

Cheers,
Thomas
