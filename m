Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKWmh-0003TU-JQ
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2004 02:50:53 -0400
Message-ID: <41775D17.9050508@inf.u-szeged.hu>
Date: Thu, 21 Oct 2004 08:54:15 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
References: <41767593.9030004@inf.u-szeged.hu> <41775737.9080203@yandex.ru>
In-Reply-To: <41775737.9080203@yandex.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

> As I understand, you only prepare JFFS2 image with summaries. This is 
> great until we do not change anything. For read-only file-systems this 
> is OK.
> 
> But what if files/direntries are changed/deleted ? Do you write summary 
> information dynamically? How are you going to place nodes/direntries to 
> different blocks dynamically?

You are right, there is a small change which is really important (and 
will be ready very soon) to extend jffs2_mark_node_obsolete() to mark 
not only the node but also its entry in the summary.

Any other improvement can be done later, because after it the filesystem 
will be always coherent, because we write summary only at the of the 
erasy blocks, when it is fully "finished" - so if there is a summary 
somewhere we will not need to extend it, only to mark the obscolated nodes.

We also plan in the near future to implement the ability of generating 
summary dinamically when the filesystem finishes an erase block - which 
keep this "fast mount time" permament.

Bye,
Ferenc
