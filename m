Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13eHuR-0007kF-00
	for mtd-list@infradead.org; Wed, 27 Sep 2000 15:10:07 +0100
Received: from dns.cygnus.co.uk ([194.130.39.3] helo=pasanda.cygnus.co.uk)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13eHuQ-0007k9-00
	for mtd@infradead.org; Wed, 27 Sep 2000 15:10:06 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <39D1FF35.68F6B84@cotw.com> 
References: <39D1FF35.68F6B84@cotw.com> 
To: "Steven J. Hill" <sjhill@cotw.com>
Cc: MTD List <mtd@infradead.org>
Subject: Re: Question on 'doc_read_ecc'... 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 27 Sep 2000 15:10:29 +0100
Message-ID: <23804.970063829@passion.cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


sjhill@cotw.com said:
> If I am understanding things correctly, in 'doc_read_ecc' we prevent
> the caller from reading across a 512 byte boundary and that they
> cannot read more than 512 bytes at a time. Is this correct for DoC2xxx
> devices and should it be the case for NAND devices as well? I believe
> that for NAND devices it makes sense since VFS and filesystems on
> average assume a 512 byte sector size. Just looking for agreement on
> my thought process. 

Scrap the limitation. It was OK when the only use of doc2000 was NFTL, but 
now it's broken. doc2000.c ought to do the right thing.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
