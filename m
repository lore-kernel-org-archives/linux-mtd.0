Received: from mail-vc0-f172.google.com ([209.85.220.172])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFowC-0006IZ-T6
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2013 16:54:02 +0000
Received: by mail-vc0-f172.google.com with SMTP id l6so680095vcl.3
 for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2013 09:53:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1363193491-1843-1-git-send-email-computersforpeace@gmail.com>
References: <1363193491-1843-1-git-send-email-computersforpeace@gmail.com>
Date: Wed, 13 Mar 2013 09:53:59 -0700
Message-ID: <CAN8TOE-QWFWqxxxqqq+1Cezot5mH8vx9koe6tsex7sj+iwYfFw@mail.gmail.com>
Subject: Re: [RFC "v2"] mtd: nand: reintroduce NAND_NO_READRDY as
 NAND_NEED_READRDY
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Alexander Shiyan <shc_work@mail.ru>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 13, 2013 at 9:51 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> This is an attempt at a version 2 of Alexander's RFC patch. I feel like the
> original (per NAND chip type) option makes more sense than per driver (where
> Alexander sets this option only for the diskonchip driver). But it is certainly
> more invasive. And apparently, no one else needs this option (or at least, no
> one complains). Perhaps everyone has just moved beyond small-page NAND?

I'm sorry, I meant to send this is a reply to Alexander's patch. See
his RFC and RFC RESEND:

http://lists.infradead.org/pipermail/linux-mtd/2013-March/046024.html
http://lists.infradead.org/pipermail/linux-mtd/2013-March/046159.html

Brian
