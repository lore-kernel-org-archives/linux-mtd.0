Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BiAWC-0002aY-LZ
	for linux-mtd@lists.infradead.org; Wed, 07 Jul 2004 07:23:17 -0400
Received: from [192.168.37.21] (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id ED8CC2288A
	for <linux-mtd@lists.infradead.org>;
	Wed,  7 Jul 2004 15:23:09 +0400 (MSD)
Message-ID: <40EBDD1D.7090506@yandex.ru>
Date: Wed, 07 Jul 2004 15:23:09 +0400
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <40E14E92.80200@yandex.ru>
In-Reply-To: <40E14E92.80200@yandex.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Wasted space
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ok guys, if you don't know what means wasted_size fields of that 
structures and how it differs from dirty_space I'll teach you :-) (joke).

Wasted space is the space lost because of block structure and because of 
  JFFS2 data organization, i.e.
1. Old clean markers.
2. Paddings
3. Small peaces of space at the end of blocks.
4. Sometimes dirty nodes on *clean blocks* if theirs total size doesn't 
exceed some limit.

Wasted space is only meaningful for clean blocks (which are on 
clean_list). Once block is moved to dirty_list (or another list), its 
wasted space becomes dirty since it is assumed that this space can be 
reused now (after Garb. Coll.) (whereas wasted space is considered as 
not reusable or as lost).

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
