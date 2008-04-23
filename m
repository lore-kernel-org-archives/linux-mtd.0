Received: from hu-out-0506.google.com ([72.14.214.238])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JogqV-0006pP-LH
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 15:25:20 +0000
Received: by hu-out-0506.google.com with SMTP id 34so1639500hui.22
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Apr 2008 08:25:16 -0700 (PDT)
Message-ID: <fe810cf0804230825n21944ae3p4174512c2c0f9589@mail.gmail.com>
Date: Wed, 23 Apr 2008 19:25:16 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH][JFFS2] Fix garbage collector block search
In-Reply-To: <1208961030.9212.806.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <E1J2Trs-000IFE-00.abelyako-mail-ru@f65.mail.ru>
	<fe810cf0801150424j25f35131v83692a3193a45a3b@mail.gmail.com>
	<20080115133350.GA22338@lazybastard.org>
	<fe810cf0801180828g7a48b6a1u69e35f832185b5eb@mail.gmail.com>
	<1208882833.9212.629.camel@pmac.infradead.org>
	<fe810cf0804230431m2bf80e83h4fa71bd5887b7587@mail.gmail.com>
	<1208950350.9212.791.camel@pmac.infradead.org>
	<fe810cf0804230608t1183dbf4l99b168476875bfc0@mail.gmail.com>
	<1208959286.9212.799.camel@pmac.infradead.org>
	<1208961030.9212.806.camel@pmac.infradead.org>
Cc: Alexander Belyakov <abelyako@mail.ru>,
	=?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	KaiGai Kohei <kaigai@ak.jp.nec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 23, 2008 at 6:30 PM, David Woodhouse <dwmw2@infradead.org> wrote:
> On Wed, 2008-04-23 at 15:01 +0100, David Woodhouse wrote:
>  > Hm, I can't make it fail. I'm using nandsim, and have enabled the
>  > 'Museum IDs' so that I can have a 4MiB device (I've also tried 2MiB).
>
>  Hm. I had to disable XATTR support and _now_ I can make it fail. I can
>  watch my patch do the right thing, so I'll commit it. Thanks for the
>  diagnosis.

Good. You're welcome.

>
>  Not sure why it wasn't failing with XATTR enabled. At first glance I
>  think it was because all the blocks were going on the very_dirty_list
>  instead of the erasable_pending_wbuf_list, when I deleted the file.
>  I hope we don't have a space leak with XATTRs.
>

Continuously running script from my previous message, I've just
noticed that space leak does exist. Available space (reported by df)
decreases with each iteration. I've not investigated this in details
yet, but it seems the behavior is the same for XATTR support enabled
and disabled.

Thanks,
Alexander
