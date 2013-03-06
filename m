Received: from mail-ia0-x234.google.com ([2607:f8b0:4001:c02::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UD9Gi-0002KU-W4
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 08:00:09 +0000
Received: by mail-ia0-f180.google.com with SMTP id f27so7026844iae.25
 for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2013 00:00:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1362494946.2943.55.camel@sauron>
References: <1362494376-1588-1-git-send-email-dedekind1@gmail.com>
 <1362494376-1588-2-git-send-email-dedekind1@gmail.com>
 <1362494946.2943.55.camel@sauron>
Date: Wed, 6 Mar 2013 16:00:06 +0800
Message-ID: <CAMiH66HABdRAkbQvvCP-fVsUqoBsiD3Wp3KDsN_F9gqyHxoJxA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: nand: provision full ID support
From: Huang Shijie <shijie8@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 5, 2013 at 10:49 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Tue, 2013-03-05 at 16:39 +0200, Artem Bityutskiy wrote:
>> + * @dev_id: device ID part of the full chip ID array (refers the same memory
>> + *          address as @id[0])
>
> Here it should be @id[1] instead.
>
>
this patch causes a compiler error.
I tested the l2-mtd tree just now.

thanks
Huang Shijie
