Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTXqV-0002QQ-SV
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 11:19:48 +0000
Received: by vxd2 with SMTP id 2so3535766vxd.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 04:19:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1307358294.3112.38.camel@localhost>
References: <1307351782-7456-1-git-send-email-dbaryshkov@gmail.com>
	<1307358294.3112.38.camel@localhost>
Date: Mon, 6 Jun 2011 15:19:44 +0400
Message-ID: <BANLkTinUq_V_QkGDm6ejtGQ7Gnq1K8EHmA@mail.gmail.com>
Subject: Re: [PATCH 01/32] mtd: mtd_dataflash don't specify default parsing
	options
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: dedekind1 <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Mon, Jun 6, 2011 at 3:04 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Mon, 2011-06-06 at 13:15 +0400, Dmitry Eremin-Solenikov wrote:
>> Since 'cmdline, NULL' is now a default for parse_mtd_partitions, don't specify
>> this in every driver, instead pass NULL to force parse_mtd_partitions
>> to use default.
>>
>> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>
> Do you have a git URL with these patches?

Yes. Unfortunately git.kernel.org syncs too slow now, so the kernel
wasn't available
at the time of sending an e-mail.

Here it goes:

The following changes since commit 099fbd4fd91fde9748d9ad927e59b6c36a2651cf:

  mtd: drop mtd_has_cmdlinepart() (2011-06-06 10:31:22 +0300)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/lumag/mtd-cleanup.git
mtd-cleanup-cmdline

-- 
With best wishes
Dmitry
