Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rzcwk-0005Fy-Fz
 for linux-mtd@lists.infradead.org; Mon, 20 Feb 2012 23:47:08 +0000
Received: by ghbg20 with SMTP id g20so3023769ghb.36
 for <linux-mtd@lists.infradead.org>; Mon, 20 Feb 2012 15:47:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4F4285AF.30300@softel.net.mx>
References: <4F4285AF.30300@softel.net.mx>
Date: Mon, 20 Feb 2012 15:47:05 -0800
Message-ID: <CAN8TOE_dF1ri7cxMVBzZ9Mwqv-XCyo+mZJi1Nwhb7-OkBErU_A@mail.gmail.com>
Subject: Re: df -h, du -ahx and flash size not match
From: Brian Norris <computersforpeace@gmail.com>
To: Esteban Lopez <elopez@softel.net.mx>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 20, 2012 at 9:41 AM, Esteban Lopez <elopez@softel.net.mx> wrote=
:
> If I create big files and I run du -ahx command over / I get a =A0total o=
f
> 593M
> =A0of info
> Why the size not match ? why I can have 593M in my ROOTFS if I only have
> 469762048 bytes?? Why df -h report 161M used in rootfs if du report 593M?

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_df_report
