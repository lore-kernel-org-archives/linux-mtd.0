Received: from mail-oa0-x236.google.com ([2607:f8b0:4003:c02::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WAFzh-0002q7-Q6
 for linux-mtd@lists.infradead.org; Mon, 03 Feb 2014 09:39:10 +0000
Received: by mail-oa0-f54.google.com with SMTP id i4so7983020oah.27
 for <linux-mtd@lists.infradead.org>; Mon, 03 Feb 2014 01:38:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>
Date: Mon, 3 Feb 2014 10:38:48 +0100
Message-ID: <CAFLxGvya5WXoKcYmOgeM_SmVVEht1jEzeLG9vHhwFudFU+Ny8A@mail.gmail.com>
Subject: Re: UBI leb_write_unlock NULL pointer Oops (continuation)
From: Richard Weinberger <richard.weinberger@gmail.com>
To: "Wiedemer, Thorsten (Lawo AG)" <Thorsten.Wiedemer@lawo.com>
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

On Mon, Feb 3, 2014 at 9:51 AM, Wiedemer, Thorsten (Lawo AG)
<Thorsten.Wiedemer@lawo.com> wrote:
> Hi list,
>
> in July, 2013, a thread named "UBI leb_write_unlock NULL pointer Oops" was started, but not resolved.
> We have kernel 3.6.11 running on an Freescale i.MX257 (arm926) with UBIFS on a NAND Flash.
> I run into the same problem. Is there a solution for this problem ?
>
> I already added the patches:
> - 605c912bb843c024b1ed173dc427cd5c08e5d54d UBIFS: fix a horrid bug
> - 33f1a63ae84dfd9ad298cf275b8f1887043ced36 UBIFS: prepare to fix a horrid bug
> But this doesn't resolve the problem.
>
> If necessary, I will provide further information about our system, but perhaps someone can give me a hint where I can find the solution if it exists already.

Please share the full kernel log with us.

-- 
Thanks,
//richard
