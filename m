Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eOnRf-00030W-N9
 for linux-mtd@lists.infradead.org; Tue, 12 Dec 2017 16:30:17 +0000
Received: by mail-wm0-x232.google.com with SMTP id f140so21378586wmd.2
 for <linux-mtd@lists.infradead.org>; Tue, 12 Dec 2017 08:29:54 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <e7616db0-aa5a-5270-7bab-55838ec28792@nedap.com>
References: <e7616db0-aa5a-5270-7bab-55838ec28792@nedap.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 12 Dec 2017 17:29:52 +0100
Message-ID: <CAFLxGvxwpRxecRAxtKcsFUoVZwkEOZnnNvuJGTpX0rhdKruLJQ@mail.gmail.com>
Subject: Re: bad PEBs reservation
To: Jaap de Jong <jaap.dejong@nedap.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jaap,

On Tue, Dec 12, 2017 at 2:14 PM, Jaap de Jong <jaap.dejong@nedap.com> wrote:
> Hi All,
>
> If I see this in my dmesg
>
> ubi0 warning: ubi_eba_init: cannot reserve enough PEBs for bad PEB handling,
> reserved 35, need 75
>
> Should I worry?

Yes.
Is this the same setup where you miss some PEBs?

-- 
Thanks,
//richard
