Received: from mail-ie0-f177.google.com ([209.85.223.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TWN5S-0006Wy-8u
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2012 08:03:43 +0000
Received: by mail-ie0-f177.google.com with SMTP id e14so3699224iej.36
 for <linux-mtd@lists.infradead.org>; Thu, 08 Nov 2012 00:03:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1351701009.8774.24.camel@shinybook.infradead.org>
References: <1351679539-30651-1-git-send-email-robin@protonic.nl>
 <50914F32.7020605@gmail.com>
 <1351701009.8774.24.camel@shinybook.infradead.org>
Date: Thu, 8 Nov 2012 00:03:38 -0800
Message-ID: <CAN8TOE9usd7pwQi5hNkfnWiy+sgNojbTFU1arynV2WZi8x=05g@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: Take celltype into account when parsing
 Samsung ext. nand ID's
From: Brian Norris <computersforpeace@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 31, 2012 at 9:30 AM, David Woodhouse <dwmw2@infradead.org> wrote:
> On Wed, 2012-10-31 at 09:17 -0700, Brian Norris wrote:
>> I believe this regression has already been fixed and accepted by David
>> Woodhouse and is awaiting upstream submission - hopefully for the 3.7-rc
>> cycle. This should be its ID, in linux-mtd.git (and linux-next):
>
> Hm, did I not push that to Linus yet? I'll do so shortly. Anything else
> we need to get in to 3.7 while I'm at it?

I haven't seen any pull requests to Linus. Bump?

Regards,
Brian
