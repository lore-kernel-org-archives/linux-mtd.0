Received: from mail-vc0-f175.google.com ([209.85.220.175])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U92N1-0003V1-8L
 for linux-mtd@lists.infradead.org; Fri, 22 Feb 2013 23:49:40 +0000
Received: by mail-vc0-f175.google.com with SMTP id fw7so759779vcb.20
 for <linux-mtd@lists.infradead.org>; Fri, 22 Feb 2013 15:49:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87621kdma0.fsf@dell.be.48ers.dk>
References: <1361570842-6442-1-git-send-email-computersforpeace@gmail.com>
 <87621kdma0.fsf@dell.be.48ers.dk>
Date: Fri, 22 Feb 2013 15:43:51 -0800
Message-ID: <CAN8TOE_HjxO_WMYkDyFs4B9s1BEDq2o0PDACOXQboHUiKYCMAg@mail.gmail.com>
Subject: Re: [PATCH] mtd: m25p80: n25q064 is Micron, not Intel/Numonyx
From: Brian Norris <computersforpeace@gmail.com>
To: Peter Korsgaard <jacmet@sunsite.dk>
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

2013/2/22 Peter Korsgaard <jacmet@sunsite.dk>:
>>>>>> "Brian" == Brian Norris <computersforpeace@gmail.com> writes:
>
>  Brian> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>
> Acked-by: Peter Korsgaard <jacmet@sunsite.dk>

BTW, I neglected to mention: the datasheet I have actually says
Numonyx, but it has been integrated into the Micron line, and the ID
follows the Micron pattern. So it makes sense to file this under the
Micron ID section.

Brian
