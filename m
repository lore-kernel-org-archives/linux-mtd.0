Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13OSt2-0002Dz-00
	for mtd-list@infradead.org; Mon, 14 Aug 2000 23:39:16 +0100
Received: from caja.ldhs.cetuc.puc-rio.br ([139.82.28.1])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13OSt0-0002DY-00
	for mtd@infradead.org; Mon, 14 Aug 2000 23:39:14 +0100
Received: from mamao.cetuc.puc-rio.br (mamao.cetuc.puc-rio.br [139.82.73.37])
	by caja.ldhs.cetuc.puc-rio.br (8.9.3/8.9.3) with ESMTP id UAA05863
	for <mtd@infradead.org>; Mon, 14 Aug 2000 20:38:29 -0300
From: "Miguel Freitas" <miguel@cetuc.puc-rio.br>
To: mtd@infradead.org
Date: Mon, 14 Aug 2000 19:38:31 GMT-3
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: Integrating 2000 and Millenium drivers
Reply-to: miguel@cetuc.puc-rio.br
Message-ID: <6011381691@mamao.cetuc.puc-rio.br>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


    Hi,
    I'm fixing some little things on DOC2000 driver, and I'm wondering 
if we could integrate 2k and Millenium drivers in a single file. There 
is so many common code in these two drivers that I guess we could 
do it like m-sys do: a single driver with a flag to enable all pipeline 
stuff from millenium and registers. A single variable pointing to the 
IO register would also be nice.
    I agree that from a first version perspective it's better to develop 
two drivers. We can work in all 2k or Mil little tricks without breaking 
the other. But maybe we are reaching a stable low level routines 
where the merge could be done.
    I don't have the millenium hardware, so I would probably break 
everything for millenium users if I make this merge. Is there 
someone with knowledge of DoC Mil (and spare time!) to help me 
with it?

    BTW, I've just begin hacking DoC last month, so forgive me if I'm 
missing some good reason why these drivers can't be merged...

Regards,



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
