Received: from mail-wr0-x233.google.com ([2a00:1450:400c:c0c::233])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1enVcg-0001zq-Sb
 for linux-mtd@lists.infradead.org; Sun, 18 Feb 2018 20:31:48 +0000
Received: by mail-wr0-x233.google.com with SMTP id l43so7716897wrc.2
 for <linux-mtd@lists.infradead.org>; Sun, 18 Feb 2018 12:31:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <180bb6ee-51db-ddff-207b-e76580dab687@exertus.fi>
References: <50443554-3f18-ce1b-70e7-a8092b39f5f5@exertus.fi>
 <2543021.LZhlqz2gkU@blindfold>
 <b5eb17b7-14f1-7ec4-a590-d486dd0b89b6@exertus.fi>
 <63275670.WCUj5TjS3v@blindfold>
 <180bb6ee-51db-ddff-207b-e76580dab687@exertus.fi>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 18 Feb 2018 21:31:33 +0100
Message-ID: <CAFLxGvx35u-5Z83m_21Q73QPf7e8ZeoMsxU-B2jdzY2-BrWamw@mail.gmail.com>
Subject: Re: UBI assert failed in ubi_wl_init
To: Timo Ketola <timo@exertus.fi>
Cc: Richard Weinberger <richard@sigma-star.at>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 13, 2018 at 3:00 PM, Timo Ketola <timo@exertus.fi> wrote:
> On 13.02.2018 14:42, Richard Weinberger wrote:
>> So, this is not what you have described in your problem report.
>> Can you please double check?
>
> Hmm, how?
>
> To get those images, I burned a fresh empty image again into the NAND.
> On the first boot there was again in the dmesg this:
>
>
>> [   18.804716] ubi1 error: ubi_update_fastmap: could not get any free erase block
>> [   18.810745] ubi1 warning: ubi_update_fastmap: Unable to write new fastmap, err=-28
>
> And then I took the first image. Then I rebooted and this time there was
> in the dmesg this:
>
>> [    4.231126] UBI assert failed in ubi_wl_init at 1666 (pid 1)
>
> and backtrace. Then I took the second image.
>
> Every boot after the first one generates the failed assertion into the
> dmesg.
>
> What should I do next?

Okay. That's a bit odd. Maybe my analysis is wrong. Can you try the
following, replay the image to your NAND and attach again.
Then you should get the same UBI assert a second time.

-- 
Thanks,
//richard
