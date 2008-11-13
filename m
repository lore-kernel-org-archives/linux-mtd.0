Received: from rn-out-0910.google.com ([64.233.170.191])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L0dTK-0007Cq-0W
	for linux-mtd@lists.infradead.org; Thu, 13 Nov 2008 14:47:02 +0000
Received: by rn-out-0910.google.com with SMTP id m7so892005rnd.3
	for <linux-mtd@lists.infradead.org>;
	Thu, 13 Nov 2008 06:47:01 -0800 (PST)
Message-ID: <8bd0f97a0811130647qeb5aea4tdc115f283bc352d@mail.gmail.com>
Date: Thu, 13 Nov 2008 09:47:00 -0500
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Atsushi Nemoto" <anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH] mtd: unify mtd partition/device registration
In-Reply-To: <20081113.224350.18312549.anemo@mba.ocn.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1226533133-7405-1-git-send-email-vapier@gentoo.org>
	<20081113.224350.18312549.anemo@mba.ocn.ne.jp>
Cc: linux-mtd@lists.infradead.org, vapier@gentoo.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 13, 2008 at 08:43, Atsushi Nemoto wrote:
> On Wed, 12 Nov 2008 18:38:53 -0500, Mike Frysinger wrote:
>> +int parse_mtd(struct mtd_info *mtd, const char **probe_types,
>> +              struct mtd_partition *parts, int nr_parts)
>> +{
>> +#ifdef CONFIG_MTD_PARTITIONS
>> +     const char *default_part_probe_types[] = {
>> +             "cmdlinepart",
>> +             "RedBoot",
>> +             NULL
>> +     };
>
> But I'm not sure this default_part_probe_types is appropriate.
>
> How about enclose each parser with #ifdefs?
>
>        const char *default_part_probe_types[] = {
> #ifdef CONFIG_MTD_CMDLINE_PARTS
>                "cmdlinepart",
> #endif
> #ifdef CONFIG_MTD_REDBOOT_PARTS
>                "RedBoot",
> #endif
>                NULL
>        };
>
> This get rid of "RedBoot partition parsing not available" noise in
> boot message when you use default_part_probe_types without
> MTD_REDBOOT_PARTS.

yeah, that parsing thing is annoying, but i didnt think enough so to
add ifdef's.  i'm fine with it either way.
-mike
