Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OxZrh-0007BK-5E
	for linux-mtd@lists.infradead.org; Mon, 20 Sep 2010 06:28:38 +0000
Received: by pvg12 with SMTP id 12so1462822pvg.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 19 Sep 2010 23:28:34 -0700 (PDT)
Message-ID: <4C96FF10.2010805@gmail.com>
Date: Sun, 19 Sep 2010 23:28:32 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH v4] mtd: nand: Expand nand_ecc_layout, deprecate ioctl
	ECCGETLAYOUT
References: <4C5CA4A1.1040000@broadcom.com>	
	<1282154806-9420-1-git-send-email-norris@broadcom.com>	
	<4C6DD170.1060807@renesas.com> <4C6E9C23.6060703@broadcom.com>	
	<1282646703.24044.162.camel@localhost>
	<4C746DE0.7000104@gmail.com>	 <1283163647.12995.43.camel@brekeke>
	<1284830690.1721.3.camel@brekeke>
In-Reply-To: <1284830690.1721.3.camel@brekeke>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	Sneha Narnakaje <nsnehaprabha@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Now that I've finally gotten around to working on this, I have questions
and comments.

On 9/18/2010 10:24 AM, Artem Bityutskiy wrote:
> On Mon, 2010-08-30 at 13:20 +0300, Artem Bityutskiy wrote:
>> On Tue, 2010-08-24 at 18:12 -0700, Brian Norris wrote:
>>> My e-mail address has changed, since I am no longer working at Broadcom.
>>> I will still be able to track messages to my old account if the MTD mailing
>>> list is CC'd.
>>
>> Oh, does it mean you will stop loving MTD and we won't see steady flow
>> of improvements for you? :-( BTW, I think you have been doing great job
>> - MTD subsystem needs love badly!

No, this doesn't mean I will stop loving MTD, although as may be readily
apparent by my delay, I may work a bit slower :) In fact, I will
probably be picking up some more work shortly.

>>> +/*
>>> + * Copies (and truncates, if necessary) data from the larger struct,
>>> + * nand_ecclayout, to the smaller, deprecated layout struct,
>>> + * nand_ecclayout_user. This is necessary only to suppport the deprecated
>>> + * API ioctl ECCGETLAYOUT while allowing all new functionality to use
>>> + * nand_ecclayout flexibly (i.e. the struct may change size in new
>>> + * releases without requiring major rewrites).
>>> + */
>>
>> I think a similar comment should exist in linux/mtd/mtd.h. Indeed, that
>> file is our API with user-space, and our users will probably look at it,
>> and it is nice to document the situation with 'struct
>> nand_ecclayout_user' there.

>From the context, I assume you meant include/mtd/mtd-abi.h, not
linux/mtd/mtd.h; am I correct?

I will send the patch out shortly under the assumption that I am correct.

Brian
