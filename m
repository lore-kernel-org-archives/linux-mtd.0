Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SdkqL-00071r-GZ
 for linux-mtd@lists.infradead.org; Sun, 10 Jun 2012 16:18:22 +0000
Received: by laap9 with SMTP id p9so2530009laa.36
 for <linux-mtd@lists.infradead.org>; Sun, 10 Jun 2012 09:18:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvyqc4RxKT1_fxuP1JfqMcUkr=sWbXuF2jP2mQL9+R_Org@mail.gmail.com>
References: <CAJ2oMhJ93QORgUxfCerErreJuKg2z8weu5nKiYGDRrJabDdm9g@mail.gmail.com>
 <CAFLxGvyqc4RxKT1_fxuP1JfqMcUkr=sWbXuF2jP2mQL9+R_Org@mail.gmail.com>
Date: Sun, 10 Jun 2012 18:18:15 +0200
Message-ID: <CAJ2oMhJ4NXpwEeq9XH+_C-JVjzdRtZx071qqUvzjidEtYXH6eA@mail.gmail.com>
Subject: Re: Q: ubifs writings into flash
From: Ran Shalit <ranshalit@gmail.com>
To: richard -rw- weinberger <richard.weinberger@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jun 10, 2012 at 4:15 PM, richard -rw- weinberger
<richard.weinberger@gmail.com> wrote:
> On Sun, Jun 10, 2012 at 3:11 PM, Ran Shalit <ranshalit@gmail.com> wrote:
>> Hello,
>>
>> I have some beginner question if I'm allowed...
>> I would like to know if ubifs is writing stuff to Nand flash after the
>> application starts.
>
> What is "the application"?
>
>> for example, the /var and /tmp are written into flash ?
>> I actaully do not want any wrting to Nand flash to be done after the
>> program starts (or at least to know about all of them and control when
>> they are done).
>
> -ENOPARSE. :-)
>
> --
> Thanks,
> //richard
Hi,

I have some streaming application. I would like that after execution
of this application there will be no longer access(read or write) to
flash while the application is running, becuase accessing the flash is
not suitable for real-time application, especialy if I am not aware
when it is done during application execution.
I thought at first that using ubifs is best , but will it access the
flash whenever it will need to write some information in /tmp or oter
directory ?

Best Regards,

Ran
