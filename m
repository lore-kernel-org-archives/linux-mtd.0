Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1URlOR-0005zF-T1
 for linux-mtd@lists.infradead.org; Mon, 15 Apr 2013 15:32:32 +0000
Message-ID: <1366040060.2768.79.camel@sauron.fi.intel.com>
Subject: Re: Master node recovery /corruption
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Thomas Brandt <brandt@bury.com>
Date: Mon, 15 Apr 2013 18:34:20 +0300
In-Reply-To: <514735EE.5050806@bury.com>
References: <514735EE.5050806@bury.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-03-18 at 16:42 +0100, Thomas Brandt wrote:
> Hi,
> 
> I've a little question regarding the recovery of a master node.
> In my case the first master node was corrupted and could not be recovered.
> 
> After taking a look to the code:
> /fs/ubifs/recovery.c
> 
> int ubifs_recover_master_node(struct ubifs_info *c)
> {
> 	void *buf1 = NULL, *buf2 = NULL, *cor1 = NULL, *cor2 = NULL;
> 	struct ubifs_mst_node *mst1 = NULL, *mst2 = NULL, *mst;
> 	const int sz = c->mst_node_alsz;
> 	int err, offs1, offs2;
> 
> 	dbg_rcvry("recovery");
> 
> 	err = get_master_node(c, UBIFS_MST_LNUM, &buf1, &mst1, &cor1);
> 	if (err)
> 		goto out_free;
> 
> 	err = get_master_node(c, UBIFS_MST_LNUM + 1, &buf2, &mst2, &cor2);
> 	if (err)
> 		goto out_free;
> 
> I see that if getting the first master node fails the function returns
> without trying to get the second master node, which should be as far as
> I understand it, a mirror of the first master node?!.

'get_master_node()' function will return the last valid master node.
IOW, it already handles the corruption in this LEB. If there is
corruption, it will take the previous valid master node. It fails only
if there is an "unacceptable" corruption, see the comment above this
function.

> Is there any reason why it must be handled in that way?
> Because after I've done a little hack (don't care that first node fails)
> ithe first master node was recovered from the second one and it could be
> mounted without any errors.

It sounds like you are trying to solve a particular issue, without
providing the details.

The idea is that 'get_master_node()' should not fail on recoverable
corruptions.

> At the moment it difficult for me to say whats right or wrong!?

Sounds wrong.

> Might there be a bug?

May be, you can send some more details about the problem you are trying
to solve.

-- 
Best Regards,
Artem Bityutskiy
