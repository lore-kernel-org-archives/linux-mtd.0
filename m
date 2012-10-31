Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TTb1O-0006WY-LQ
 for linux-mtd@lists.infradead.org; Wed, 31 Oct 2012 16:20:03 +0000
Received: by mail-pb0-f49.google.com with SMTP id xa7so1019397pbc.36
 for <linux-mtd@lists.infradead.org>; Wed, 31 Oct 2012 09:20:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1349855329.6072.72.camel@shinybook.infradead.org>
References: <1349850366-4731-1-git-send-email-computersforpeace@gmail.com>
 <1349850682.6072.70.camel@shinybook.infradead.org>
 <CAN8TOE-ZLyCanBx8pqsbzY6jMQq+ysiVvdLmWvO8QdnyZg1QRg@mail.gmail.com>
 <1349855329.6072.72.camel@shinybook.infradead.org>
Date: Wed, 31 Oct 2012 09:20:01 -0700
Message-ID: <CAN8TOE8yzJY67b=S=KyONe2pLYGJVe9vW4KXzsjvU7AU9aFpHg@mail.gmail.com>
Subject: Re: [PATCH for 3.7] mtd: nand: fix Samsung SLC NAND identification
 regression
From: Brian Norris <computersforpeace@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Marek Vasut <marex@denx.de>, Robin van der Gracht <robin@protonic.nl>,
 linux-mtd@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

On Wed, Oct 10, 2012 at 12:48 AM, David Woodhouse <dwmw2@infradead.org> wrote:
> On Tue, 2012-10-09 at 23:39 -0700, Brian Norris wrote:
>> I can see if that's possible, but I think it's unlikely. They don't
>> even bother following standards (ONFI). Is this an obstacle to
>> merging?
>
> No. I already pushed it.

This is a "bump" for a 3.7-rc pull request. This regression has been
noticed by others.

Thanks,
Brian
