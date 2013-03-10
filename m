Received: from mail-vb0-x229.google.com ([2607:f8b0:400c:c02::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UEaZB-0000PG-SL
 for linux-mtd@lists.infradead.org; Sun, 10 Mar 2013 07:21:10 +0000
Received: by mail-vb0-f41.google.com with SMTP id l22so1204009vbn.28
 for <linux-mtd@lists.infradead.org>; Sat, 09 Mar 2013 23:21:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1362135518-12761-1-git-send-email-richard.genoud@gmail.com>
References: <1362135518-12761-1-git-send-email-richard.genoud@gmail.com>
Date: Sat, 9 Mar 2013 23:21:04 -0800
Message-ID: <CAN8TOE8jGJsuazQy3pJ8cQ-qZHfR8fDQNrE88VF6rsp0C1oAYg@mail.gmail.com>
Subject: Re: [UBI-WWW] UBI: correct bad href in table of contents
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutski <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 1, 2013 at 2:58 AM, Richard Genoud <richard.genoud@gmail.com> wrote:
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

FWIW:

Acked-by: Brian Norris <computersforpeace@gmail.com>

> ---
>  doc/ubi.xml |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/doc/ubi.xml b/doc/ubi.xml
> index d912b8f..f55c04a 100644
> --- a/doc/ubi.xml
> +++ b/doc/ubi.xml
> @@ -32,7 +32,7 @@
>         <li><a href="ubi.html#L_scalability">Scalability issues</a>
>                 <ul><li><a href="ubi.html#L_scalability_det">Implementation details</a></li></ul>
>         </li>
> -       <li><a name="L_max_beb">Reserved blocks for bad block handling (only for NAND chips)</a></li>
> +       <li><a href="ubi.html#L_max_beb">Reserved blocks for bad block handling (only for NAND chips)</a></li>
>         <li><a href="ubi.html#L_autoresize">Volume auto-resize</a></li>
>         <li><a href="ubi.html#L_ubi_operations">UBI operations</a>
>                 <ol>
> --
> 1.7.2.5
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
