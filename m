Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIfqr-0005TE-WB
 for linux-mtd@lists.infradead.org; Fri, 02 Nov 2018 20:15:31 +0000
Received: by mail-wm1-x32c.google.com with SMTP id a8-v6so2865428wmf.1
 for <linux-mtd@lists.infradead.org>; Fri, 02 Nov 2018 13:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20181101225603.17806-1-nkela@cisco.com>
 <20181102000236.rqho7txtb7gv543t@zorba>
 <20181102003434.GW32577@ZenIV.linux.org.uk>
 <20181102140420.jiuhcsrahoeqe5vk@zorba>
In-Reply-To: <20181102140420.jiuhcsrahoeqe5vk@zorba>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 2 Nov 2018 21:15:06 +0100
Message-ID: <CAFLxGvy-0-A1Ta1vf=o4q0tcJAdr+uv9eQc7UrnwqF9NkJiWUw@mail.gmail.com>
Subject: Re: [PATCH] Make JFFS2 endianness configurable
To: danielwa@cisco.com
Cc: Al Viro <viro@zeniv.linux.org.uk>, nkela@cisco.com,
 xe-linux-external@cisco.com, LKML <linux-kernel@vger.kernel.org>,
 "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 Rod Whitby <rod@whitby.id.au>, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 2, 2018 at 3:04 PM Daniel Walker <danielwa@cisco.com> wrote:
> Do you have any thought on how to implement it ? I was think abstracting the
> endian functions in the nodelist.h

Yes, see what UFS does.

> static inline jint16_t cpu_to_je16(jint16_t x) {
>         if (check_big_endian()) {
>                 return cpu_to_be16(x);
>         } else if (check_little_endian()) {
>                 return cpu_to_le16(x);
>         }
> }
>
> but how would you setup the checking ?

Make it a mount option and store the endianness mode in the super block.

-- 
Thanks,
//richard
