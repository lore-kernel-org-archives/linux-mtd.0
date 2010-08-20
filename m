Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OmZ8Z-0006mr-Oz
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2010 21:28:32 +0000
Message-ID: <4C6EF36F.2080306@broadcom.com>
Date: Fri, 20 Aug 2010 14:28:15 -0700
From: "Brian Norris" <norris@broadcom.com>
MIME-Version: 1.0
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH 2/2] mtd: nand: Increase NAND_MAX_OOBSIZE
References: <1282332973-12077-1-git-send-email-norris@broadcom.com>
	<1282332973-12077-2-git-send-email-norris@broadcom.com>
	<1282333385.25239.88.camel@localhost>
In-Reply-To: <1282333385.25239.88.camel@localhost>
Content-Type: text/plain;
 charset=utf-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Cc: Kevin Cernekee <cernekee@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Brian Norris <norris@broadcom.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/20/2010 12:43 PM, David Woodhouse wrote:
> On Fri, 2010-08-20 at 12:36 -0700, Brian Norris wrote:
>> An increase in NAND_MAX_OOBSIZE and NAND_MAX_PAGESIZE is necessary
>> in order to support many new chips. Among those:
>>
>> Toshiba TC58TxG4S2FBAxx  8KB page, 576B OOB
>> Micron MT29F64G08CBAAA   8KB page, 448B OOB
>
> Ick, don't we have a better fix for this in the works?
>

For the MAX macros? I have no idea. There were comments there telling me 
to do this whenever newer chips are supported.
