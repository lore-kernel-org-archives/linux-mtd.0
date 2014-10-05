Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XaoVy-0008Fs-3b
 for linux-mtd@lists.infradead.org; Sun, 05 Oct 2014 16:18:30 +0000
Received: by mail-pd0-f180.google.com with SMTP id fp1so2071270pdb.11
 for <linux-mtd@lists.infradead.org>; Sun, 05 Oct 2014 09:18:08 -0700 (PDT)
In-Reply-To: <54316B19.4060507@nod.at>
References: <e8d296e4-0194-4e0f-8f4d-1defe17bdd65@email.android.com>
 <CAFLxGvxm7RU-_5r658pA2C5EJ6NGGX2sfErNB9Hosq98QP8G2A@mail.gmail.com>
 <db3c3c22-b896-4b73-bece-99a1db7d602a@email.android.com>
 <54316971.90502@nod.at>
 <b2771230-18b6-4029-9d1e-e9dc59f7b445@email.android.com>
 <54316B19.4060507@nod.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8
Subject: Re: Block numbers of BEB
From: Woody Wu <narkewoody@gmail.com>
Date: Sun, 05 Oct 2014 23:17:20 +0700
To: Richard Weinberger <richard@nod.at>
Message-ID: <c6533374-3747-4f92-a7e6-65c2fc1dc55f@email.android.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On October 5, 2014 11:00:25 PM GMT+07:00, Richard Weinberger <richard@nod.at> wrote:
>Am 05.10.2014 17:58, schrieb Woody Wu:
>> I am afraid, some initial bad blocks actually came with the Flash
>manufacturer and recorded in some starting blocks of the Flash, is that
>right?
>
>You mean the BBT, yes.
>But what has this to do with exposing this map to userspace?

If I.know the location of the BBT, maybe I can read it out using a user space tool, right?

>
>Thanks,
>//richard

-- 
sent from mobile
