Received: from wr-out-0506.google.com ([64.233.184.231])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J2Q94-0004GI-Jm
	for linux-mtd@lists.infradead.org; Wed, 12 Dec 2007 11:53:04 +0000
Received: by wr-out-0506.google.com with SMTP id c8so159036wra.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Dec 2007 03:52:57 -0800 (PST)
Message-ID: <9c9fda240712120352g43c61000v42ef64d74ccbcd91@mail.gmail.com>
Date: Wed, 12 Dec 2007 20:52:57 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: "Adrian Hunter" <ext-adrian.hunter@nokia.com>
Subject: Re: [PATCH] [MTD][OneNAND] Check the initial bad block using
	ONENAND_CTRL_ERROR
In-Reply-To: <475FBE80.1060202@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20071212083309.GA32235@party> <475FBE80.1060202@nokia.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> You have:
>
>         if (ctrl & ONENAND_CTRL_ERROR) {
>                 printk(KERN_DEBUG "onenand_bbt_wait: controller error = 0x%04x\n", ctrl);
>                 /* Initial bad block case: 0x2400 or 0x0400 */
>                 if (ctrl & ONENAND_CTRL_ERROR)
>                         return ONENAND_BBT_READ_ERROR;
>                 return ONENAND_BBT_READ_FATAL_ERROR;
>         }
>
> which is the same as:
>
>         if (ctrl & ONENAND_CTRL_ERROR) {
>                 printk(KERN_DEBUG "onenand_bbt_wait: controller error = 0x%04x\n", ctrl);
>                 return ONENAND_BBT_READ_ERROR;
>         }
>
> Is that what you intended?
>

Aha, You're right.
The original goal is to find a initial bad block and other unknown errors.
First it checks the controller error and try to find a initial bad
block with load error.
But some chips are not set the load error. it only sets the error bit (10).

Strictly to find a initial bad block, it checks the non 0xff pattern
from oob area.
But now it checks the controller error as initial bad block.
I'm not sure it have to check the non 0xff pattern after controller error.
I think it's enough to check controller error at least onenand_bbt_wait. :)

I will change it as you suggested.

Thank you,
Kyungmin Park
