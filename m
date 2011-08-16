Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QtFLl-0000Mi-CR
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2011 08:50:18 +0000
Received: by iyf13 with SMTP id 13so9350903iyf.16
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Aug 2011 01:50:15 -0700 (PDT)
MIME-Version: 1.0
Sender: vipals@gmail.com
In-Reply-To: <1313482105.5993.1.camel@sauron>
References: <CAKa7sPRir5YTdPCYAHEYvPGA5GhfTuyv0Z9ynDUtEmy=YHA2XQ@mail.gmail.com>
	<1313424117.8691.19.camel@sauron>
	<CAKa7sPSB+p6Zxk8uM9famKsg_Bhdv7=LirUimaV+Jti2aRRPZA@mail.gmail.com>
	<1313482105.5993.1.camel@sauron>
From: Viktar Palstsiuk <viktar.palstsiuk@promwad.com>
Date: Tue, 16 Aug 2011 11:49:35 +0300
Message-ID: <CAKa7sPTi1e+J_G55f_km3mXBEMdyCB6AcTtnwYbxr9haQ1Y+gw@mail.gmail.com>
Subject: Re: UBI FS on 2MiB eraseblock Hynix MLC NAND
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 16, 2011 at 11:08 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> The alternative is to use the new UBIFS "fixup" feature, see
> http://www.linux-mtd.infradead.org/faq/ubifs.html#L_free_space_fixup

Does UBIFS fixup works on 2.6.39.2 or should I switch to kernel version 3.0?

Best regards,
Viktar Palstsiuk
