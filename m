Received: from smtp25.singnet.com.sg ([165.21.101.224])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16U4CV-0002pS-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2002 11:07:19 +0000
Message-ID: <3C513E7B.6010808@smartbridges.com>
Date: Fri, 25 Jan 2002 19:16:11 +0800
From: Nikhil Goel <nikhil@smartbridges.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: Ramya Ravichandran <rrhsin@yahoo.co.in>, linux-mtd@lists.infradead.org
Subject: Re: Cf Card vs DiskOnChip
References: <20020125103941.26958.qmail@web8101.in.yahoo.com> <4181.1011956000@redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David Woodhouse wrote:

> rrhsin@yahoo.co.in said:
> 
>>industrial environment. I am unable to decide whether to use a Compact
>>Flash card or DiskOnChip.With 128MB I need to get the whole thing
>>running. Can someone plese tell me as which one to use and why? 
> 
> The downside of the DiskOnChip is that the Linux driver doesn't do wear 
> levelling, although it's easy enough to add, and that the vendor's driver 
> is a binary-only module and hence of dubious legality.
> 
> I would go for the DiskOnChip and add wear levelling support - all you need 
> to do it make it randomly pick a clean block for erasure occasionally, to 
> make sure stuff moves around over time.


Isn't that similar to the implementation of JFFS? So a DiskOnChip 
running on the CVS based driver with JFFS should suffice for 
wear-levelling! if I am missing some piece here, what should I rtfm?

regards,
nikhil



-- 

-- 
Nikhil Goel <nikhil@smartbridges.com>
Ph: +65 3240210  Ext 20, Fax: +65 3240607
Reality is a crutch for those who can't handle science fiction.
