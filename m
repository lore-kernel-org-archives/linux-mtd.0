Received: from [2002:d5aa:48c2::1] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CM2Wo-0003uR-6t
	for linux-mtd@lists.infradead.org; Mon, 25 Oct 2004 06:56:43 -0400
Message-ID: <417CDBDD.1010004@oktetlabs.ru>
Date: Mon, 25 Oct 2004 14:56:29 +0400
From: Artem Bityuckiy <dedekind@oktetlabs.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <41767593.9030004@inf.u-szeged.hu>	<1098365059.13633.1257.camel@hades.cambridge.redhat.com>
	<41781683.3020602@inf.u-szeged.hu> <4179009D.8010409@oktetlabs.ru>
	<417CC91D.6060002@inf.u-szeged.hu>
In-Reply-To: <417CC91D.6060002@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	jffs-dev@axis.com
Subject: Re: JFFS2 mount time
Reply-To: dedekind@oktetlabs.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Ferenc,

 > Yes, I think there are three kinds of nodes:
 > - type A contains relevant amount of data which is not needed at mount
 > time (jffs2_raw_inode)
 > - type B is (almost) fully needed at mount time (jffs2_raw_dirent)
 > - type C is any other (unkown, developements in the future...)
 >
 > To achieve as much mount time speed up as possible I think we should
 > distinguish them.
This is what I really do not like.

Ok, let us discuss now only this topic. Lt I explain why I believe it is 
vad and very *unnatural* to introduce two or more kinds of blocks.

The example of JFFS2 change that I consider natural is the introduction 
of new node type. It is natural, because of when JFFS2 was designed, 
this possibility was foreseen and taken into account. It is relatively 
easy to do this. It is possible to do this and do not affect other 
things in the JFFS2.

Conversely, the introducing several block types was not foreseen in the 
JFFS2 design. And all things in the JFFS2 are coded with the assumption 
all the blocks are equivalent.

This is my point view on the issue in general.

Now I will try to illustrate why I think so.

1. In JFFS2 there are several lists of blocks - clean_list, dirty_list, 
very_dirty_list?. Are you going to introduce clean_list_typeA, 
dirty_list_typeA, very_dirty_list_typeA, clean_list_typeB, 
dirty_list_typeB, very_dirty_list_typeB ?

2. Just do 'grep "_list" * | grep -e "\(dirty\)\|\(very\)"' and see how 
many places in JFFS2 where these lists are changed. Do you think it is 
natural to introduce 3 more lists? I believe not. What if somebody else 
will introduce one more type of block?

3. There is write buffer in the JFFS2 which is used in case of NAND. Are 
you going to have two wbufs? This is also significant change.

4. Now the GC just gives one block, and moves all the valid nodes to 
another one. In your case (if you have the JFFS2 image which was created 
  by older code, without your patch, where all node types are mixed), 
you will need to move one type of nodes to one block, another to the 
another block.

So, I think you will be needed to change many things in JFFS2. You have 
a risk to hit on a can of worms.

So, do you agree that this change is *unnatural* ?

===================================================================

 >> 4. It seems for me you will need to increase the number of blocks
 >> which are reserved for the garbage collection (double ?). This is also
 >> minor drawback.
 > I don't understand what do you mean here

I mean the sb->resv_blocks_gcmerge and related. You will need to 
increase it, which is not very good.


-- 
Best regards, Artem B. Bityuckiy
Oktet Labs (St. Petersburg), Software Engineer.
+78124286709 (office) +79112449030 (mobile)
E-mail: dedekind@oktetlabs.ru, web: http://www.oktetlabs.ru
