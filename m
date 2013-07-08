Received: from mail-ie0-x236.google.com ([2607:f8b0:4001:c03::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UwAxA-0007Yr-Iw
 for linux-mtd@lists.infradead.org; Mon, 08 Jul 2013 12:54:05 +0000
Received: by mail-ie0-f182.google.com with SMTP id s9so9867410iec.41
 for <linux-mtd@lists.infradead.org>; Mon, 08 Jul 2013 05:53:42 -0700 (PDT)
MIME-Version: 1.0
Sender: keescook@google.com
In-Reply-To: <1373258360-22702-1-git-send-email-michael.opdenacker@free-electrons.com>
References: <1373258360-22702-1-git-send-email-michael.opdenacker@free-electrons.com>
Date: Mon, 8 Jul 2013 05:53:42 -0700
Message-ID: <CAGXu5j+hwA7eT0p9y-ZSnYoYR5A1va9dXONTOGz0W-WT8Nr_Ew@mail.gmail.com>
Subject: Re: [PATCH] mtd: diskonchip: remove unused entries in Kconfig
From: Kees Cook <keescook@chromium.org>
To: Michael Opdenacker <michael.opdenacker@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Arnd Bergmann <arnd@arndb.de>, artem.bityutskiy@linux.intel.com,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, shijie8@gmail.com,
 Robert Jarzmik <robert.jarzmik@free.fr>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jul 7, 2013 at 9:39 PM, Michael Opdenacker
<michael.opdenacker@free-electrons.com> wrote:
> This patch proposes to remove kernel configuration parameters
> defined in drivers/mtd/devices/Kconfig, but used nowhere
> in the makefiles and source code (except in comments).
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@free-electrons.com>

This clean up looks good to me.

Acked-by: Kees Cook <keescook@chromium.org>

Thanks,

-Kees

--
Kees Cook
Chrome OS Security
