Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CCHsJ-00061v-Tv
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2004 09:18:42 -0400
Message-ID: <41596471.5020108@yandex.ru>
Date: Tue, 28 Sep 2004 17:17:37 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <41595913.4040007@yandex.ru>
	<1096375038.30942.30.camel@hades.cambridge.redhat.com>
In-Reply-To: <1096375038.30942.30.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

David Woodhouse wrote:
> Bear in mind that we discard nodes with invalid data_crc. So they do not
> obsolete _older_ nodes which cover the same area. If we don't check the
> CRC we can't build up the red-black tree for the inode in the same way
> we do at the moment, because we don't actually know which nodes are
> valid. We'd have to invent another kind of data structure, in which we
> could keep information about overlapping nodes, some of which may turn
> out not to be valid. 

Oh, I missed this aspect! Thanks.

As I understand if we disable the CRC checking at the iget() request, we 
will lost the JFFS2 some "logging" capabilities.

For example, if the power is off during the new node write operation, we 
don't lost older data since the older node's data will be used. But if 
we won't check the data CRC, we will have all zeros in the correspondent 
piece of the file (the hole node).

Ok. But what if we check only last node (with the highest version) and 
if it is OK, don't check anything more? If it is bad, check previous, 
and so on. It seems for me, these checks are enough. We cover the 
situation with unexpected power losses.

There are some scenarios, where we will lost some data. For example, 
some sector on the flash device becomes bad, and we lost a node which is 
situated on this sector. If there is older node for this data range, the 
current implementation will use it. But in this case I am not sure that 
the data from the older node is better than just zeros. Are such flash 
faults JFFS2's business?

What do you think?


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
