Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1blGoj-00014b-FR
 for linux-mtd@lists.infradead.org; Sat, 17 Sep 2016 14:42:10 +0000
Received: by mail-oi0-x242.google.com with SMTP id i193so107891oib.3
 for <linux-mtd@lists.infradead.org>; Sat, 17 Sep 2016 07:41:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1470319275-9465-1-git-send-email-Sandeep_Jain@mentor.com>
References: <Sandeep_Jain@mentor.com>
 <1470319275-9465-1-git-send-email-Sandeep_Jain@mentor.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 17 Sep 2016 16:41:47 +0200
Message-ID: <CAFLxGvx6B02c+HgYwJ8exVLT6owrkQL1Rq+X6VzUDKVUxE=aoQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: Allocate bdi objects dynamically
To: Sandeep Jain <Sandeep_Jain@mentor.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Steve Longerbeam <steve_longerbeam@mentor.com>,
 Jim Baxter <jim_baxter@mentor.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 4, 2016 at 4:01 PM, Sandeep Jain <Sandeep_Jain@mentor.com> wrote:
> From: Steve Longerbeam <steve_longerbeam@mentor.com>
>
> The MTD backing dev info objects mtd_bdi was statically allocated.
> So when MTD is built as a loadable module, this object fall in the
> vmalloc address space.
>
> The problem with that, is that the BDI APIs use wake_up_bit(), which calls
> virt_to_page() to retrieve the memory zone of the page containing the
> wait_queue to wake up, and virt_to_page() is not valid for vmalloc or
> highmem addresses.
>
> Fix this by allocating the BDI objects dynamically with kmalloc. The
> objects now fall in the logical address space so that BDI APIs will
> work in all cases (mtd builtin or module).
>
> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
> Signed-off-by: Jim Baxter <jim_baxter@mentor.com>
> Signed-off-by: Sandeep Jain <Sandeep_Jain@mentor.com>

Reviewed-by: Richard Weinberger <richard@nod.at>

-- 
Thanks,
//richard
