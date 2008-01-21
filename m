Received: from mx.dave-tech.it ([88.37.112.223])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JGuiX-0000W0-1t
	for linux-mtd@lists.infradead.org; Mon, 21 Jan 2008 11:21:35 +0000
Message-ID: <47948035.8040903@dave-tech.it>
Date: Mon, 21 Jan 2008 12:21:25 +0100
From: llandre <r&d2@dave-tech.it>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Micron NAND support in linux MTD
References: <47907CDF.30802@dave-tech.it>
	<8bf247760801180745k6f8337d5p751d91b21bd3728d@mail.gmail.com>
	<47946B2A.1030400@dave-tech.it>
	<Pine.LNX.4.64.0801211105440.25733@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.0801211105440.25733@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Ram <vshrirama@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> if JFFS2/MTD check first page only. Datasheet says:
>>
>> "The factory identifies invalid blocks before shipping by programming 
>> data other than FFh (x8) or FFFFh (x16) into the first spare location 
>> (column address 2,048 for x8 devices, or 1,024 for x16 devices) *of 
>> the first or second page of each bad block*."
> 
> The option of programming the second page is probably a last resort in 
> case the first page is so bad that it cannot be programmed at all, which 
> I would think is most unlikely.
I think your point is reasonable. I'd like to hear someone from Samsung 
or Micron to confirm your speculation ...


-- 
llandre

DAVE Electronics System House - R&D Department
web:   http://www.dave.eu
email: r&d2@dave-tech.it
