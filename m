Received: from mail-ig0-x235.google.com ([2607:f8b0:4001:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0vlt-0007Qo-Pd
 for linux-mtd@lists.infradead.org; Tue, 16 Dec 2014 17:18:54 +0000
Received: by mail-ig0-f181.google.com with SMTP id l13so7916292iga.14
 for <linux-mtd@lists.infradead.org>; Tue, 16 Dec 2014 09:18:31 -0800 (PST)
Message-ID: <54906964.9020309@gmail.com>
Date: Tue, 16 Dec 2014 12:18:28 -0500
From: nick <xerofoify@gmail.com>
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Cannot find jffs2_commit_write
References: <548F086B.3090607@gmail.com>
 <CAMuHMdU1DQBcq5AiVYaT8m3b7x_HFa6SMy-KOw5m7W=S8LPrJw@mail.gmail.com>
In-Reply-To: <CAMuHMdU1DQBcq5AiVYaT8m3b7x_HFa6SMy-KOw5m7W=S8LPrJw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Geert,
I am wondering then why do we still have this message in the TODO file for jffs2,
- disable compression in commit_write()?. If anyone can explain why this is still
needed I will gladly look into it, otherwise I am sending a patch to remove this
TODO for jffs2.
Regards Nick
P.S. I do am linus's tree cloned, I am using lxr only for searching the recent tree.


On 2014-12-16 05:57 AM, Geert Uytterhoeven wrote:
> Hi Nick,
> 
> On Mon, Dec 15, 2014 at 5:12 PM, nick <xerofoify@gmail.com> wrote:
>> I seem to not be able to locate jffs2_commit_write by searching with lxr. If someone can tell me what file the function is located in that would be greatly appreciated.
> 
> That's because it does not exist. Presumably someone forgot to update
> an error message when it was renamed (before it entered mainline in ... 2002!
> 
> BTW, please clone Linus' git tree instead of lurking in lxr for real development
> (I assume that's what you want to do? ;-)
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
