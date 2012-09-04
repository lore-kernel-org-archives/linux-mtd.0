Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8th5-00083Z-Ax
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2012 14:01:33 +0000
Received: by lagu2 with SMTP id u2so4040107lag.36
 for <linux-mtd@lists.infradead.org>; Tue, 04 Sep 2012 07:01:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1346766969-13490-1-git-send-email-richard.genoud@gmail.com>
References: <1346766969-13490-1-git-send-email-richard.genoud@gmail.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 4 Sep 2012 16:01:07 +0200
Message-ID: <CACQ1gAj1cEJwTQ3ZVw14iWSz2Qay9Qbk++78t167h3TvepyJ5A@mail.gmail.com>
Subject: Re: [MTD website] UBI: now we reserve 20/1024 PEB for bad block
 handling
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/9/4 Richard Genoud <richard.genoud@gmail.com>:
> +
> +<h2><a name="L_autoresize">Volume auto-resize</a></h2>
>
>  <p>When it is needed to create an UBI image which will be flashed to the end
>  user devices in production line, you should define exact sizes of all volumes
> -(the sizes are stored in the UBI volume table). But it is difficult to do
> -because the total flash chip size may vary depending on the amount of the
> -initially bad PEBs.</p>
> -
> -<p>One obvious way to solve the problem is to assume the worst case, when all
> -chips would have maximum amount of bad PEBs. But in practice, most of the chips
> -will have only few bad PEBs which is far less than the maximum. In general, it
> -is fine - this will increase reliability, because UBI anyway uses all PEBs of
> -the device. On the other hand UBI anyway reserves some amount of physical
> -eraseblocks for bad PEB handling which is 2% of PEBs by default. So in case of
> -the above mentioned OneNAND chip the result would be that 2% of PEBs would be
> -reserved by UBI, and 0-2% of PEBs would not be used (they would be seen as
> -available LEBs to the UBI users).</p>
> -
> -<p>But there is an alternative approach - one of the volume may have the
> -<b>auto-resize</b> mark, which means that its size has to be enlarged when UBI
> +(the sizes are stored in the UBI volume table). But usually, in the embedded
> +world, we like to have one (read only) volume for the root file system and
> +one read write volume for the rest (logs, user data, etc.). If the size of the
> +root file system is fixed, the size of the second one can vary from one product
> +to another (different flash sizes) and we just want all space left.</p>
> +
> +<p>That what the auto-resize is about. If the volume has the <b>auto-resize</b>
> +mark, its size will be enlarged when UBI
>  is run for the first time. After the volume size is adjusted, UBI removes the
>  auto-resize mark and the volume is not re-sized anymore. The auto-resize flag is
> -stored in the volume table and only one volume may be marked as auto-resize.
> -For example, if there is a volume which is intended to have the root
> -file-system, it may be reasonable to mark it with the auto-resize flag.</p>
> -
> -<p>In the example with OneNAND chip, if one of the UBI volumes is be marked
> -as auto-re-sized, it will be enlarged by 0-2% on the first UBI boot, but 2% of
> -PEBs will anyway be reserved for bad PEB handling.</p>
> +stored in the volume table and only one volume may be marked as auto-resize.</p>
>
>  <p>Note, the auto-resize feature exists in the Linux kernel starting from
>  version <code>2.6.25</code>.</p>
I change this because I think there was a misunderstanding, the
manufacturer guarantees that there won't be more than xxx bad block on
the device during its "endurance lifetime" not at shipping time.
So I gave another example, but fill free to change it !

Best regards,
Richard.
