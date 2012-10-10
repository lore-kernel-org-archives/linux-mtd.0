Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TLpxK-0006Hz-9Q
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 06:39:47 +0000
Received: by mail-lb0-f177.google.com with SMTP id gi11so177651lbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 09 Oct 2012 23:39:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1349850682.6072.70.camel@shinybook.infradead.org>
References: <1349850366-4731-1-git-send-email-computersforpeace@gmail.com>
 <1349850682.6072.70.camel@shinybook.infradead.org>
Date: Tue, 9 Oct 2012 23:39:43 -0700
Message-ID: <CAN8TOE-ZLyCanBx8pqsbzY6jMQq+ysiVvdLmWvO8QdnyZg1QRg@mail.gmail.com>
Subject: Re: [PATCH for 3.7] mtd: nand: fix Samsung SLC NAND identification
 regression
From: Brian Norris <computersforpeace@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 9, 2012 at 11:31 PM, David Woodhouse <dwmw2@infradead.org> wrote:
> On Tue, 2012-10-09 at 23:26 -0700, Brian Norris wrote:
>> I have heuristically determined that all the chips that use
>> the new table have ID strings which wrap around after the 6th byte.
>
> I'd be happier if we had confirmation of that from Samsung...

I can see if that's possible, but I think it's unlikely. They don't
even bother following standards (ONFI). Is this an obstacle to
merging?

Brian
