Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pvP6-0007OI-00
	for mtd-list@infradead.org; Wed, 18 Apr 2001 18:06:08 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14pvP5-0007Nn-00
	for mtd@infradead.org; Wed, 18 Apr 2001 18:06:07 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <001101c0c829$095eb570$0a01a8c0@Win1> 
References: <001101c0c829$095eb570$0a01a8c0@Win1> 
To: joakim.tjernlund@lumentis.se
Cc: mtd@infradead.org
Subject: Re: JFFS2 as root FS 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 18 Apr 2001 18:05:27 +0100
Message-ID: <23794.987613527@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


joakim.tjernlund@lumentis.se said:
> yes, I dont have devFS support compiled into the kernel. 

Hmmm. And do you have an entry for 'mtdblock' in the big array in 
init/main.c? 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
