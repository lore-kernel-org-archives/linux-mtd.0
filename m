Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JlIo1-0001GN-DK
	for linux-mtd@lists.infradead.org; Mon, 14 Apr 2008 07:08:45 +0000
Message-ID: <480301E5.1040607@nokia.com>
Date: Mon, 14 Apr 2008 10:04:05 +0300
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

No it is not what I meant.  I have sent another patch which I hope is
clearer.

> Anyway could you show the controller error value?

The controller error value is still printed.

> Since it needs to
> distinguish others e.g., initial bad blocks condition.

The bbt scan has its own wait function - I guess it is
possible to get a controller error while reading oob
from an eraseblock that is not actually a bad block.
I am not sure how it would be possible to tell the
difference.
