Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14r3hp-0006PI-00
	for mtd-list@infradead.org; Sat, 21 Apr 2001 21:10:09 +0100
Message-ID: <002a01c0ca9f$9bd1c280$8997143e@jocke>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
References: <002d01c0ca3a$23ee2f20$5cd9b5d4@jocke>  <000901c0c90c$2acad3e0$8b96143e@jocke> <000e01c0c8d6$dfb791c0$0a01a8c0@Win1> <19069.987688353@redhat.com> <2192.987784007@redhat.com>  <449.987854916@redhat.com>
Subject: Re: JFFS2 as root FS 
Date: Sat, 21 Apr 2001 22:14:02 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> Joakim.Tjernlund@lumentis.se said:
> > how to disable compression in JFFS2(can that  be done with
> > mkfs.jffs2?).
>
> Sorry, missed that bit. Just replace jffs2_{de,}compress() with NOPs.
> Return zero from jffs2_compress(). Rebuild jffs2 and mkfs.jffs2 (it pulls
> in the compr files from the kernel dir).
>
> Why, though?

To gain performace, we will have a PPC860 which isn't very powerful but
we will have plenty of flash and RAM. By the way, will mount time be reduced
if I remove compression?

         Jocke
>
> --
> dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
