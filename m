Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14r5i5-00076N-00
	for mtd-list@infradead.org; Sat, 21 Apr 2001 23:18:33 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14r5i4-00076H-00
	for mtd@infradead.org; Sat, 21 Apr 2001 23:18:32 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <002a01c0ca9f$9bd1c280$8997143e@jocke> 
References: <002a01c0ca9f$9bd1c280$8997143e@jocke>  <002d01c0ca3a$23ee2f20$5cd9b5d4@jocke> <000901c0c90c$2acad3e0$8b96143e@jocke> <000e01c0c8d6$dfb791c0$0a01a8c0@Win1> <19069.987688353@redhat.com> <2192.987784007@redhat.com> <449.987854916@redhat.com> 
To: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
Cc: mtd@infradead.org
Subject: Re: JFFS2 as root FS 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 21 Apr 2001 23:18:24 +0100
Message-ID: <14083.987891504@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



Joakim.Tjernlund@lumentis.se said:
>  To gain performace, we will have a PPC860 which isn't very powerful
> but we will have plenty of flash and RAM. By the way, will mount time
> be reduced if I remove compression?

If Vipin's hypothesis that your speed problem is because of flash access
cycles being slow, you probably won't see an improvement. Worth a try,
though.

It shouldn't fix the mount time though - we don't look at the data on 
mount.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
