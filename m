Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ROCOQ-0007GC-9h
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2011 17:56:59 +0000
Received: by wwe3 with SMTP id 3so1841914wwe.18
 for <linux-mtd@lists.infradead.org>; Wed, 09 Nov 2011 09:56:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <13637861.2364501320769350533.JavaMail.defaultUser@defaultHost>
References: <13637861.2364501320769350533.JavaMail.defaultUser@defaultHost>
Date: Wed, 9 Nov 2011 09:56:56 -0800
Message-ID: <CAN8TOE8m9U_CidZ2nG7B7q7jCgqHfi1Npud8ZqMg6bxE474QTA@mail.gmail.com>
Subject: Re: Is the NAND of mini2440 supported?
From: Brian Norris <computersforpeace@gmail.com>
To: "marco_cantu_ranzani@libero.it" <marco_cantu_ranzani@libero.it>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 8, 2011 at 8:22 AM, marco_cantu_ranzani@libero.it
<marco_cantu_ranzani@libero.it> wrote:
> Has anyone tried the Mini 2440 dev. board NAND flash with UBIFS?

Not me...but I can try and help with specific NAND questions.

> For me it doesn't work.

For questions on a specific NAND, it helps to have the part
number/manufacturer. Also, a full log (or at least more context) would
help in determining driver problems.

I see Artem's recommendation (and recommended on the FAQ he linked to):
"It looks like you have some issues in your MTD driver, please run the
mtd tests to verify your flash"

Are you able to try the mtd tests? Please note that some of them are
destructive, so if you rely on the NAND flash for system operation,
then you shouldn't use the destructive ones.

Brian
