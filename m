Received: from fmfdns01.fm.intel.com ([132.233.247.10] helo=calliope1.fm.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Y8Ix-0007VC-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Feb 2002 16:18:48 +0000
Received: from fmsmsxvs041.fm.intel.com (fmsmsxvs041.fm.intel.com [132.233.42.126])
	by calliope1.fm.intel.com (8.9.1a+p1/8.9.1/d: relay.m4,v 1.49 2002/01/25 02:16:58 root Exp $) with SMTP id QAA20585
	for <linux-mtd@lists.infradead.org>; Tue, 5 Feb 2002 16:29:55 GMT
Received: from fmsmsx29.FM.INTEL.COM ([132.233.42.29])
 by fmsmsxvs041.fm.intel.com (NAVGW 2.5.1.16) with SMTP id M2002020508304709375
 for <linux-mtd@lists.infradead.org>; Tue, 05 Feb 2002 08:30:47 -0800
Message-ID: <413FBB0BA5AED1119122000083234B1A01DD2975@alpha.igk.intel.com>
From: "Kolakowski, Mikolaj" <Mikolaj.Kolakowski@intel.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Problem with files removing
Date: Tue, 5 Feb 2002 17:29:24 +0100 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I have added d_delete call to jffs2_unlink, anybody could verify the code
below?
Will it work? 

static int jffs2_unlink(struct inode *dir_i, struct dentry *dentry)
{
	struct jffs2_sb_info *c = JFFS2_SB_INFO(dir_i->i_sb);
	struct jffs2_inode_info *dir_f = JFFS2_INODE_INFO(dir_i);
	struct jffs2_inode_info *dead_f = JFFS2_INODE_INFO(dentry->d_inode);
	int ret;
    
	ret = jffs2_do_unlink(c, dir_f, dentry->d_name.name, 
			       dentry->d_name.len, dead_f);
	dentry->d_inode->i_nlink = dead_f->inocache->nlink;

  	if (!ret)                                                 
    	{
        		if (dentry->d_inode->i_data.nrpages)
            		truncate_inode_pages(&dentry->d_inode->i_data, 0);
        		d_delete(dentry);
    	}
	return ret;
}

Thanks
Mikolaj
