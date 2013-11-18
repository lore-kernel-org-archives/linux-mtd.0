Received: from mail-wg0-x236.google.com ([2a00:1450:400c:c00::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ViEVL-000160-Mm
 for linux-mtd@lists.infradead.org; Mon, 18 Nov 2013 02:24:00 +0000
Received: by mail-wg0-f54.google.com with SMTP id y10so5600023wgg.33
 for <linux-mtd@lists.infradead.org>; Sun, 17 Nov 2013 18:23:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1384740932.5814.4.camel@joe-AO722>
References: <20131118020746.GX16018@ringworld.MIT.EDU>
 <1384740932.5814.4.camel@joe-AO722>
Date: Mon, 18 Nov 2013 00:23:33 -0200
Message-ID: <CAK4VdL0cnqCS6w8ad8ohidwVzjRc4ytokvA7a8jSo0HhDPef8Q@mail.gmail.com>
Subject: Re: [PATCH] Clarify error on directive in macro arguments (Re:
 [PATCH] jffs2: fix sparse errors: directive in argument list)
From: Erico Nunes <nunes.erico@gmail.com>
To: Joe Perches <joe@perches.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Christopher Li <sparse@chrisli.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Greg Price <price@mit.edu>,
 linux-sparse@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>,
 Al Viro <viro@zeniv.linux.org.uk>, dwmw2 <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 18, 2013 at 12:15 AM, Joe Perches <joe@perches.com> wrote:
> On Sun, 2013-11-17 at 21:07 -0500, Greg Price wrote:
>
> Maybe, but this case isn't a macro.  It's a function.
> Dunno if differentiating when it's a macro or a
> function is difficult though.
>
>

The case which was initially reported by sparse at
http://www.spinics.net/lists/kernel/msg1636974.html was using pr_info
(which is a macro) and not printk.
