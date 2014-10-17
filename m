Received: from mail-wi0-x22b.google.com ([2a00:1450:400c:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xf5AW-0000JO-TI
 for linux-mtd@lists.infradead.org; Fri, 17 Oct 2014 10:54:01 +0000
Received: by mail-wi0-f171.google.com with SMTP id em10so1704575wid.16
 for <linux-mtd@lists.infradead.org>; Fri, 17 Oct 2014 03:53:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <543F678E.1030401@ahsoftware.de>
References: <1401142372-14148-1-git-send-email-holler@ahsoftware.de>
 <543F678E.1030401@ahsoftware.de>
Date: Fri, 17 Oct 2014 12:53:37 +0200
Message-ID: <CAH6sp9O=36FTGg4FTCywsNzdJi4PjUmiiT6_EHr=i166+NA2ng@mail.gmail.com>
Subject: Re: [PATCH 00/27] Fix common bug in most nand drivers not showing a
 device in sysfs
From: Frans Klaver <fransklaver@gmail.com>
To: Alexander Holler <holler@ahsoftware.de>
Content-Type: text/plain; charset=UTF-8
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 16, 2014 at 8:37 AM, Alexander Holler <holler@ahsoftware.de> wrote:
>
> I wonder if anyone else will fix this in a maintainer-approved style which
> doesn't use these evil leftovers from C666 called functions.

I'll pick this up then.

Still interested in following progress?

Frans
