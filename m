Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SfZ3-0006sj-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 13:32:17 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14SfZ2-0006sd-00
	for mtd@infradead.org; Tue, 13 Feb 2001 13:32:16 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <C88F387E7F6ED4118B5308002BC3EB1E0327D5@yen.crl.dec.com> 
References: <C88F387E7F6ED4118B5308002BC3EB1E0327D5@yen.crl.dec.com> 
To: Jamey Hicks <jamey@crl.dec.com>
Cc: Jonas Holmberg <jonas.holmberg@axis.com>,
    Johan Adolfsson <johan.adolfsson@axis.com>, mtd@infradead.org
Subject: Re: Problems with cfi_cmdset_0002.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 13 Feb 2001 13:31:38 +0000
Message-ID: <11483.982071098@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


jamey@crl.dec.com said:
>  According to the spec, you should be able to look at the AMD
> autoselect codes.  Autoselect with A1=0, A0=1
> 	D[15:8] => 0x22
> 	D[7:0] => 0xC4  for top boot
> 	D[7:0] => 0x49 for bottom boot 

Yep. "if (DeviceID | 0x80) it's a top-boot chip" looks like a good heuristic. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
