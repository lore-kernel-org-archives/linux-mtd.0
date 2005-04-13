Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DLhG9-0005QN-Lx
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2005 08:46:22 -0400
Message-ID: <425D14D4.6080408@inf.u-szeged.hu>
Date: Wed, 13 Apr 2005 14:47:16 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Jiang Jun-A21079 <A21079@motorola.com>
References: <3BCB5FB76AFFF646BCFBC02A889B64F3022870CA@ZCH07EXM05.corp.mot.com>
In-Reply-To: <3BCB5FB76AFFF646BCFBC02A889B64F3022870CA@ZCH07EXM05.corp.mot.com>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Cc: =?ISO-8859-2?Q?Gyim=F3thy_Tibor?= <gyimothy@inf.u-szeged.hu>,
	Gu Susan-w15879 <w15879@motorola.com>,
	MTD List <linux-mtd@lists.infradead.org>,
	=?ISO-8859-2?Q?S=F3gor_Zolt=E1n?= <weth@shogy.ohsh.u-szeged.hu>
Subject: Re: two issues about summary patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Kevin,

We've investigated you issues about summary patch.

The second one (wrong padding) is OK, you was right, we've fixed it, the 
new patch will be released soon.

But we have some questions according the first issue:

>         Function jffs2_sum_add_kvec() will be called by function jffs2_flash_direct_writev() in writev.c. It will add summary information into jeb->sum_collected before writing data into flash, But if we write data with function jffs2_flash_write(). It will bypass summary information. In our NOR flash case. Jffs2_flash_write() be defined with c->mtd->write().jffs2_flash_write() be called in gc.c and nodemgmt.c. in gc.c when we garbage collected pristine node, jffs2_flash_write() will be call without summary information handled. We will lose summary information of that pristine node at next power on. I think function jffs2_flash_write() in wbuf.c is better than c->mtd->write(). It will handle summary information through jffs2_flash_writev().
>With jffs2_flash_write() in nodemgmt.c, if node has been obsolete, should we remove its summary information too?
>  
>
Are you sure that you used the latest version of summary patch? It was a 
problem before 20050117, but now it should work.

If summary is enabled jffs2_can_mark_obsolete(c) is set to false (in 
os-linux.h). Becauseof it the node will not be obsolated by setting the 
node accurate bit, so we don't need to delete its summary information.

If summary support is enabled jffs2_flash_write() will be not called by 
anyone. In jffs2_mark_node_obsolate() it will return before calling 
jffs2_flash_write() because jffs2_can_mark_obsolete(c) is set to false:

        if (!jffs2_can_mark_obsolete(c) || jffs2_is_readonly(c) ||
                (c->flags & JFFS2_SB_FLAG_BUILDING)) {
                /* We didn't lock the erase_free_sem */
                return;
        }

In gc.c the patches after 20050117 replace jffs2_flash_write() to 
jffs2_flash_writev().

Regards,
Ferenc
