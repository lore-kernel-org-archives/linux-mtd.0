Date: Wed, 12 Dec 2007 11:51:40 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: linux-mtd@lists.infradead.org
Subject: Limited support of NAND features in MTD.
Message-ID: <Pine.LNX.4.64.0712121107010.19025@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: joern@logfs.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

It is not a secret that current MTD supports very limited set of NAND
features. Some of missed features like partial page read or cached read
are able to improve file system performance and its implementation do
not require s/w redesign. 

I have a question is there any limitations/restrictions to support extended features? 
Does it make sense to implement these features and manage them
through nand_chip->options flag, letting people to choose whether to use
features or not? If it is not a good idea what is the best way to manage
it?

Currently my clooeague and I did prototypes of partial page read and cached read 
functionalities showing performance increase. For example partial page read showed about 20%
of file open/stat time performance increase in JFFS2 on LP NAND. Cached
read increases overall read performance but value strongly depends on
platform IO latencies. Now we are thinking to create and sent patches.

So your suggestions/recomendations are welcome!

Thanks,
Alexey 
