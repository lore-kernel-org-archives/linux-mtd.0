Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14sONA-0000VU-00
	for mtd-list@infradead.org; Wed, 25 Apr 2001 13:26:20 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14sON9-0000VO-00
	for mtd@infradead.org; Wed, 25 Apr 2001 13:26:19 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3AE6C0DC.CFA18C77@crossnet.co.jp> 
References: <3AE6C0DC.CFA18C77@crossnet.co.jp>  <3AE69E21.CDCF90A1@crossnet.co.jp> <20010424113037.FQCK11909.t21mta02-app.talk21.com@t21mtaV-lrs> <3311.988123586@redhat.com> <25105.988194419@redhat.com> 
To: Masami Komiya <mkomiya@crossnet.co.jp>
Cc: mtd@infradead.org
Subject: Re: (No Subject) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 25 Apr 2001 13:26:08 +0100
Message-ID: <4501.988201568@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


mkomiya@crossnet.co.jp said:
>  I was misunderstanding about the definitions in cfi_probe_chip().
> Attached patch is for cfi_cmdset_0002.c applied simon's patch. 

Looks like you mean it's for cfi_cmdset_0002.c _without_ Simon's patch. It 
looks fine to me - I'll give it a day or so for people to object before I 
apply it though :)

Thanks.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
