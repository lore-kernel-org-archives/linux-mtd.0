Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V57wu-0005zY-H9
 for linux-mtd@lists.infradead.org; Fri, 02 Aug 2013 05:30:49 +0000
Message-ID: <51FB43F3.7020909@ti.com>
Date: Fri, 2 Aug 2013 11:00:27 +0530
From: Sekhar Nori <nsekhar@ti.com>
MIME-Version: 1.0
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: JFFS2 impact when don't have sub page access
References: <51F91E08.7030409@efacec.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9F0091@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9F0091@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: Fernando Gomes <fernando.gomes@efacec.com>,
 "davinci-linux-open-source@linux.davincidsp.com"
 <Davinci-linux-open-source@linux.davincidsp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?ISO-8859-1?Q?An=EDbal_Almeida_Pinto?= <anibal.pinto@efacec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 02 August 2013 10:27 AM, Gupta, Pekon wrote:
> Hello,
> 
>> Hi,
>>
>> I' am using an OMAP L138 with a NAND SLC (MT29F4G08)
>>
>> I was making some tests with Ubifs but found some errors due to OMAP
>> don't support sub pages access:
>>
> TI OMAP2-NAND supports sub-pages for SLC NAND.
>  http://lists.infradead.org/pipermail/linux-mtd/attachments/20130405/a146567f/attachment.obj
> 
> This patch was accepted in mainline linux-3.10,
> And tested on AM335x with 2K/64 NAND.
> 
> You can follow this patch details here..
> http://lists.infradead.org/pipermail/linux-mtd/2013-March/046285.html

Yes, but Aníbal is talking about OMAP-L138 which is actually a DaVinci
part and uses drivers/mtd/nand/davinci_nand.c

May be you can clarify whether absence of subpage support will lead to
the kind of errors Aníbal reported?

Also, the subject talks about JFFS2. There is no known affect of absence
of subpage support on JFFS2, right?

Thanks,
Sekhar
