Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pd01L-0001uA-Ci
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2011 12:41:48 +0000
Received: by fxm19 with SMTP id 19so489171fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Jan 2011 04:41:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20110112124033.GF7105@axis.com>
References: <1294745619-7142-1-git-send-email-dbaryshkov@gmail.com>
	<1294745619-7142-4-git-send-email-dbaryshkov@gmail.com>
	<20110112124033.GF7105@axis.com>
Date: Wed, 12 Jan 2011 15:41:40 +0300
Message-ID: <AANLkTinrQ_V6ueOgLpTcEMK2obFq=LMSfw-83K_Vvi=6@mail.gmail.com>
Subject: Re: [PATCH 4/5] CRIS: stop checking for MTD_CONCAT
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Jesper Nilsson <jesper.nilsson@axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Stefan Roese <sr@denx.de>, David Woodhouse <dwmw2@infradead.org>,
	linux-cris-kernel <linux-cris-kernel@axis.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 12, 2011 at 3:40 PM, Jesper Nilsson <jesper.nilsson@axis.com> wrote:
> On Tue, Jan 11, 2011 at 12:33:38PM +0100, Dmitry Eremin-Solenikov wrote:
>> As MTD_CONCAT support is becoming an integral part of MTD core,
>> there is no need for it's special treatment. So stop checking for
>> MTD_CONCAT availability.
>>
>> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>
> Looks good, I'll pull this patch into the cris-tree.

Thanks! Please note that it depends however on other MTD patches from
this serie.

>
> Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>
>


-- 
With best wishes
Dmitry
