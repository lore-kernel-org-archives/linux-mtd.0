Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14TUdP-0007AF-00
	for mtd-list@infradead.org; Thu, 15 Feb 2001 20:04:11 +0000
Received: from rcmenter.iserver.net ([192.41.35.12])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14TUdN-0007A9-00
	for mtd@infradead.org; Thu, 15 Feb 2001 20:04:10 +0000
Message-Id: <200102152004.NAA04029@rcmenter.iserver.net>
Subject: slight error in slram.c
From: Russ Dill <Russ.Dill@asu.edu>
To: mtd@infradead.org
In-Reply-To: <E6FE4E054F02D511818E00025558B61D429E29@cluster01.axis.se>
Content-Type: text/plain
Date: 15 Feb 2001 13:02:03 -0700
Mime-Version: 1.0
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I was looking through slram.c for some example code ($Id: slram.c,v 1.10
2000/07/03 10:01:38 dwmw2 Exp $), and found a slight typo/error in
init_slram

        mymtd = kmalloc(sizeof(struct mtd_info), GFP_KERNEL);
        
        memset(mymtd, 0, sizeof(*mymtd));
        
        if (mymtd)
        {
                memset((char *)mymtd, 0, sizeof(struct mtd_info));


Just a little thing, but hey, it might matter to someone, someday



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
