Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKIem-0006Ql-Es
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2004 11:45:48 -0400
Message-ID: <417688F2.8070905@inf.u-szeged.hu>
Date: Wed, 20 Oct 2004 17:49:06 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
References: <41767593.9030004@inf.u-szeged.hu> <417683AC.6000400@yandex.ru>
In-Reply-To: <417683AC.6000400@yandex.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
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

> 1. Why did you introduce the JFFS2_SUM_MAGIC constant? As I understand, 
> the node's magic field is needed to identify the *beginning of node*, 
> *not the node type*. The type of node is defined by the next field, 
> called 'nodetype'. You use it (JFFS2_NODETYPE_INODE_SUM). So, IMHO, the 
> JFFS2_SUM_MAGIC constant doesn't fit into the common rules...

The reason is the following: the summary node is at the end of the erase 
block, and it has not fixed size (its size depends on the information it 
stores).

The main advantage of using summary node is to avoid the original 
scanning method. So we cannot use the original full-scanning method to 
determine  the begining of the summary node (using only 
JFFS2_NODETYPE_INODE_SUM).

Our method is the following:
- read some bytes at the end of the erase block
- if the last word is JFFS2_SUM_MAGIC than we will almost sure that it 
is an erase block which has summary
- the word before this magic is the length of the node
- using this length we can check that it is really a 
JFFS2_NODETYPE_INODE_SUM node, and process it

I can't image more effective method to determine the begining of the 
summary node. (if you have better suggestion...) And because the magic 
is inside of the summary node I think it is fit to the philosophy of 
JFFS2 - but a little bit tricky.

> 2. This is very minor of course, just a remark. IMHO, its better to 
> avoid too many ifdefs, so, I think it is unnecessary to place the 
> function prototype under ifdef. I mead:
> 
> +#ifdef CONFIG_JFFS2_FS_SUMMARY
> +static struct jffs2_inode_cache *jffs2_scan_make_ino_cache(struct 
> jffs2_sb_info *c, uint32_t ino);
> +#endif

Yes, I aggree. I will modify it.

Bye,
Ferenc
