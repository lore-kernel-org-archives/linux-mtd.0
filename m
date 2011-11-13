Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RPXAk-0002hD-Pr
 for linux-mtd@lists.infradead.org; Sun, 13 Nov 2011 10:20:23 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH v2 04/16] mtd/docg3: fix BCH registers
References: <1320912342-30147-1-git-send-email-robert.jarzmik@free.fr>
 <1320912342-30147-5-git-send-email-robert.jarzmik@free.fr>
 <4EBECBA2.1030606@newsguy.com>
Date: Sun, 13 Nov 2011 11:20:14 +0100
In-Reply-To: <4EBECBA2.1030606@newsguy.com> (Mike Dunn's message of "Sat, 12
 Nov 2011 11:40:18 -0800")
Message-ID: <87r51ciash.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike Dunn <mikedunn@newsguy.com> writes:

> On 11/10/2011 12:05 AM, Robert Jarzmik wrote:
>> -#define DOC_BCH_SYNDROM(idx)		(0x1048 + (idx << 1))
>> +#define DOC_BCH_SYNDROM(idx)		(0x1048 + (idx << 0))
>
>
> Minor nit:  why the 0, and not just (0x1048 + idx) ?
I'll fix that, old idea I had that address bus did not stand odd adresses, and I
couldn't convince myself the "<< 0" was right, so left it to have back quicky
"<< 1". But I was wrong :)

Cheers.

-- 
Robert
