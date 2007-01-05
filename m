Received: from wx-out-0506.google.com ([66.249.82.226])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H2k4i-0006dR-66
	for linux-mtd@lists.infradead.org; Fri, 05 Jan 2007 03:05:19 -0500
Received: by wx-out-0506.google.com with SMTP id h30so7026539wxd
	for <linux-mtd@lists.infradead.org>;
	Fri, 05 Jan 2007 00:05:15 -0800 (PST)
Message-ID: <740e30f50701050005r4c39b91ax747719195cb023e8@mail.gmail.com>
Date: Fri, 5 Jan 2007 10:05:15 +0200
From: "Adrian Hunter" <hunter.programmer@gmail.com>
To: kyungmin.park@samsung.com
Subject: Re: OneNAND: read-while-load
In-Reply-To: <30559532.90311167981321931.JavaMail.weblogic@ep_ml22>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <30559532.90311167981321931.JavaMail.weblogic@ep_ml22>
Cc: Josh Boyer <jwboyer@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 1/5/07, Kyungmin Park <kyungmin.park@samsung.com> wrote:
> Hi,
>
> it looks good to me. except one
>
> > +     /* Read-while-load method */
> >
> > +     /* Do first load to bufferRAM */
> > +     if (read < len) {
>
> I think it is alway true. Is there any case that sends zero 'len' from upper layer?
>
> I will run regression test with this one during this weekend.
>
> And which program (JFFS2 or UBI) do you use.
>
> I can't find any performance increase in JFFS2
>
> Here's my test results
>
> Target: Apollon (OMAP2) 330MHz, OneNAND 83MHz with Sync. Burst Read support mode
>
> # iozone -U /jffs2 -f /jffs2/test -e -A -s 10m -q 256k
>
> Before patch
>
>               KB  reclen   write rewrite    read    reread
>            10240       4    5961    5942    15667    15677
>            10240       8    6053    6033    15849    15830
>            10240      16    6068    6068    15983    15974
>            10240      32    6091    6088    16098    16083
>            10240      64    6115    6077    16128    16111
>            10240     128    6142    6134    16249    16226
>            10240     256    6138    6147    16184    16212
>
> After patch
>
>               KB  reclen   write rewrite    read    reread
>            10240       4    5931    5914    15598    15577
>            10240       8    6035    5941    15775    15743
>            10240      16    6070    6037    16020    15986
>            10240      32    6098    6081    16140    16115
>            10240      64    6123    6100    16123    16108
>            10240     128    6147    6102    16186    16188
>            10240     256    6134    6114    16142    16152
>
>
> Thank you,
> Kyungmin Park

I will need to study your results more closely, however you won't see
results unless you can exclude the effects of buffering.  I tested
used jffs2 but I used a very simple program that un-mounted and
re-mounted before reading.
