Received: from na3sys009aog122.obsmtp.com ([74.125.149.147])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QvUH2-00060j-MV
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2011 13:10:41 +0000
Received: by vxj2 with SMTP id 2so5055261vxj.8
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Aug 2011 06:10:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1313482105.5993.1.camel@sauron>
References: <CAKa7sPRir5YTdPCYAHEYvPGA5GhfTuyv0Z9ynDUtEmy=YHA2XQ@mail.gmail.com>
	<1313424117.8691.19.camel@sauron>
	<CAKa7sPSB+p6Zxk8uM9famKsg_Bhdv7=LirUimaV+Jti2aRRPZA@mail.gmail.com>
	<1313482105.5993.1.camel@sauron>
Date: Mon, 22 Aug 2011 09:10:28 -0400
Message-ID: <CAPcSpEJNCFYZ=4wjhpEcR_Fm0wrByg2HcmKKKWhbu9-j6N_sJw@mail.gmail.com>
Subject: Re: UBI FS on 2MiB eraseblock Hynix MLC NAND
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: Viktar Palstsiuk <viktar.palstsiuk@promwad.com>, dedekind1@gmail.com
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

Hi Viktar, Artem,

On Tue, Aug 16, 2011 at 4:08 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Tue, 2011-08-16 at 10:48 +0300, Viktar Palstsiuk wrote:
>> [...]
> This solution is not acceptable as we are currently discussing in the
> "GPMI-NAND Status" thread in this mailing list.
>
> Instead, you should just change u-boot, and I believe someone has done
> this recently - ask the u-boot mailing list. I think that was Ben -
> CCed.

Yep. That was me (with some critical help from others of course).

The problem to which you (Viktar) are refferring is certainly not
limited to hynix, 2mib or mlc. I agree with Artem's assessment: use
the new 'nand write.trimffs'  command in u-boot or use the fixup flag
in your ubi images.

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca
