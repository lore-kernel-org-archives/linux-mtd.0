Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14qwBt-0003cL-00
	for mtd-list@infradead.org; Sat, 21 Apr 2001 13:08:41 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14qwBs-0003cF-00
	for mtd@infradead.org; Sat, 21 Apr 2001 13:08:40 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <002d01c0ca3a$23ee2f20$5cd9b5d4@jocke> 
References: <002d01c0ca3a$23ee2f20$5cd9b5d4@jocke>  <000901c0c90c$2acad3e0$8b96143e@jocke> <000e01c0c8d6$dfb791c0$0a01a8c0@Win1> <19069.987688353@redhat.com> <2192.987784007@redhat.com> 
To: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
Cc: mtd@infradead.org
Subject: Re: JFFS2 as root FS 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 21 Apr 2001 13:08:36 +0100
Message-ID: <449.987854916@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Joakim.Tjernlund@lumentis.se said:
> how to disable compression in JFFS2(can that  be done with
> mkfs.jffs2?). 

Sorry, missed that bit. Just replace jffs2_{de,}compress() with NOPs. 
Return zero from jffs2_compress(). Rebuild jffs2 and mkfs.jffs2 (it pulls 
in the compr files from the kernel dir).

Why, though?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
