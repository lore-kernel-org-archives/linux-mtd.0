Received: from [65.205.244.70] (helo=mail1.dmz.pioneer-pra.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bl9Jk-000583-QH
	for linux-mtd@lists.infradead.org; Thu, 15 Jul 2004 12:42:45 -0400
Received: from philt.pioneer-pdt.com (sd-gateway.pioneer-pra.com
	[207.215.131.7]) (using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(Client did not present a certificate)
	by mail1.dmz.pioneer-pra.com (Postfix) with ESMTP id ACF1239006D
	for <linux-mtd@lists.infradead.org>;
	Thu, 15 Jul 2004 09:42:39 -0700 (PDT)
From: Patrick Hilt <philt@pioneer-pra.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 15 Jul 2004 09:47:47 -0700
References: <200407091608.14442.philt@pioneer-pdt.com>
In-Reply-To: <200407091608.14442.philt@pioneer-pdt.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200407150947.47727.philt@pioneer-pra.com>
Subject: Re: JFFS 2 Question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi guys!
Thanks a lot or your input. Definitely appreciate it!!
In the project I am working on, we have been seeing an occasional corruption 
of our JFFS2 partition upon sudden loss of power and we get that even after 
writing to the parition and sync'ing. Could that be caused by the power loss 
happening during a block rotation / garbage collection?

Thanks again,

Patrick


On Friday 09 July 2004 04:08 pm, Patrick Hilt wrote:
> Hi list!
> Is there a way to make sure data is being written to physical flash when
> using JFFS2? In other words, After writing a file on a JFFS2 partition, is
> there anything that can be done to make sure that the data is getting
> written to the flash right away? Would "sync" or "fsync" have that effect?
>
> Thanks a lot in advance for any input!!!
>
> Happy weekend,
>
> Patrick
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
