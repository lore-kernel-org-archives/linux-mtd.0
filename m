From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <41595913.4040007@yandex.ru>
References: <41595913.4040007@yandex.ru>
Content-Type: text/plain
Message-Id: <1096375038.30942.30.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 28 Sep 2004 13:37:19 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 an nodes checking
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-09-28 at 16:29 +0400, Artem B. Bityuckiy wrote:
> Why when user opens a big file he need to wait while all it's contents 
> will be read? Moreover, the CRCs are checked anyway on any read request 
> (of course, for nodes which are involved to this request). Is this delay 
> really needed? Why not to just leave the inode in the 
> INO_STATE_UNCHECKED state - the Garbage Collector will check it some 
> time? ....

Bear in mind that we discard nodes with invalid data_crc. So they do not
obsolete _older_ nodes which cover the same area. If we don't check the
CRC we can't build up the red-black tree for the inode in the same way
we do at the moment, because we don't actually know which nodes are
valid. We'd have to invent another kind of data structure, in which we
could keep information about overlapping nodes, some of which may turn
out not to be valid. 

At the moment we just have the unsorted raw->next_in_ino list, and the
rbtree in the jffs2_inode_info. 

But yes, it might make some sense to perform this optimisation if it's
not _too_ painful to do it.

-- 
dwmw2
