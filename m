Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3Nvd-0001Mb-Pl
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 09:05:46 +0000
Received: by lagu2 with SMTP id u2so3001292lag.36
 for <linux-mtd@lists.infradead.org>; Mon, 20 Aug 2012 02:05:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345214124-5478-8-git-send-email-richard.genoud@gmail.com>
References: <1345214124-5478-1-git-send-email-richard.genoud@gmail.com>
 <1345214124-5478-8-git-send-email-richard.genoud@gmail.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 20 Aug 2012 11:05:05 +0200
Message-ID: <CACQ1gAjm4xUdVYP3jgFnHnDWmaDFC6fGFu7YqnuF9wbRYTMZ2g@mail.gmail.com>
Subject: Re: [PATCH 7/8] UBI: add ioctl for max_beb_per1024
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/8/17 Richard Genoud <richard.genoud@gmail.com>:
> + * The accepted range is 0-255. If 0 is given, the default kernel config value
> + * CONFIG_MTD_UBI_BEB_LIMIT will be used for compatibility.
>   */
>  struct ubi_attach_req {
>         __s32 ubi_num;
>         __s32 mtd_num;
>         __s32 vid_hdr_offset;
> -       __s8 padding[12];
> +       __u8 max_beb_per1024;
> +       __s8 padding[11];
>  };
>
So if I use __u16 instead of __u8, what should be the upper limit ?
1024 ? (1024 is nonsense, but why not...)

Regards,
Richard


-- 
for me, ck means con kolivas and not calvin klein... does it mean I'm a geek ?
