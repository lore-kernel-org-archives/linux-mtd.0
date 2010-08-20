Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OmVcI-0007LS-U6
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2010 17:42:59 +0000
Message-ID: <4C6EBE90.2090604@broadcom.com>
Date: Fri, 20 Aug 2010 10:42:40 -0700
From: "Brian Norris" <norris@broadcom.com>
MIME-Version: 1.0
To: "Tilman Sauerbeck" <tilman@code-monkey.de>
Subject: Re: Bad assumption about ID field definition for Samsung NAND?
References: <20100818180538.GA12238@code-monkey.de>
	<4C6C6BFC.9020408@broadcom.com> <20100819171558.GA8536@code-monkey.de>
	<AANLkTikiTX6US09pVu+uYm_U5=70WVbF+eH9wBtDeWKM@mail.gmail.com>
	<4C6DAFFD.4040602@broadcom.com>
	<AANLkTi=9RmDvzx-5n0UbnMUj2zMm41b1VA=PQqXK_Wgc@mail.gmail.com>
	<20100820134316.GA437@code-monkey.de>
In-Reply-To: <20100820134316.GA437@code-monkey.de>
Content-Type: text/plain;
 charset=iso-8859-1;
 format=flowed
Content-Transfer-Encoding: 7bit
Cc: r64343@freescale.com, Kevin Cernekee <cernekee@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/20/2010 06:43 AM, Tilman Sauerbeck wrote:

> Okay, how do we proceed? Should I send a proper patch with the diff
> above? Or does anyone want to try and come up with a better fix...?

I vote for Tilman's patch. There's nothing unnecessarily ugly about it; 
it simply checks cell-type in order to decide whether we use Samsung's 
new "standard" for MLC or fall-back to the real standard. If anything, 
the existing code (checking ID length) is ugly. However, both checks 
seem necessary.

Brian
