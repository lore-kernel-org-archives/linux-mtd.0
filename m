Received: from [195.134.130.80] (helo=pip5.mpl.ch)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19nH12-0003Wy-Pq
	for <linux-mtd@lists.infradead.org>; Thu, 14 Aug 2003 13:15:40 +0100
Message-ID: <3F3B7D66.5030907@elsoft.ch>
Date: Thu, 14 Aug 2003 14:15:34 +0200
From: =?UTF-8?B?IkRhdmlkIE3DvGxsZXIgKEVMU09GVCBBRyki?=
 <d.mueller@elsoft.ch>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <3F3B75AA.6050701@elsoft.ch>
	<1060861648.3152.70.camel@passion.cambridge.redhat.com>
In-Reply-To: <1060861648.3152.70.camel@passion.cambridge.redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 internals question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Thu, 2003-08-14 at 12:42, "David Müller (ELSOFT AG)" wrote:
> 
>>Is it true that the read calls emitted from the JFFS2 code to the MTD HW
>>driver do not cross NAND block boundries (nand_read_ecc() has its start
>>and end point of reading in the same NAND block)?
> 
> 
> I'd first like to know why you think you need the answer to this... :)
> 

I need it to test a theory.


Dave
