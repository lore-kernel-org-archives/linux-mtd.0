Received: from smtp02.smtpout.orange.fr ([80.12.242.124]
 helo=smtp.smtpout.orange.fr)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UwFy6-0005Xy-0i
 for linux-mtd@lists.infradead.org; Mon, 08 Jul 2013 18:15:23 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] mtd: diskonchip: remove unused entries in Kconfig
References: <1373258360-22702-1-git-send-email-michael.opdenacker@free-electrons.com>
 <CAGXu5j+hwA7eT0p9y-ZSnYoYR5A1va9dXONTOGz0W-WT8Nr_Ew@mail.gmail.com>
Date: Mon, 08 Jul 2013 20:14:53 +0200
In-Reply-To: <CAGXu5j+hwA7eT0p9y-ZSnYoYR5A1va9dXONTOGz0W-WT8Nr_Ew@mail.gmail.com>
 (Kees Cook's message of "Mon, 8 Jul 2013 05:53:42 -0700")
Message-ID: <87hag4gbqa.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Arnd Bergmann <arnd@arndb.de>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, shijie8@gmail.com,
 artem.bityutskiy@linux.intel.com, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kees Cook <keescook@chromium.org> writes:

> On Sun, Jul 7, 2013 at 9:39 PM, Michael Opdenacker
> <michael.opdenacker@free-electrons.com> wrote:
>> This patch proposes to remove kernel configuration parameters
>> defined in drivers/mtd/devices/Kconfig, but used nowhere
>> in the makefiles and source code (except in comments).
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@free-electrons.com>
>
> This clean up looks good to me.
>
> Acked-by: Kees Cook <keescook@chromium.org>
Yes, a consequence of the beheading in the commit "mtd: doc: remove support for
DoC 2000/2001/2001+", excellent.

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

-- 
Robert
