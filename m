Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JlJOk-0002Y3-TO
	for linux-mtd@lists.infradead.org; Mon, 14 Apr 2008 07:46:43 +0000
Message-ID: <48030ACC.2090302@nokia.com>
Date: Mon, 14 Apr 2008 10:42:04 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: ext Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCHJ] [MTD] [OneNAND] Allow for controller errors when reading
References: <47FF45EB.5070806@nokia.com>
	<9c9fda240804111933w2963db9bx3d78bdca46b1f1fc@mail.gmail.com>
In-Reply-To: <9c9fda240804111933w2963db9bx3d78bdca46b1f1fc@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kyungmin Park wrote:
> Hi,
> 
> On Fri, Apr 11, 2008 at 8:05 PM, Adrian Hunter
> <ext-adrian.hunter@nokia.com> wrote:
>> Controller errors while reading can be caused by
>>  corruption caused by a previous powerloss. Because
>>  upper level software like JFFS2 treat -EIO as fatal,
>>  it is necessary to treat the error as an ECC error.
>>
> 
> Umm interesting. You mean it occurs controller error before ecc error
> at power loss case.
> And it needs to define the terminology the Sudden Power Off Recovery
> or POR shortly.
> I'm not sure a previous powerloss means POR.
> 
> Anyway could you show the controller error value? 

0x2440

Since it needs to
> distinguish others e.g., initial bad blocks condition.
> 
> Thank you,
> Kyungmin Park
