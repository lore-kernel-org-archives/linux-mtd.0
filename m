Received: from mail-lb0-f181.google.com ([209.85.217.181])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tthkd-0000RY-74
 for linux-mtd@lists.infradead.org; Fri, 11 Jan 2013 16:46:41 +0000
Received: by mail-lb0-f181.google.com with SMTP id ge1so1438307lbb.40
 for <linux-mtd@lists.infradead.org>; Fri, 11 Jan 2013 08:46:36 -0800 (PST)
Message-ID: <50F04F8E.30001@mvista.com>
Date: Fri, 11 Jan 2013 20:44:46 +0300
From: Sergei Shtylyov <sshtylyov@mvista.com>
MIME-Version: 1.0
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] davinci_nand: fix modular build with CONFIG_OF=y
References: <201301032127.34467.sshtylyov@ru.mvista.com>
In-Reply-To: <201301032127.34467.sshtylyov@ru.mvista.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: davinci-linux-open-source@linux.davincidsp.com, hs@denx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

On 01/03/2013 09:27 PM, Sergei Shtylyov wrote:

> Commit cdeadd712f52b16a9285386d61ee26fd14eb4085 (mtd: nand: davinci: add OF
> support for davinci nand controller) has never been really build tested with
> the driver as a module.  When the driver is built-in, the missing semicolon
> after structure initializer is "compensated" by MODULE_DEVICE_TABLE() macro
> being empty and so the initializer using the trailing semicolon on the next
> line; when the driver is built as a module, compilation error ensues, and as
> the 'davinci_all_defconfig' has the NAND driver modular, this error prevents
> DaVinci family kernel from building...

> Signed-off-by: Sergei Shtylyov <sshtylyov@ru.mvista.com>
> Cc: stable@vger.kernel.org # 3.7

> ---
> The patch is atop of the recent Linus' tree.

   OK, a week has passed. Anybody going to queue this up for 3.8?

WBR, Sergei
