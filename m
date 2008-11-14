Received: from wf-out-1314.google.com ([209.85.200.173])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L13Co-000459-UD
	for linux-mtd@lists.infradead.org; Fri, 14 Nov 2008 18:15:43 +0000
Received: by wf-out-1314.google.com with SMTP id 28so1458206wfc.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Nov 2008 10:15:41 -0800 (PST)
Message-ID: <8bd0f97a0811141015j1bd862a3n268e522e4369a39c@mail.gmail.com>
Date: Fri, 14 Nov 2008 13:15:40 -0500
From: "Mike Frysinger" <vapier.adi@gmail.com>
To: "Atsushi Nemoto" <anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH v2] mtd: unify mtd partition/device registration
In-Reply-To: <20081114.232742.128619046.anemo@mba.ocn.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1226665351-20226-1-git-send-email-vapier@gentoo.org>
	<20081114.232742.128619046.anemo@mba.ocn.ne.jp>
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

On Fri, Nov 14, 2008 at 09:27, Atsushi Nemoto wrote:
> On Fri, 14 Nov 2008 07:22:31 -0500, Mike Frysinger wrote:
>> Rather than having every map/mtd driver doing the same sequence of
>> registering partitions and/or devices, implement common parse_mtd().
>>
>> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>> ---
>> v2:
>>       - ifdef parsers in parse_mtd()
>>       - add "always_whole" to parse_mtd()
>>       - add unparse_mtd()
>>
>>  drivers/mtd/mtdcore.c   |   60 +++++++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/mtd/mtd.h |    5 ++++
>>  2 files changed, 65 insertions(+), 0 deletions(-)
>
> Though not tested yet on real hardware, all patches looks OK for me.

ive tested the various code paths with physmap on my BF548-EZKIT ...
seemed to work OK ...
-mike
