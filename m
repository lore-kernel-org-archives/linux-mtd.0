Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UBoIB-0006Jy-B6
 for linux-mtd@lists.infradead.org; Sat, 02 Mar 2013 15:24:08 +0000
Message-ID: <1362237855.2745.24.camel@sauron>
Subject: Re: [UBIFS][CRC Mismatch]
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Colin Foe-Parker <colin.foeparker@aclimalabs.com>
Date: Sat, 02 Mar 2013 17:24:15 +0200
In-Reply-To: <CAHeJuP946AQD2FOp1f=y_AKxXbLGYhTe1TZGOAtpNVoPbE5JEA@mail.gmail.com>
References: <CAHeJuP946AQD2FOp1f=y_AKxXbLGYhTe1TZGOAtpNVoPbE5JEA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-02-19 at 10:44 -0800, Colin Foe-Parker wrote:
> 
> Thanks in advance for any/all help.  I have dug through the UBI/UBIFS
> code, but I still have a long ways to go before I really "get" most of
> it.

Probably finding ways to reproduce this quickly enough is more
important.

BTW, if you use sub-pages, you may try disable them and see if the
problem goes away.

-- 
Best Regards,
Artem Bityutskiy
