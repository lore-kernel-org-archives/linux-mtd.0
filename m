Received: from mail-qg0-f46.google.com ([209.85.192.46])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zn6yP-0001Df-5G
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2015 15:31:13 +0000
Received: by qgt47 with SMTP id 47so102480524qgt.2
 for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2015 08:30:52 -0700 (PDT)
Date: Fri, 16 Oct 2015 12:26:54 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 1/2] mtd: pxa3xx_nand: don't duplicate MTD suspend/resume
Message-ID: <20151016152654.GB14509@laptop.cereza>
References: <1444681992-4208-1-git-send-email-computersforpeace@gmail.com>
 <CAAEAJfCzVxCEA3opQU2B-wS0U+L-yK3R724W68f=95r+uMPAxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAEAJfCzVxCEA3opQU2B-wS0U+L-yK3R724W68f=95r+uMPAxg@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15 Oct 03:33 PM, Ezequiel Garcia wrote:
> Robert:
> 
> Can you test this on a platform with PM support, and make sure
> the NAND works fine after a resume?
> 
> On 12 October 2015 at 17:33, Brian Norris <computersforpeace@gmail.com> wrote:
> > mtd_{suspend,resume}() get called from mtdcore in a class suspend/resume
> > callback. We don't need to call them again here. In practice, this would
> > actually work OK, as nand_base actually handles nesting OK -- it just
> > might print warnings.
> >
> > Untested, but there are few (no?) users of PM for this driver AFAIK.
> >

Brian,

We discussed this on IRC, but I completely forgot about it :/

Without this patch nand_{suspend, resume} is called twice
(which seems harmless), tested on Armada XP-GP using nandtest.

Tested-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
