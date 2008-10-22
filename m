Received: from mail-gx0-f10.google.com ([209.85.217.10])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KsYMl-0007UK-Ca
	for linux-mtd@lists.infradead.org; Wed, 22 Oct 2008 07:42:52 +0000
Received: by gxk3 with SMTP id 3so7371534gxk.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Oct 2008 00:42:50 -0700 (PDT)
Message-ID: <9c9fda240810220042g186045a5rba39d6b4006906c3@mail.gmail.com>
Date: Wed, 22 Oct 2008 16:42:50 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: "Brijesh Singh" <brijesh.s.singh@gmail.com>
Subject: Re: [JFFS2] kernel BUG at fs/jffs2/gc.c:516!
In-Reply-To: <6b5362aa0810212338k80de19ci893b9fb4b7802ce4@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <6b5362aa0810212338k80de19ci893b9fb4b7802ce4@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, Oct 22, 2008 at 3:38 PM, Brijesh Singh
<brijesh.s.singh@gmail.com> wrote:
> Hi,
>     I was testing JFFS2 on 2.6.20 with fsstress for OneNand Chip. JFFS2 died
> with the a BUG in gc.c.
>
>      I have gone through all  the mailing archive possible. Kyungmin park
> had reported the problem,
>  but I could not find the fix.
>
>      Here is the mail:
> http://lists.infradead.org/pipermail/linux-mtd/2007-April/017979.html
>
>      Any idea,why this BUG occurs/occurred? Is there any fix available?

You maybe test the fsstress on it.
After that time, no more test. Could you can test the latest kernel?
In Flex-OneNAND test, it's not occurred as I know. It means it's
solved with some patch or other side effect?

Thank you,
Kyungmin Park
