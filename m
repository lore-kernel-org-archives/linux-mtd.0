Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14sU9G-0003cf-00
	for mtd-list@infradead.org; Wed, 25 Apr 2001 19:36:22 +0100
Received: from topaz.3com.com ([192.156.136.158])
	by infradead.org with esmtp (TLSv1:DES-CBC3-SHA:168)
	(Exim 3.20 #2)
	id 14sU9A-0003cY-00
	for mtd@infradead.org; Wed, 25 Apr 2001 19:36:20 +0100
Received: from opal.3com.com (opal.3com.com [139.87.50.117])
	by topaz.3com.com (Switch-2.1.0/Switch-2.1.0) with ESMTP id f3PIXjf06443
	for <mtd@infradead.org>; Wed, 25 Apr 2001 11:33:45 -0700 (PDT)
Received: from hqoutbound.ops.3com.com (hqoutbound.ops.3com.com [139.87.48.104])
	by opal.3com.com (Switch-2.1.0/Switch-2.1.0) with SMTP id f3PIZO705717
	for <mtd@infradead.org>; Wed, 25 Apr 2001 11:35:25 -0700 (PDT)
From: Chester_Szczepucha@3com.com
To: mtd@infradead.org
Message-ID: <88256A39.00661864.00@hqoutbound.ops.3com.com>
Date: Wed, 25 Apr 2001 11:36:01 -0700
Subject: JFFS usage question
Mime-Version: 1.0
Content-type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>




Guys,

I do not understand all the issues involved, so please bear with me.
I've got a FLASH that is partially occupied (start and end) with non JFFS stuff.
In the middle I've got some room
where I'd like to put JFFS.

After
mount -t jffs /dev/rom0 fl
Flash scan completes with 2 hexdumps and afterwards
I get repeated complaints from garbage collector regarding lack of oldest node.

My intent was to create an empty file system where I could store some files for
persistance.

Could you please tell me if that makes sense?
Would you be able to suggest some reading or otherwise help me?

Chester




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
