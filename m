Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKIN0-0006C4-KK
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2004 11:27:28 -0400
Message-ID: <417683AC.6000400@yandex.ru>
Date: Wed, 20 Oct 2004 19:26:36 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <41767593.9030004@inf.u-szeged.hu>
In-Reply-To: <41767593.9030004@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [OBORONA-SPAM]  JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ferenc,

I didn't investigate your patch well yet, but after 3 minuets of looking 
to it I have two questions:

1. Why did you introduce the JFFS2_SUM_MAGIC constant? As I understand, 
the node's magic field is needed to identify the *beginning of node*, 
*not the node type*. The type of node is defined by the next field, 
called 'nodetype'. You use it (JFFS2_NODETYPE_INODE_SUM). So, IMHO, the 
JFFS2_SUM_MAGIC constant doesn't fit into the common rules...

2. This is very minor of course, just a remark. IMHO, its better to 
avoid too many ifdefs, so, I think it is unnecessary to place the 
function prototype under ifdef. I mead:

+#ifdef CONFIG_JFFS2_FS_SUMMARY
+static struct jffs2_inode_cache *jffs2_scan_make_ino_cache(struct 
jffs2_sb_info *c, uint32_t ino);
+#endif



Ferenc Havasi wrote:
> Dear All,
> 
> Here is the latest version of our mount time improvement.
> 
> Using of it:
> - apply this patch on the latest version of MTD
> - compile sumtool (make command in mtd/util)
> - make your JFFS2 image as before (or you can use already created images 
> as well)
> - run sumtool to insert summary information, for example:
>   ./sumtool -i original.jffs2 -o new.jffs2 -e128KiB
> - recompile your kernel with "JFFS2 inode summary support"
> 
> Jarkko made a measurement on a real NAND device: his JFFS2 image was 
> 120819928 (115M), after running sumtool the new image was 123338752 (117M).
> 
> Using the original mount time was 55 sec, with the new image it is only 
> 8.5 sec.
> 
> It works very similar as our previous improvement: stores special 
> information at the end of the erase blocks, and at mount time if there 
> is this kind of information the scaning of the erase block is unneccessary.
> 
> New things compared to our previous improvement:
> - it was fully rewritten
> - we separated the user space tool from mkfs. (sumtool)
> - sumtool now not only inserts the summary information but also make 
> some node-reordering. There will be two kind of erase blocks: in the 
> "first type" there will be only jffs2_raw_inodes, and all other node 
> (jffs2_raw_dirent) will be stored in the "second type". It generates 
> summary at the end of all "fist type" eraseblock. (the "second type" 
> will be scanned as before, because all information is needed in 
> jffs_raw_dirent at mount time)
> 
> Ceratinly all of these things are optional (as you can see above you 
> have to select it from kernel config). The JFFS2 image produced by 
> sumtool is also usable with previous kernel because the summary node is 
> JFFS2_FEATURE_RWCOMPAT_DELETE.
> 
> I think it can be usefull not only for us. David, may I commit it to the 
> CVS?
> 
> Regards,
> Ferenc

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
