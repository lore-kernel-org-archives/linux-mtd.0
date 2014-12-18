Received: from mail-vc0-x229.google.com ([2607:f8b0:400c:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1jq3-0000hV-Tq
 for linux-mtd@lists.infradead.org; Thu, 18 Dec 2014 22:46:32 +0000
Received: by mail-vc0-f169.google.com with SMTP id hy10so661081vcb.14
 for <linux-mtd@lists.infradead.org>; Thu, 18 Dec 2014 14:46:10 -0800 (PST)
MIME-Version: 1.0
Sender: grundler@google.com
In-Reply-To: <5492B9C0.2060904@vanguardiasur.com.ar>
References: <CAAK6Zt2dbK1EayqrvNWsZQxiCJ97YidHYGLs-DC8pv3Ggitz1w@mail.gmail.com>
 <5492B9C0.2060904@vanguardiasur.com.ar>
Date: Thu, 18 Dec 2014 14:46:09 -0800
Message-ID: <CANEJEGtSMvp22xg0cvr66BJn_ZOA7i-RJXxbHDq1c4FKR3XhCQ@mail.gmail.com>
Subject: Re: [PATCH] UBI: block: Continue creating ubiblocks after an
 initialization error
From: Grant Grundler <grundler@chromium.org>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset=UTF-8
Cc: Grant Grundler <grundler@chromium.org>, Richard Weinberger <richard@nod.at>,
 Gwendal Grignou <gwendal@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Daniel Ehrenberg <dehrenberg@chromium.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[resending as plain text...gmail..grrrh. :( ]

On Thu, Dec 18, 2014 at 3:25 AM, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
...
>> +                       ubi_err(
>> +                               "block: can't open volume on ubi%d_%d, err=%ld",
>> +                               p->ubi_num, p->vol_id, PTR_ERR(desc));
>
> Is it me, or this line break is unneeded here?

gmail injected this. I've helped Daniel to setup/use git-sendmail.

>
> Also, it seems something is wrong with the patch format. Patchwork shows
> some oddities:
>
> http://patchwork.ozlabs.org/patch/422408/

Oh dear...yes, it's more than just extra line break. Hopefully the
"v3" he just sent fairs better.

thanks,
grant
