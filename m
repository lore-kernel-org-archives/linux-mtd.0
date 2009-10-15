Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MyId5-0002DJ-VT
	for linux-mtd@lists.infradead.org; Thu, 15 Oct 2009 05:12:04 +0000
Received: by yxe5 with SMTP id 5so583064yxe.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Oct 2009 22:11:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20091014171240.49d0963f@marrow.netinsight.se>
References: <20091012113758.GB11035@elte.hu> <20091012131528.GC25464@elte.hu>
	<20091012153937.0dcd73e5@marrow.netinsight.se>
	<alpine.LFD.2.01.0910120828390.3438@localhost.localdomain>
	<20091012110954.67d7d8d8.akpm@linux-foundation.org>
	<20091012182346.GH17138@elte.hu>
	<alpine.LFD.2.01.0910121130190.3438@localhost.localdomain>
	<20091014153458.05e31db6@marrow.netinsight.se>
	<20091014154124.5d9c366e@marrow.netinsight.se>
	<20091014171240.49d0963f@marrow.netinsight.se>
From: vimal singh <vimal.newwork@gmail.com>
Date: Thu, 15 Oct 2009 10:41:39 +0530
Message-ID: <ce9ab5790910142211v54c70deet8c5732cfccb01914@mail.gmail.com>
Subject: Re: [PATCH v6 5/5]: mtdoops: refactor as a kmsg_dumper
To: Simon Kagstrom <simon.kagstrom@netinsight.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	linux-mtd <linux-mtd@lists.infradead.org>, Ingo Molnar <mingo@elte.hu>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 14, 2009 at 8:42 PM, Simon Kagstrom
<simon.kagstrom@netinsight.net> wrote:
> On Wed, 14 Oct 2009 15:41:24 +0200
> Simon Kagstrom <simon.kagstrom@netinsight.net> wrote:
>
>> -static void __exit mtdoops_console_exit(void)
>> +static void __exit mtdoops_exit(void)
>> =A0{
>> =A0 =A0 =A0 struct mtdoops_context *cxt =3D &oops_cxt;
>>
>> =A0 =A0 =A0 unregister_mtd_user(&mtdoops_notifier);
>> - =A0 =A0 unregister_console(&mtdoops_console);
>> =A0 =A0 =A0 kfree(cxt->name);
>
> The kfree should go as well since cxt->name is no longer allocated. I'll
> await further comments and send a new patch tomorrow.
>
Help description for 'MTD_OOPS' in Kconfig needs update after this
patch. Are you planning to add a patch for same in this series?

-vimal

> // Simon
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
