Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E4dMA-0008GM-TW
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 07:42:24 -0400
Message-ID: <43007F9B.90307@inf.u-szeged.hu>
Date: Mon, 15 Aug 2005 13:42:19 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <dedekind@yandex.ru>
References: <42E5ECE5.4010901@inf.u-szeged.hu>	<20050726093215.GD15903@wohnheim.fh-wedel.de>	<20050726100330.GF15903@wohnheim.fh-wedel.de>	<42EDF04C.1010108@inf.u-szeged.hu>	<20050801095645.GA32464@wohnheim.fh-wedel.de>	<42EDF470.4060208@inf.u-szeged.hu>	<20050801104343.GB32464@wohnheim.fh-wedel.de>	<42EE2B78.70500@inf.u-szeged.hu>	<20050801141841.GD32464@wohnheim.fh-wedel.de>	<42FB68AE.6070805@inf.u-szeged.hu>
	<20050815094816.GA27229@wohnheim.fh-wedel.de>
	<43006C87.3090806@yandex.ru>
In-Reply-To: <43006C87.3090806@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
 block
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

> >diff -Narup Mtd-orig/fs/jffs2/build.c mtd/fs/jffs2/build.c
> >--- Mtd-orig/fs/jffs2/build.c    2005-07-30 17:29:27.000000000 +0200
> >+++ mtd/fs/jffs2/build.c    2005-08-11 15:17:41.000000000 +0200
> >@@ -336,6 +336,7 @@ int jffs2_do_mount_fs(struct jffs2_sb_in
> >         c->blocks[i].first_node = NULL;
> >         c->blocks[i].last_node = NULL;
> >         c->blocks[i].bad_count = 0;
> >+        c->blocks[i].sum_collected = NULL;
> >     }
>
> And my question. Why 'sum_collected; is per-eraseblock? JFFS2 always 
> writes to c->nextblock, so 'sum_collected' ought to be per-superblock, 
> isn't it? Why do you inflate the c->blocks[] array ?

We thought a lot about it when we designed summary. Now I don't remember 
why we decided to do it in this way (Zoltan, do you?), we'll reconsider it.

Bye,
Ferenc
