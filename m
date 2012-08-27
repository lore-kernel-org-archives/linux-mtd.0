Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5tfT-00051O-Fk
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2012 07:23:28 +0000
Received: by lagu2 with SMTP id u2so2214402lag.36
 for <linux-mtd@lists.infradead.org>; Mon, 27 Aug 2012 00:23:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345714184.2848.220.camel@sauron.fi.intel.com>
References: <1345651477-5301-1-git-send-email-richard.genoud@gmail.com>
 <1345651477-5301-4-git-send-email-richard.genoud@gmail.com>
 <1345714184.2848.220.camel@sauron.fi.intel.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 27 Aug 2012 09:23:04 +0200
Message-ID: <CACQ1gAi4uJkiYyfUsnv-k9M8Me1ROzCbe6msoLV=4qn=gL0tTA@mail.gmail.com>
Subject: Re: [PATCH MTD-UTILS v2 3/4] ubiattach: introduce max_beb_per1024 in
 UBI_IOCATT
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/8/23 Artem Bityutskiy <dedekind1@gmail.com>:
> On Wed, 2012-08-22 at 18:04 +0200, Richard Genoud wrote:
>> The ioctl UBI_IOCATT has been extended with max_beb_per1024 parameter.
>>
>> This parameter is used for adjusting the "maximum expected number of
>> bad blocks per 1024 blocks" for each mtd device.
>> The number of physical erase blocks (PEB) that UBI will reserve for bad
>> block handling is now:
>> whole_flash_chipset__PEB_number * max_beb_per1024 / 1024
>
> Pushed this one with some amendments.

Hi Artem,

Could you push your git to mtd-utils so that I can test the final
version, please ?

Best regards,
Richard.
