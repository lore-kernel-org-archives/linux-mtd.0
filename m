Received: from mail-ve0-x230.google.com ([2607:f8b0:400c:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbtEA-0001FL-0j
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2013 14:28:03 +0000
Received: by mail-ve0-f176.google.com with SMTP id jx11so2104612veb.21
 for <linux-mtd@lists.infradead.org>; Thu, 31 Oct 2013 07:27:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201310310836.36976.marex@denx.de>
References: <1383176571-28057-1-git-send-email-computersforpeace@gmail.com>
 <201310310836.36976.marex@denx.de>
Date: Thu, 31 Oct 2013 10:27:38 -0400
Message-ID: <CAN8TOE8cK-qhBB=B8zN=kSKjb0Wz+5upy3NsnaS9m42TBpPVjg@mail.gmail.com>
Subject: Re: [PATCH] mtd: m25p80: fixup device removal failure path
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 31, 2013 at 3:36 AM, Marek Vasut <marex@denx.de> wrote:
>> Device removal shouls fail if MTD unregistration fails.
>
> should ;-)

Wow... I need to proofread myself a bit better. Thanks.

> Reviewed-by: Marek Vasut <marex@denx.de>

Fixed and pushed to l2-mtd.git.

Brian
