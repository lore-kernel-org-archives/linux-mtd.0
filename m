Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CEURJ-0000Zz-EU
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 11:08:01 -0400
Message-ID: <41616717.3020104@yandex.ru>
Date: Mon, 04 Oct 2004 19:07:03 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <416122A1.4060302@oktetlabs.ru>	
	<1096885344.30942.559.camel@hades.cambridge.redhat.com>	
	<416127B7.3070505@yandex.ru>	
	<1096893242.22034.5.camel@weaponx.rchland.ibm.com>	
	<41614B2F.8060901@yandex.ru>	
	<1096895892.30942.614.camel@hades.cambridge.redhat.com>	
	<41615BA7.60801@yandex.ru>
	<1096899817.30942.618.camel@hades.cambridge.redhat.com>
In-Reply-To: <1096899817.30942.618.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: inode checkpoints
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Mon, 2004-10-04 at 18:18 +0400, Artem B. Bityuckiy wrote:
> 
>>     jint32_t data_crc;  /* the CRC checksum of the checkpoint data */
>>     jint32_t node_crc;  /* the CRC checksum of the checkpoint object without data */
> 
> 
> You probably don't need to separate these. You'll only ever want to read
> the _whole_ thing anyway, surely?

No...

Let's discuss when ICP is obsolete...

Introduce definition of ICP entry: checkpoints describe nodes and 
contain a number of checkpoint entries; each such entry describes one 
node. FICP entries are described by the struct jffs2_raw_ficp_entry 
structure (see the prev. letter :-) ). DICP entries are described by the 
struct jffs2_raw_dicp_entry structure. ICP entry is said to be valid or 
obsolete if the correspondent node is valid or obsolete.

Also, a pre-note: each ICP has the correspondent jffs2_node_ref 
structure which is always in-core. Since the list of node_refs belonging 
to one inode isn't sorted, the ICP node_ref object may be anywhere in 
the list. And to find the ICP's node_ref, the list may be scanned.

One more global idea is that I don't want to introduce more data 
structures which are in-core. This is the JFFS2 drawback that it eats 
more memory if more files/nodes are added to the file system... So, I 
don't want to enlarge this drawback... So, I want to have in-core only 
one more node_ref object for each ICP node... Don't sure this is 
possible, but it would be nice (agree?)

OK, A checkpoint node may be obsolete because of two reasons:

1 Newer checkpoint node exists which obsoletes the checkpoint; such 
checkpoints are detected by the version number;
2 All the nodes which are described by the checkpoint were updated or 
deleted and hence, the checkpoint isn't valid anymore; to detect such 
obsolete checkpoints, the node_ref array is scanned; if there is no more 
then ICP_MINNODES (some constant) valid ICP entries, the checkpoint is 
obsolete; to check how many valid nodes are described by the checkpoint, 
the lowest_version and highest_version fields are used;

ICP_MINNODES means the minumum number of ICP entries.

So, let us suppose we are going to garbage collect ICP. First, we want 
to detect, if the ICP valid or obsolete. For this purpose, we need to 
know the highest_version and lowest_version (thus, read the ICP header). 
Then run through the node_ref list and find out how many *valid* node 
entries the old ICP has (I suppose there is no inode cache for the 
inode, referred by the ICP). If this number is too small, don't remove 
the ICP, just move it to the other block...

We would keep the highest_version and lowest_version (may be other too) 
fields in-core, but again, it seems bad to me... So, we need to read ICP 
headers sometimes.

Thus, I think it will be needed to have the separate data_crc and node_crc.


> 
> Other than that it looks sane enough at first glance. It looks like it
> _will_ be useful enough for NOR flash too. I'd rather not have two
> implementations if this is good enough for both.

Too many differences... For example, the direntry ICPs *aren't needed* 
at all. Data structure for regfiles is much more simpler (no data[]) 
array at all if to see to my structures).

There is a big issue how to split big ICPs... for NOR ICPs are always 
small. May be it is better to write them directly on iget() request 
since they are small...

And so on so on.
:-)

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
