Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14q9Hk-0005ji-00
	for mtd-list@infradead.org; Thu, 19 Apr 2001 08:55:28 +0100
Received: from [212.87.56.100] (helo=mail.taytron.net)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14q9Hi-0005jb-00
	for mtd@infradead.org; Thu, 19 Apr 2001 08:55:26 +0100
Message-ID: <004a01c0c8aa$e43a5ec0$0d3318b5@jolt>
From: "Florian Schirmer / TayTron" <schirmer@taytron.net>
To: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>,
	"Vipin Malik" <vipin.malik@daniel.com>
Cc: <mtd@infradead.org>
References: <001001c0c826$63b43200$0a01a8c0@Win1> <3ADDCACB.15BF0590@daniel.com> <003501c0c83d$36d89de0$d897143e@jocke> <3ADDF6C4.4FA823CD@daniel.com> <005601c0c852$f5c55e40$5c96143e@jocke>
Subject: Re: JFFS2 as root FS
Date: Thu, 19 Apr 2001 10:28:57 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi!

We had the same problem with root nfs instead of jffs(1). The problem
disappeared as soon as we removed the nfs root feature from the kernel
config. I dont know where the problem exactly is, but this is a (ugly)
solution.

Hope that helps
  Florian



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
