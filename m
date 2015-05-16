Received: from mail-vn0-x22a.google.com ([2607:f8b0:400c:c0f::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YtjYB-0006jT-5N
 for linux-mtd@lists.infradead.org; Sat, 16 May 2015 21:23:15 +0000
Received: by vnbf7 with SMTP id f7so4550311vnb.13
 for <linux-mtd@lists.infradead.org>; Sat, 16 May 2015 14:22:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150516205354.GK6055@norris-Latitude-E6410>
References: <CAD=nrE_4tsSvKQ_Rz8XJpjJhfT-z+-Tkhn-SMvvcyUaPzg1PHA@mail.gmail.com>
 <CAAbfDBfXZCrRJ2M_MDGP8Pmo97tLiduYGHa2AdKasTya60e81A@mail.gmail.com>
 <CAD=nrE9=040qfZHQi349KAikhiRAr5YrPgO52-7bm9uA9WmW=Q@mail.gmail.com>
 <20150516205354.GK6055@norris-Latitude-E6410>
Date: Sat, 16 May 2015 23:22:52 +0200
Message-ID: <CAFLxGvwrCO8BozRb3jkncWy+2w6y82zz+wtL2r_E9i3VT3N8HQ@mail.gmail.com>
Subject: Re: Tracking flash IO activity?
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "valent.turkovic@gmail.com" <valent.turkovic@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, May 16, 2015 at 10:53 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> I don't know of any similar IO stats for MTDs, sorry.

I wonder how hard it would be to integrate mtd into our current block IO stats.
It mtd is too low level we could also do it with UBI.

-- 
Thanks,
//richard
