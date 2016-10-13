Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bucQM-0005ER-J6
 for linux-mtd@lists.infradead.org; Thu, 13 Oct 2016 09:35:40 +0000
Received: by mail-vk0-x22c.google.com with SMTP id b186so71483132vkb.1
 for <linux-mtd@lists.infradead.org>; Thu, 13 Oct 2016 02:35:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1610131059180.15993@blala.de>
References: <1476020727-17299-1-git-send-email-akurz@blala.de>
 <CAAtXAHdVxz-uV7EYWnUsBx9JpATBF8Wjf4Sg=-81xR4c3Xu81w@mail.gmail.com>
 <alpine.DEB.2.00.1610131059180.15993@blala.de>
From: Moritz Fischer <moritz.fischer@ettus.com>
Date: Thu, 13 Oct 2016 11:35:16 +0200
Message-ID: <CAAtXAHc4MOH_7vRzq6_7hoLkeZmd=U3WHdCqe+kGiY=F2fLSQg@mail.gmail.com>
Subject: Re: [PATCH] drivers mtd: spi-nor: add new variants
To: Alexander Kurz <akurz@blala.de>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Michal Suchanek <hramrach@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Alexander,

On Thu, Oct 13, 2016 at 11:00 AM, Alexander Kurz <akurz@blala.de> wrote:
> From 27d3d578dacd2b9cb80338517f73decb169e46ec Mon Sep 17 00:00:00 2001
> From: Alexander Kurz <akurz@blala.de>
> Date: Fri, 7 Oct 2016 17:06:10 +0200
> Subject: [PATCH] drivers mtd: spi-nor: add new variants

if you change the patch you should prefix it with PATCH vX (e.g. 2 in
this case),
since it's your second revision.

If you use git-format to generate your patch you can just append a -v2
to your command
to automatically do this.

This allows for easier tracking which revision of the patch the people
reviewing your
patch are looking at.

Also it's (for more complicated patches mostly) nice to wait a bit
between sending revisions,
to give people time to comment on it.

Thanks,

Moritz
