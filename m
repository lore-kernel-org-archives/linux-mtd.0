Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14sPSi-00011K-00
	for mtd-list@infradead.org; Wed, 25 Apr 2001 14:36:08 +0100
Received: from humbolt.nl.linux.org ([131.211.28.48] ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14sPSg-00011E-00
	for mtd@infradead.org; Wed, 25 Apr 2001 14:36:07 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3AE6C937.7C174E07@crossnet.co.jp> 
References: <3AE6C937.7C174E07@crossnet.co.jp>  <3AE6C0DC.CFA18C77@crossnet.co.jp> <3AE69E21.CDCF90A1@crossnet.co.jp> <20010424113037.FQCK11909.t21mta02-app.talk21.com@t21mtaV-lrs> <3311.988123586@redhat.com> <25105.988194419@redhat.com> <4501.988201568@redhat.com> 
To: Masami Komiya <mkomiya@crossnet.co.jp>
Cc: mtd@infradead.org
Subject: Re: (No Subject) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 25 Apr 2001 14:30:30 +0100
Message-ID: <10492.988205430@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


mkomiya@crossnet.co.jp said:
! 		if (map->buswidth == 2) {
! 			cfi->addr_unlock2=0x554; 
! 		}
! 		else {
! 			cfi->addr_unlock2=0x555; 
! 		}

Aha. Yes, it all seems to make sense now.... I think :)

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
