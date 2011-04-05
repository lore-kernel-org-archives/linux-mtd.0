Received: from nbd.name ([46.4.11.11])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q75nq-0003p9-AS
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 12:56:14 +0000
Message-ID: <4D9B11C5.3030308@openwrt.org>
Date: Tue, 05 Apr 2011 14:57:41 +0200
From: John Crispin <blogic@openwrt.org>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH V7] MIPS: lantiq: add NOR flash support
References: <1302006830-10345-1-git-send-email-blogic@openwrt.org>
	<1302006995.2760.120.camel@localhost>
In-Reply-To: <1302006995.2760.120.camel@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>,
	Ralph Hempel <ralph.hempel@lantiq.com>, linux-mtd@lists.infradead.org,
	Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>> +
>> +static int ltq_mtd_probing;
>>     
> ... I'm worried about this global variable. If you have multiple
> instances of such NOR flash, then you theoretically may have a situation
> when one of them is being probed, while another is being used for real.
> And this single global switch will break the one which is used for real.
>
> IOW, the right solution would be to have per-chip flag, not a global
> flag.
>
>   

Hi,

we could dynamically allocate the instance of struct map_info and then
use map_priv_1 to indicate whether the device is probing or not.

this would avoid using a global variable

John
