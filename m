Received: from anchor-post-30.mail.demon.net ([194.217.242.88])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bay5V-0005E1-Ss
	for linux-mtd@lists.infradead.org; Thu, 17 Jun 2004 10:42:01 -0400
Received: from mailgate.cabletime.com ([80.177.138.66] helo=cabletime.com)
	by anchor-post-30.mail.demon.net with esmtp (Exim 3.35 #1)
	id 1Bay5R-000IJe-0U
	for linux-mtd@lists.infradead.org; Thu, 17 Jun 2004 15:41:53 +0100
Received: from [191.53.51.21] (helo=adh)
	by cabletime.com with esmtp (Exim 3.35 #1 (Debian))
	id 1Bay5K-0002QI-00
	for <linux-mtd@lists.infradead.org>; Thu, 17 Jun 2004 15:41:46 +0100
From: Andy Hawkins <a.hawkins@cabletime.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1087483311.2602.11.camel@adh>
Mime-Version: 1.0
Date: 17 Jun 2004 15:41:51 +0100
Content-Transfer-Encoding: 7bit
Subject: Bug in mtd_blkdevs-24.c for devfs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I guess people don't generally use a large number of flash devices, but
if there are more than 10, then the devfs entries will be wrong because
of the following lines in add_mtd_blktrans_dev:

                char name[2];

                name[0] = '0' + new->devnum;
                name[1] = 0;

		new->blkcore_priv = 
			devfs_register(tr->blkcore_priv->devfs_dir_handle,
				       name, DEVFS_FL_DEFAULT, 				       tr->major,
				       new->devnum,         				       S_IFBLK|S_IRUGO|S_IWUGO,
				       &mtd_blktrans_ops, NULL);

For any devnum > 9, this will generate a punctuation character. The
following code is more correct (and is the same as in mtdchar.c)

		char name[10];

		sprintf(name,"%d",new->devnum);

		new->blkcore_priv = 
			devfs_register(tr->blkcore_priv->devfs_dir_handle,
				       name, DEVFS_FL_DEFAULT, 				       tr->major,
				       new->devnum,         				       S_IFBLK|S_IRUGO|S_IWUGO,
				       &mtd_blktrans_ops, NULL);

Apologies for the formatting, I can generate a patch if required...

Andy
