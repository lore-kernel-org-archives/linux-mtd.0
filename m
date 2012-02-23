Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S0eRl-0005r4-PP
 for linux-mtd@lists.infradead.org; Thu, 23 Feb 2012 19:35:22 +0000
Received: by yenm4 with SMTP id m4so870675yen.36
 for <linux-mtd@lists.infradead.org>; Thu, 23 Feb 2012 11:35:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4F45FE0C.3070807@softel.net.mx>
References: <4F4285AF.30300@softel.net.mx>
 <CAN8TOE_dF1ri7cxMVBzZ9Mwqv-XCyo+mZJi1Nwhb7-OkBErU_A@mail.gmail.com>
 <4F45FE0C.3070807@softel.net.mx>
Date: Thu, 23 Feb 2012 11:35:19 -0800
Message-ID: <CAN8TOE_uX0zY7vikXNUgBjU6Lyp5tVyOEpcDydsFeOt8uAzT-A@mail.gmail.com>
Subject: Re: df -h, du -ahx and flash size not match
From: Brian Norris <computersforpeace@gmail.com>
To: Esteban Lopez <elopez@softel.net.mx>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 23, 2012 at 12:51 AM, Esteban Lopez <elopez@softel.net.mx> wrot=
e:
> Hello Brian
>
> After re read the link and make some test I found that -c option in my
> mkfs.ubi command was the reason because I had 236M in total space. I
> modified this parameter from 2048 to 3570 and now I have a =A0volume of 4=
00
> MiB
>
> Now is clear for me how interpreted the df and du output.
>
> Thank you for your help!!!!

You're welcome for the small pointer :)

BTW, when you are corresponding with people on mailing lists, it's
good practice to Reply-All. That way, you CC the mailing list and
others can see if/how you fixed your problems.

Brian
