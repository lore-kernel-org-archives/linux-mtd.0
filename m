Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPSkW-0005IV-KL
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 06:09:17 +0000
Received: by yhjj52 with SMTP id j52so334102yhj.36
 for <linux-mtd@lists.infradead.org>; Tue, 01 May 2012 23:09:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120502085826.23b8cf5c@halley>
References: <20120502085826.23b8cf5c@halley>
Date: Tue, 1 May 2012 23:09:10 -0700
Message-ID: <CAN8TOE9n9BTstLeU5du_jan8wrFSO9pKxHA_mN7Fptf6pXKVWg@mail.gmail.com>
Subject: Re: [PATCH] mtd-www: FAQ: spelling fixes
From: Brian Norris <computersforpeace@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 1, 2012 at 10:58 PM, Shmulik Ladkani
<shmulik.ladkani@gmail.com> wrote:
> Few typos fixed.
>
> Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
> ---
> diff --git a/faq/jffs2.xml b/faq/jffs2.xml
> index a08af7a..1b426d7 100644
> --- a/faq/jffs2.xml
> +++ b/faq/jffs2.xml
> @@ -210,7 +210,7 @@ write-buffer contained some data and was not yet sync=
ed before the unclean
> =A0reboot happened. In them first and the third cases, you just lose the =
very
> =A0last data you have written, in the second case you lose nothing. The w=
rong
> =A0nodes will eventually be recycled by Garbage Collector and the massage=
s will go

How about 'massages' -> 'messages'? :)

> -(but they may leave quite long).
> +(but they may live quite long).
> =A0</P>

Otherwise looks good; thanks for the fix. I think I have a few of
these type of fixes sitting around here somewhere...
