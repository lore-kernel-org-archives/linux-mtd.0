Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKImf-0006bw-5q
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2004 11:53:54 -0400
Message-ID: <417689F0.3030200@yandex.ru>
Date: Wed, 20 Oct 2004 19:53:20 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <41767593.9030004@inf.u-szeged.hu> <417683AC.6000400@yandex.ru>
	<417688F2.8070905@inf.u-szeged.hu>
In-Reply-To: <417688F2.8070905@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ferenc Havasi wrote:
> The reason is the following: the summary node is at the end of the erase 
> block, and it has not fixed size (its size depends on the information it 
> stores).
> 
> The main advantage of using summary node is to avoid the original 
> scanning method. So we cannot use the original full-scanning method to 
> determine  the begining of the summary node (using only 
> JFFS2_NODETYPE_INODE_SUM).
> 
> Our method is the following:
> - read some bytes at the end of the erase block
> - if the last word is JFFS2_SUM_MAGIC than we will almost sure that it 
> is an erase block which has summary
> - the word before this magic is the length of the node
> - using this length we can check that it is really a 
> JFFS2_NODETYPE_INODE_SUM node, and process it
> 
> I can't image more effective method to determine the begining of the 
> summary node. (if you have better suggestion...) And because the magic 
> is inside of the summary node I think it is fit to the philosophy of 
> JFFS2 - but a little bit tricky.
Ok, I got it. I was wrong, sorry.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
