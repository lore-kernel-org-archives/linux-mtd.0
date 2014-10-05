Received: from mail-pd0-x230.google.com ([2607:f8b0:400e:c02::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xao44-0006OD-0U
 for linux-mtd@lists.infradead.org; Sun, 05 Oct 2014 15:49:40 +0000
Received: by mail-pd0-f176.google.com with SMTP id fp1so2035843pdb.21
 for <linux-mtd@lists.infradead.org>; Sun, 05 Oct 2014 08:49:18 -0700 (PDT)
In-Reply-To: <CAFLxGvxm7RU-_5r658pA2C5EJ6NGGX2sfErNB9Hosq98QP8G2A@mail.gmail.com>
References: <e8d296e4-0194-4e0f-8f4d-1defe17bdd65@email.android.com>
 <CAFLxGvxm7RU-_5r658pA2C5EJ6NGGX2sfErNB9Hosq98QP8G2A@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8
Subject: Re: Block numbers of BEB
From: Woody Wu <narkewoody@gmail.com>
Date: Sun, 05 Oct 2014 22:49:08 +0700
To: Richard Weinberger <richard.weinberger@gmail.com>
Message-ID: <db3c3c22-b896-4b73-bece-99a1db7d602a@email.android.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

What I said of checking /proc is wrong. What I indeed checked was /sys/class/ubi as you mentioned. The problem is, under the /sys/class/ubi, there is no information about what blocks are marked as bad, there is only information about the total number of bad blocks.


On October 5, 2014 10:41:50 PM GMT+07:00, Richard Weinberger <richard.weinberger@gmail.com> wrote:
>On Sun, Oct 5, 2014 at 8:04 AM, Woody Wu <narkewoody@gmail.com> wrote:
>> Hi,
>>
>> I can see how many bad erase blocks it had developed from the /proc
>directory, but where can I get know what block numbers these bad blocks
>on?
>>
>> Any hint from you will be appreciated.
>
>In case you're using UBI please see /sys/class/ubi/ubi0/

-- 
sent from mobile
