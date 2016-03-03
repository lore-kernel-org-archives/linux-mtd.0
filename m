Received: from mail-oi0-x22c.google.com ([2607:f8b0:4003:c06::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abPS6-0001PZ-RS
 for linux-mtd@lists.infradead.org; Thu, 03 Mar 2016 09:21:47 +0000
Received: by mail-oi0-x22c.google.com with SMTP id m82so11163534oif.1
 for <linux-mtd@lists.infradead.org>; Thu, 03 Mar 2016 01:21:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <959619813.9882304.1456995893128.JavaMail.zimbra@fideltronik.com.pl>
References: <959619813.9882304.1456995893128.JavaMail.zimbra@fideltronik.com.pl>
Date: Thu, 3 Mar 2016 10:21:25 +0100
Message-ID: <CAFLxGvzHfOgN5T0yZByOqzq0=K5+PdvDMgNTxJVRrsB6WdT3rA@mail.gmail.com>
Subject: Re: Subject=Re:%20Re%3A%20UBI%20leb_write_unlock%20NULL%20pointer%20Oops%20%28continuation%29&In-Reply-To=%3C20140205201223.GA25295%40gmail.com%3E
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Tomasz Lach <tomasz.lach@fideltronik.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 3, 2016 at 10:04 AM, Tomasz Lach
<tomasz.lach@fideltronik.com> wrote:
>
> Hello everybody!
>
> I have the same error (OOPS in leb_write_unlock).

Which "same"? I also cannot parse the mail subject.

> I run kernel 3.6.9 on Atmel SAMA5D31 cpu, compiled with buildroot gcc 4.6.3
>
> I can reproduce error quite easy - writing lot of inserts into sqllite table from tcl.
>
> I've found that problem is with mutex le->mutex.wait_list.next -> it is NULL
> When I turn on mutex debugging - error disappears...
> I can't find when .next is NULL...

Can you share the kernel trace?

-- 
Thanks,
//richard
