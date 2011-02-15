Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PpLYv-0003KA-1V
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2011 14:07:29 +0000
Received: by vws5 with SMTP id 5so109860vws.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Feb 2011 06:07:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <201101121425.49587.sr@denx.de>
References: <1294745619-7142-1-git-send-email-dbaryshkov@gmail.com>
	<201101121425.49587.sr@denx.de>
Date: Tue, 15 Feb 2011 17:07:27 +0300
Message-ID: <AANLkTi=TP7T-vt_vgacRPOgGWvhHPqKkEggQNDmPDkY3@mail.gmail.com>
Subject: Re: [PATCH 1/5] MTD: make MTD_CONCAT support mandatory
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Stefan Roese <sr@denx.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Wed, Jan 12, 2011 at 4:25 PM, Stefan Roese <sr@denx.de> wrote:
> On Tuesday 11 January 2011 12:33:35 Dmitry Eremin-Solenikov wrote:
>> Move mtdconcat to be an integral part of the mtd core. It's a tiny bit
>> of code, which bears 'say Y if you don't know what to do' note in the
>> Kconfig. OTOH there are several ugly ifdefs depending on the MTD_CONCAT.
>> So, making MTD_CONCAT support mandatory will allow us to clean up code a
>> lot.
>>
>> Kconfig entry is changed to be a bool defaulting to Y, so all code
>> pieces depending on it, will have MTD_CONCAT Kconfig symbol and
>> CONFIG_MTD_CONCAT define. This will be removed in one of next patches.
>
> Whole patch series looks good. Thanks. I'm not sure if it makes more sense to
> squash the MTD patches into one patch. Either way I'm fine with it, so:
>
> Acked-by: Stefan Roese <sr@denx.de>
>
> for the whole patch series.

What about this series? Will it find it's way to kernel or should I do
some more steps?

-- 
With best wishes
Dmitry
