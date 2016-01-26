Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOA1k-0007IV-Bl
 for linux-mtd@lists.infradead.org; Tue, 26 Jan 2016 20:15:49 +0000
Received: by mail-vk0-x230.google.com with SMTP id e64so99619967vkg.0
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jan 2016 12:15:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160126195941.GA118766@google.com>
References: <CA+EcR23FKstPBux-5_R8DDd9E9=XVPU76nU70uJQvSB=EUObKg@mail.gmail.com>
 <1453790537-20566-1-git-send-email-boris.brezillon@free-electrons.com>
 <20160126195941.GA118766@google.com>
Date: Tue, 26 Jan 2016 14:15:27 -0600
Message-ID: <CA+EcR20nAXdRG6SyhNR7yqtuNFfLH665tmdKQVzV6qV875AVDg@mail.gmail.com>
Subject: Re: [PATCH] remove deprecated oobinfo retrieval
From: Han Xu <xhnjupt@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Huang Shijie <shijie.huang@arm.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

No, it's a user-space tool named kobs-ng.

On Tue, Jan 26, 2016 at 1:59 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Tue, Jan 26, 2016 at 07:42:16AM +0100, Boris Brezillon wrote:
>> From: Boris BREZILLON <boris.brezillon@free-electrons.com>
>>
>> This remove OOB info retrieval, which is not used anywhere else in the code
>> and can generate errors when called on newer NAND that have more than 32
>> bytes of ECC or 16 bytes available for user usage in the OOB area.
>>
>> Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
>> ---
>>  src/mtd.c | 8 --------
>>  src/mtd.h | 1 -
>>  2 files changed, 9 deletions(-)
>
> What source are you trying to patch? Doesn't look like Linux or
> mtd-utils.
